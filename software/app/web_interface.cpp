/*
 * web_interface.cpp
 *
 *  Created on: Aug 6, 2017
 *      Author: Elmar
 */

#include "web_interface.h"
#include <SmingCore/SmingCore.h>

//TODO remove this
#include "ads101x.h"

namespace rijnfel {

cWebInterface *cWebInterface::s_instance = 0;

static void onIndex(HttpRequest &request, HttpResponse &response) {
	cWebInterface::GetInstance()->OnIndex(request, response);
}

static void onRefresh(HttpRequest &request, HttpResponse &response) {
	cWebInterface::GetInstance()->OnRefresh(request, response);
}

cWebInterface::cWebInterface() :
		m_serverStarted(false) {
	for (int i = 0; i < 4; i++) {
		m_adc_value[i] = 0;
	}
	// TODO Auto-generated constructor stub

}

void onFile(HttpRequest &request, HttpResponse &response) {
	String file = request.getPath();
	if (file[0] == '/')
		file = file.substring(1);

	if (file[0] == '.')
		response.forbidden();
	else {
		response.setCache(86400, true); // It's important to use cache for better performance.
		response.sendFile(file);
	}
}

void cWebInterface::Start() {
	if (m_serverStarted)
		return;
	server.addPath("/", onIndex);
	server.addPath("/state", onRefresh);
	server.setDefaultHandler(onFile);
	server.listen(80);
}

void cWebInterface::Stop() {
	if (!m_serverStarted)
		return;
	m_serverStarted = false;
}

void cWebInterface::OnIndex(HttpRequest &request, HttpResponse &response) {
	response.setCache(86400, true); // It's important to use cache for better performance.
	response.sendFile("index.html");
}

void cWebInterface::OnRefresh(HttpRequest &request, HttpResponse &response) {
	JsonObjectStream* stream = new JsonObjectStream();
	JsonObject& json = stream->getRoot();

	json["adc_1"] = m_adc_value[0];
	json["adc_2"] = m_adc_value[1];
#ifdef REV_1
	json["adc_3"] = m_adc_value[3];
	json["adc_4"] = m_adc_value[2];
#else
	json["adc_3"] = m_adc_value[2];
	json["adc_4"] = m_adc_value[3];
#endif

	response.sendJsonObject(stream);
}

void cWebInterface::UpdateAdc(cADC<ads::ads_sample_t, int32_t> & adc,
		cDoubleBuffer<ads::ads_sample_t>& adcBuffer) {
	ads::ads_sample_t * buf = &adcBuffer.GetReadyBuffer()[0];
	if (buf != NULL) {
		ads::ads_sample_t averageSample;
		averageSample.gain = buf->gain;
		averageSample.mux = buf->mux;
		int64_t average = 0;
		//Serial.printf("Channel: %d\n\r", buf->mux - ads::eInputMux::AIN_0);
		int size = adcBuffer.GetSize();
		for (int i = 0; i < size; i++) {
			average += buf[i].rawSample;
			//Serial.printf("%d ", buf[i].rawSample);
		}
		//Serial.printf("\n\r before: %d", average);
		if (size != 0) {
			average /= size;
		}
		//Serial.printf("after: %d [%d]\n\r", average, size);

		averageSample.rawSample = static_cast<int16_t>(average);
		int pos = averageSample.mux - ads::eInputMux::AIN_0;
		m_adc_value[pos] = adc.ConvertSample(averageSample);
	}
}
void cWebInterface::PrintValues() {
	Serial.printf("c[0]: %d c[1]: %d c[2]: %d c[3]: %d\n\r", m_adc_value[0],
			m_adc_value[1], m_adc_value[2], m_adc_value[3]);
}

void cWebInterface::UpdateTemp(cDoubleBuffer<uint32_t>& adcBuffer) {
}

cWebInterface::~cWebInterface() {
	// TODO Auto-generated destructor stub
}

} /* namespace rijnfel */

