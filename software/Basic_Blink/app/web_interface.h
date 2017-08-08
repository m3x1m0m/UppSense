/*
 * web_interface.h
 *
 *  Created on: Aug 6, 2017
 *      Author: Elmar
 */

#ifndef APP_WEB_INTERFACE_H_
#define APP_WEB_INTERFACE_H_

#include "adc.h"
#include "ads101x.h"
#include "double_buffer.h"
#include <SmingCore/SmingCore.h>

namespace rijnfel {

class cWebInterface {
public:
	static cWebInterface *s_instance;
	static cWebInterface *GetInstance() {
		if (cWebInterface::s_instance == NULL)
			cWebInterface::s_instance = new cWebInterface();
		return cWebInterface::s_instance;
	}
public:
	cWebInterface();
	cWebInterface(cWebInterface const&) {
		m_serverStarted = false;
	}
	cWebInterface& operator=(cWebInterface const&) {
	}
	void Start();
	void Stop();
	void UpdateAdc(cADC<ads::ads_sample_t, int32_t> & adc,
			cDoubleBuffer<ads::ads_sample_t> & adcBuffer);
	void UpdateTemp(cDoubleBuffer<uint32_t> & adcBuffer);
	void PrintValues();
	virtual ~cWebInterface();
public:
	void OnIndex(HttpRequest &request, HttpResponse &response);
	void OnRefresh(HttpRequest &request, HttpResponse &response);
private:
	bool m_serverStarted;
	int32_t m_adc_value[4];
	HttpServer server;

};

} /* namespace rijnfel */

#endif /* APP_WEB_INTERFACE_H_ */
