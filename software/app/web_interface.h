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

namespace rijnfel {
#define RAW_CHANNEL 1
#define RAW_SAMPLES 1000
class cWebInterface {
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
	 * Updates the adc on the website. Averages it
	 * @param i_adc Instance of the adc sensor
	 * @param i_adcBuffer Buffer containing the raw adc values
	 */
	void UpdateAdc(cADC<ads::ads_sample_t, int32_t> & i_adc, cDoubleBuffer<ads::ads_sample_t> & i_adcBuffer);

	/**
	 * Updates the temperature on the website
	 * @param i_tempBuffer buffer containing temperature values
	 */
	void UpdateTemp(cDoubleBuffer<uint32_t> & i_tempBuffer);

	/**
	 * This is a debug function that prints out the average values
	 * @todo remove this
	 */
	void PrintValues();

	/**
	 * Destructor
	 */
	virtual ~cWebInterface();
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
