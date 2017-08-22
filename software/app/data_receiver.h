/*
 * data_receiver.h
 *
 *  Created on: Aug 22, 2017
 *      Author: Elmar
 */

#ifndef APP_DATA_RECEIVER_H_
#define APP_DATA_RECEIVER_H_

#include "data_sink.h"

namespace rijnfel {

class cDataReceiver {
public:
	cDataReceiver(cDataSink * i_sink) {
		m_sink = i_sink;
	}
	void Receive(void * i_data) {
		m_sink->ReceiveCallback(i_data, this);
	}
private:
	cDataSink * m_sink;
};

}

#endif /* APP_DATA_RECEIVER_H_ */
