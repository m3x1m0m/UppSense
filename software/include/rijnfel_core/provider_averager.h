/*
 * provider_averager.h
 *
 *  Created on: Aug 29, 2017
 *      Author: Elmar
 */

#ifndef APP_PROVIDER_AVERAGER_H_
#define APP_PROVIDER_AVERAGER_H_

#include "data_provider.h"

namespace rijnfel {
template<typename DataType, typename MaxType>
class cProviderAverager: public cDataSink {
public:
	cProviderAverager(uint32_t i_averageSize = 250) :
			m_input(this) {
		m_averageSize = i_averageSize;
		m_counter = 0;
	}

	virtual void ReceiveCallback(void * i_data, cDataReceiver * i_receiver) {
		m_outcome += *static_cast<DataType*>(i_data);
		m_counter++;
		if (m_counter >= m_averageSize ) {
			if (m_averageSize == 0) {
				//TODO log message
				return;
			}
			m_outcome = m_outcome / m_counter;
			m_output.Push(&m_outcome);
			Reset();
		}
	}
	void Reset() {
		m_outcome = 0;
		m_counter = 0;
	}
	virtual ~cProviderAverager() {
	}
	cDataReceiver m_input;
	cDataProvider m_output;
private:
	uint32_t m_averageSize;
	uint32_t m_counter;

	MaxType m_outcome;
};

} /* namespace rijnfel */

#endif /* APP_PROVIDER_AVERAGER_H_ */
