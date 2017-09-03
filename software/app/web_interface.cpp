/*
 * web_interface.cpp
 *
 *  Created on: Aug 6, 2017
 *      Author: Elmar
 */

#include "web_interface.h"
#include <application.h>
#include <SmingCore/SmingCore.h>
#include <SmingCore/Network/WebConstants.h>
#include <SmingCore/FileSystem.h>
#include <third-party/http-parser/http_parser.h>
#include <SmingCore/Network/Http/Websocket/WebsocketResource.h>

namespace rijnfel {

cWebInterface *cWebInterface::s_instance = 0;

static void onIndex(HttpRequest & i_request, HttpResponse & i_response) {
	cWebInterface::GetInstance()->OnIndex(i_request, i_response);
}

static void onRefresh(HttpRequest & i_request, HttpResponse & i_response) {
	cWebInterface::GetInstance()->OnRefresh(i_request, i_response);
}

static void onConfiguration(HttpRequest &request, HttpResponse &response) {
	cWebInterface::GetInstance()->OnConfiguration(request, response);
}

static void onConfiguration_json(HttpRequest &request, HttpResponse &response) {
	cWebInterface::GetInstance()->OnConfiguration_json(request, response);
}

void wsConnected(WebSocketConnection& socket) {
	cWebInterface::GetInstance()->m_connectedUser = &socket;
	Serial.printf("Connection!");
}

void wsMessageReceived(WebSocketConnection& socket, const String& message) {
	if (message.equals("start")) {
		StartSensorStation(1);
		cWebInterface::GetInstance()->m_sendWebsocket = true;
	} else {
		StopSensorStation();
		cWebInterface::GetInstance()->m_sendWebsocket = false;
	}
	if (message.equals("ch1")) {
		ChangeSampleChannel(1);
	} else if (message.equals("ch2")) {
		ChangeSampleChannel(2);
	} else if (message.equals("ch3")) {
		ChangeSampleChannel(3);
	} else if (message.equals("ch4")) {
		ChangeSampleChannel(4);
	}
}

void wsDisconnected(WebSocketConnection& socket) {
	cWebInterface::GetInstance()->m_connectedUser = NULL;
}

cWebInterface::cWebInterface() :
		m_serverStarted(false), m_adcAverage { { this }, { this }, { this }, { this } }, m_sensorValRaw(this), m_connectedUser(
		NULL), m_sendWebsocket(false) {
	for (int i = 0; i < 4; i++) {
		m_adcAverageVal[i] = 0;
	}

}

void onFile(HttpRequest & i_request, HttpResponse & i_response) {
	String file = i_request.getPath();
	if (file[0] == '/')
		file = file.substring(1);

	if (file[0] == '.')
		i_response.forbidden();
	else {
		i_response.setCache(86400, true); // It's important to use cache for better performance.
		i_response.sendFile(file);
	}
}

static void onChannel(HttpRequest & i_request, HttpResponse & i_response) {
	//cWebInterface::GetInstance()->OnFile(i_request, i_response);
}

void cWebInterface::StartServer() {
	if (m_serverStarted)
		return;
	WebsocketResource* wsResource = new WebsocketResource();
	wsResource->setConnectionHandler(wsConnected);
	wsResource->setMessageHandler(wsMessageReceived);
	wsResource->setDisconnectionHandler(wsDisconnected);
	m_server.addPath("/", onIndex);
	m_server.addPath("/channel", onChannel);
	m_server.addPath("/state", onRefresh);
	m_server.addPath("/config", onConfiguration);
	m_server.addPath("/config.json", onConfiguration_json);
	m_server.addPath("/ws", wsResource);
	m_server.setDefaultHandler(onFile);
	m_server.listen(80);

}

void cWebInterface::StopServer() {
	if (!m_serverStarted)
		return;
	m_serverStarted = false;
}

void cWebInterface::OnIndex(HttpRequest &i_request, HttpResponse & i_response) {
	i_response.setCache(86400, true); // It's important to use cache for better performance.
	i_response.sendFile("index.html");
}

void cWebInterface::OnRefresh(HttpRequest & i_request, HttpResponse & i_response) {
	JsonObjectStream* stream = new JsonObjectStream();
	JsonObject& json = stream->getRoot();

	json["adc_1"] = m_adcAverageVal[0];
	json["adc_2"] = m_adcAverageVal[1];
#ifdef REV_1
	json["adc_3"] = m_adcAverageVal[3];
	json["adc_4"] = m_adcAverageVal[2];
#else
	json["adc_3"] = m_adcAverageVal[2];
	json["adc_4"] = m_adcAverageVal[3];
#endif
	i_response.sendJsonObject(stream);
}

void cWebInterface::OnRawUpdate(HttpRequest& i_request, HttpResponse& i_response) {
}

void cWebInterface::ReceiveCallback(void* i_data, cDataReceiver* i_receiver) {
	if (i_receiver == &m_sensorValRaw) {
		if (m_connectedUser != NULL && m_sendWebsocket) {
			sSizedArray * arr = static_cast<sSizedArray *>(i_data);
			Serial.printf("Web Size: %d\n", arr->size);
			char buf[12];
			for (size_t i = 0; i < arr->size; i++) {
				sprintf(buf, "%d,", arr->u_array[i]);
				const String sendString(buf);
				m_connectedUser->sendString(sendString);
				if (i % 10 == 0)
					WDT.alive();
			}
		}
	} else {
		for (int i = 0; i < 4; i++) {
			if (i_receiver == &m_adcAverage[i]) {
				m_adcAverageVal[i] = *static_cast<int32_t *>(i_data);
				PrintValues();
				break;
			}
		}
	}
}

void cWebInterface::PrintValues() {
	Serial.printf("c[0]: %d c[1]: %d c[2]: %d c[3]: %d\n\r", m_adcAverageVal[0], m_adcAverageVal[1], m_adcAverageVal[2],
			m_adcAverageVal[3]);
}

cWebInterface::~cWebInterface() {
	// TODO Auto-generated destructor stub
}

void cWebInterface::ResetRawValues() {
	/*
	 for (int channel = 0; channel < 4; channel++) {
	 for (int sample = 0; sample < 1000; sample++) {
	 m_adc_values_raw[channel][sample] = 0;
	 }
	 }
	 */
}

void cWebInterface::OnConfiguration(HttpRequest &request, HttpResponse &response) {

	if (request.method == http_method::HTTP_POST) {
		//debugf("Update config");
		// Update config
		if (request.getBody() == NULL) {
			Serial.println(request.getPostParameter("StaSSID"));
			//debugf("NULL bodyBuf");
			return;
		} else {
			StaticJsonBuffer<200> jsonBuffer;
			JsonObject& root = jsonBuffer.parseObject(request.getBody());
			//root.prettyPrintTo(Serial); //Uncomment it for debuging

			/* if (root["StaSSID"].success()) // Settings
			 {
			 uint8_t PrevStaEnable = ActiveConfig.StaEnable;

			 ActiveConfig.StaSSID = String((const char *)root["StaSSID"]);
			 ActiveConfig.StaPassword = String((const char *)root["StaPassword"]);
			 ActiveConfig.StaEnable = root["StaEnable"];

			 if (PrevStaEnable && ActiveConfig.StaEnable)
			 {
			 WifiStation.enable(true);
			 WifiAccessPoint.enable(false);
			 WifiStation.config(ActiveConfig.StaSSID, ActiveConfig.StaPassword);
			 }
			 else if (ActiveConfig.StaEnable)
			 {
			 WifiStation.enable(true, true);
			 WifiAccessPoint.enable(false, true);
			 WifiStation.config(ActiveConfig.StaSSID, ActiveConfig.StaPassword);
			 }
			 else
			 {
			 WifiStation.enable(false, true);
			 WifiAccessPoint.enable(true, true);
			 WifiAccessPoint.config("TyTherm", "ENTERYOURPASSWD", AUTH_WPA2_PSK);
			 }
			 }*/
		}
		//saveConfig(ActiveConfig);
	} else {
		response.setCache(86400, true); // It's important to use cache for better performance.
		response.sendFile("config.html");
	}
}

void cWebInterface::OnConfiguration_json(HttpRequest &request, HttpResponse &response) {
	JsonObjectStream* stream = new JsonObjectStream();
	JsonObject& json = stream->getRoot();

	json["StaSSID"] = 22;
	json["StaPassword"] = 23;
	json["StaEnable"] = 24;

	response.sendJsonObject(stream);
}

} /* namespace rijnfel */

