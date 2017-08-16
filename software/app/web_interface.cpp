/*
 * web_interface.cpp
 *
 *  Created on: Aug 6, 2017
 *      Author: Elmar
 */

#include "web_interface.h"
#include <SmingCore/SmingCore.h>
#include <SmingCore/Network/WebConstants.h>

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

cWebInterface::cWebInterface() :
		m_serverStarted(false) {
	for (int i = 0; i < 4; i++) {
		m_adc_value_average[i] = 0;
	}
	// Integer requires 8 digits, and one for the comma
	m_jsonBuffer = new char[RAW_SAMPLES * 8 + RAW_SAMPLES * 2];
	if (m_jsonBuffer == NULL) {
		Serial.print("Not enough ram");
	}
	// TODO Auto-generated constructor stub

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

void cWebInterface::StartServer() {
	if (m_serverStarted)
		return;
	m_server.addPath("/", onIndex);
	m_server.addPath("/state", onRefresh);
	m_server.addPath("/config", onConfiguration);
	m_server.addPath("/config.json", onConfiguration_json);
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

	json["adc_1"] = m_adc_value_average[0];
	json["adc_2"] = m_adc_value_average[1];
#ifdef REV_1
	json["adc_3"] = m_adc_value_average[3];
	json["adc_4"] = m_adc_value_average[2];
#else
	json["adc_3"] = m_adc_value_average[2];
	json["adc_4"] = m_adc_value_average[3];
#endif

	char * writePos = m_jsonBuffer;
	for (int sample = 0; sample < m_adc_values_raw_cnt[RAW_CHANNEL]; sample++) {
		const int pos = sprintf(writePos, "%d,", m_adc_values_raw[RAW_CHANNEL][sample]);
		writePos = &m_jsonBuffer[pos];
	}/*
	 json["raw_adc"] = m_jsonBuffer; //ss.str();
	 */
	i_response.sendJsonObject(stream);
	m_adc_values_raw_cnt[RAW_CHANNEL] = 0;
}

void cWebInterface::OnRawUpdate(HttpRequest& i_request, HttpResponse& i_response) {
}

void cWebInterface::UpdateAdc(cADC<ads::ads_sample_t, int32_t> & i_adc, cDoubleBuffer<ads::ads_sample_t>& i_adcBuffer) {
	ads::ads_sample_t * buf = &i_adcBuffer.GetReadyBuffer()[0];
	if (buf != NULL) {
		int pos = buf->mux - ads::eInputMux::AIN_0;
		int64_t average = 0;
		int size = i_adcBuffer.GetSize();
		for (int i = 0; i < size; i++) {
			average += i_adc.ConvertSample(buf[i]);

			if (pos == RAW_CHANNEL) {
				int idx = m_adc_values_raw_cnt[RAW_CHANNEL];
				if (idx < RAW_SAMPLES) {
					m_adc_values_raw[RAW_CHANNEL][idx] = i_adc.ConvertSample(buf[i]);
					m_adc_values_raw_cnt[RAW_CHANNEL]++;
				}
			}
		}
		if (size != 0) {
			average /= size;
		}

		m_adc_value_average[pos] = static_cast<int32_t>(average);
	}
}
void cWebInterface::PrintValues() {
	Serial.printf("c[0]: %d c[1]: %d c[2]: %d c[3]: %d\n\r", m_adc_value_average[0], m_adc_value_average[1],
			m_adc_value_average[2], m_adc_value_average[3]);
}

void cWebInterface::UpdateTemp(cDoubleBuffer<uint32_t>& i_tempBuffer) {
}

cWebInterface::~cWebInterface() {
	// TODO Auto-generated destructor stub
}

void cWebInterface::ResetRawValues() {
	for (int channel = 0; channel < 4; channel++) {
		for (int sample = 0; sample < 1000; sample++) {
			m_adc_values_raw[channel][sample] = 0;
		}
	}
}

void cWebInterface::OnConfiguration(HttpRequest &request, HttpResponse &response) {

	if (strcmp(request.getRequestMethod().c_str(), RequestMethod::POST) == 0) {
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

	response.sendDataStream(stream, ContentType::JSON);
}

} /* namespace rijnfel */

