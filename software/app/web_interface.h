/*
 * web_interface.h
 *
 *  Created on: Aug 6, 2017
 *      Author: Elmar
 */

#ifndef APP_WEB_INTERFACE_H_
#define APP_WEB_INTERFACE_H_

//TODO remove this
#include "ads101x.h"

#include <SmingCore/SmingCore.h>
#include <rijnfel_core/rijnfel_core.h>

namespace rijnfel {

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
	cDataReceiver m_sensorValRaw;
	cDataReceiver m_adcAverage[4];

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
	void OnConfiguration_json(HttpRequest &request, HttpResponse &response);
	void OnConfiguration(HttpRequest &request, HttpResponse &response);

	//TODO migrate this
	WebSocketConnection * m_connectedUser;
	bool m_sendWebsocket;
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
	int32_t m_adcAverageVal[4];
	/// Server instance
	HttpServer m_server;
};

} /* namespace rijnfel */

#endif /* APP_WEB_INTERFACE_H_ */
