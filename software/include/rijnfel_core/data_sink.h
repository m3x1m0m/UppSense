/*
 * data_sink.h
 *
 *  Created on: Aug 22, 2017
 *      Author: Elmar
 */

#ifndef APP_DATA_SINK_H_
#define APP_DATA_SINK_H_

namespace rijnfel {

class cDataReceiver;

class cDataSink {
public:
	cDataSink() {
	}
	virtual ~cDataSink() {
	}
	virtual void ReceiveCallback(void * i_data, cDataReceiver * i_receiver);
};
}

#endif /* APP_DATA_SINK_H_ */
