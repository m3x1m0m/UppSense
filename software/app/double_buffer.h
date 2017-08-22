/*
 * double_buffer.h
 *
 *  Created on: Aug 1, 2017
 *      Author: Elmar
 */

#ifndef APP_DOUBLE_BUFFER_H_
#define APP_DOUBLE_BUFFER_H_

#include <stdint.h>
#include <SmingCore/SmingCore.h>

namespace rijnfel {

template<typename BufferType>
class cDoubleBuffer {
public:
	cDoubleBuffer(int i_size) :
			m_size(i_size) {
		m_writeIndex = 0;
		m_bufferIndex = 0;
		m_buf = new BufferType*[2];
		m_buf[0] = new BufferType[m_size];
		m_buf[1] = new BufferType[m_size];
	}

	void Resize(int i_newSize) {
		m_size = i_newSize;
		delete m_buf[0];
		delete m_buf[1];
		m_buf[0] = new BufferType[m_size];
		m_buf[1] = new BufferType[m_size];
	}

	void Reset() {
		m_bufferIndex = !m_bufferIndex;
		m_writeIndex = 0;
	}

	bool AddValue(BufferType i_val) {
		m_buf[m_bufferIndex][m_writeIndex] = i_val;
		m_writeIndex++;
		if (m_writeIndex >= m_size) {
			Reset();
			return true;
		}
		return false;
	}

	BufferType * GetReadyBuffer() {
		return m_buf[(m_bufferIndex == 0) ? 1 : 0];
	}

	BufferType * GetBuffer(int i_index) {
		return m_buf[i_index];
	}

	int GetSize() {
		return m_size;
	}

	virtual ~cDoubleBuffer() {
		delete[] m_buf[0];
		delete[] m_buf[1];
		delete[] m_buf;
	}
private:
	int m_size;
	int m_writeIndex;
	int m_bufferIndex;
	BufferType ** m_buf;
};

} /* namespace rijnfel */

#endif /* APP_DOUBLE_BUFFER_H_ */
