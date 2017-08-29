/*
 * provider_buffer.h
 *
 *  Created on: Aug 29, 2017
 *      Author: Elmar
 */

#ifndef APP_PROVIDER_BUFFER_H_
#define APP_PROVIDER_BUFFER_H_

#include "data_provider.h"
#include "helper_structs.h"

namespace rijnfel {
template<typename Data>
class cProviderBuffer: public cDataSink {
public:
	cProviderBuffer(size_t i_bufferSize) :
			m_input(this) {
		m_bufferSize = i_bufferSize;
		m_counter = 0;
		m_array = new Data[i_bufferSize];
		m_sizedArray.p_array = static_cast<void*>(m_array);
		m_sizedArray.size = m_bufferSize;
	}

	virtual void ReceiveCallback(void * i_data, cDataReceiver * i_receiver) {
		m_array[m_counter] = *static_cast<Data*>(i_data);
		m_counter++;
		if (m_counter == m_bufferSize) {
			m_output.Push(static_cast<void*>(&m_sizedArray));
			Reset();
		}
	}
	void Reset(){
		m_counter = 0;
	}
	virtual ~cProviderBuffer() {
		delete[] m_array;
	}
	cDataReceiver m_input;
	cDataProvider m_output;
private:
	sSizedArray m_sizedArray;
	size_t m_bufferSize;
	size_t m_counter;
	Data * m_array;
};

} /* namespace rijnfel */

#endif /* APP_PROVIDER_BUFFER_H_ */
