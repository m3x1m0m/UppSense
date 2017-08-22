/*
 * web_interface.h
 *
 *  Created on: Aug 6, 2017
 *      Author: Elmar
 */

#ifndef APP_WEB_INTERFACE_H_
#define APP_WEB_INTERFACE_H_

#include "adc.h"
//TODO remove this
#include "ads101x.h"
#include "dummy_adc.h"

#include "double_buffer.h"
#include <SmingCore/SmingCore.h>
#include "data_receiver.h"

namespace rijnfel {
#define RAW_CHANNEL 1
#define RAW_SAMPLES 1000
class cWebInterface: public cDataSink {
public:
	/**
	 * Returns the global cWebInterface instance.
	 * Only one webserver should ever be running
	 * @return global cWebInterface instance
	 */
	static cWebInterface *GetInstance() {
		if (cWebInterface::s_instance == NULL)
			cWebInterface::s_instance = new cWebInterface();
		return cWebInterface::s_instance;
	}

	/// Singleton instance
	static cWebInterface *s_instance;

public:
	/**
	 * Should not be used because it's a singleton
	 * @param delete
	 */
	cWebInterface(cWebInterface const&) = delete;

	/**
	 * Should not be used because it's a singleton
	 * @param delete
	 * @return delete
	 */
	cWebInterface& operator=(cWebInterface const&) = delete;

	/**
	 * Registers the paths and starts the server
	 */
	void StartServer();

	/**
	 * Stops the server
	 */
	void StopServer();

	/**
	 * This is a debug function that prints out the average values
	 * @todo remove this
	 */
	void PrintValues();

	/**
	 * Destructor
	 */
	virtual ~cWebInterface();

	// This is what the future will look like
	// cDataReceiver m_sensorVal[2];
	// cDataReceiver m_battery;
	// cDataReceiver m_ledLife;
	// cDataReceiver m_temp;
	// But for now...
	cDataReceiver m_adc_0;
	cDataReceiver m_adc_1;
	cDataReceiver m_adc_2;
	cDataReceiver m_adc_3;

	virtual void ReceiveCallback(void * i_data, cDataReceiver * i_receiver);
public:
	/**
	 *
	 * @param i_request
	 * @param i_response Response to the client, index.html
	 */
	void OnIndex(HttpRequest & i_request, HttpResponse & i_response);

	/**
	 * Function gets called from the mobile to refresh the average values
	 * @param i_request Request from the client
	 * @param i_response Response to the client, contains JSON with averages
	 */
	void OnRefresh(HttpRequest & i_request, HttpResponse & i_response);

	/**
	 *
	 * @param i_request
	 * @param i_response
	 */
	void OnRawUpdate(HttpRequest& i_request, HttpResponse& i_response);
	void OnFile(HttpRequest& i_request, HttpResponse& i_response);
	void OnConfiguration_json(HttpRequest &request, HttpResponse &response);
	void OnConfiguration(HttpRequest &request, HttpResponse &response);
protected:
	/**
	 * Initializes the variables
	 */
	cWebInterface();
private:
	void ResetRawValues();
	/// Whether the server has started or not
	bool m_serverStarted;
	/// Holds the average for all the channels
	int32_t m_adc_value_average[4];
	/// Server instance
	HttpServer m_server;

	char * m_jsonBuffer;
	int32_t m_adc_values_raw[4][RAW_SAMPLES];
	int m_adc_values_raw_cnt[4];
};

} /* namespace rijnfel */

#endif /* APP_WEB_INTERFACE_H_ */
