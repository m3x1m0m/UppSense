/*
 * signal_process.cpp
 *
 *  Created on: Aug 22, 2017
 *      Author: Elmar
 */

#include "signal_process.h"
#include <stddef.h>

#include "../include/rijnfel_core/helper_structs.h"
//TODO remove this

namespace rijnfel {

cSignalProcess::cSignalProcess() :
		m_incommingData(this) {
	m_currentIndex = 0;
	m_currentMaxIndex = 0;
	m_currentBuffer = NULL;
	// TODO Auto-generated constructor stub

}

cSignalProcess::~cSignalProcess() {
	// TODO Auto-generated destructor stub
}

void cSignalProcess::ReceiveCallback(void* i_data, cDataReceiver* i_provider) {
	sSizedArray * arr = static_cast<sSizedArray*>(i_data);
	process(arr->array, arr->size);
	m_processedData.Push(i_data);
}

void cSignalProcess::process(uint32_t* io_array, size_t size) {
	//Do whatever here really
}

} /* namespace rijnfel */
