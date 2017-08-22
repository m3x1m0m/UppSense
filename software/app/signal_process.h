/*
 * signal_process.h
 *
 *  Created on: Aug 22, 2017
 *      Author: Elmar
 */

#ifndef APP_SIGNAL_PROCESS_H_
#define APP_SIGNAL_PROCESS_H_
#include "data_receiver.h"
#include "data_provider.h"

namespace rijnfel {

class cSignalProcess: public cDataSink {
public:
	cSignalProcess();
	virtual ~cSignalProcess();
	void ReceiveCallback(void * i_data, cDataReceiver * i_provider);
	cDataReceiver m_incommingData;
	cDataProvider m_processedData;
protected:
	void process(uint32_t * io_array, size_t size);
	uint32_t * m_currentBuffer;
	uint32_t m_currentIndex;
	uint32_t m_currentMaxIndex;
};

} /* namespace rijnfel */

#endif /* APP_SIGNAL_PROCESS_H_ */
