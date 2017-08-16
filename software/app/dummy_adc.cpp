/*
 * dummy_adc.cpp
 *
 *  Created on: Aug 15, 2017
 *      Author: Elmar
 */

#include "dummy_adc.h"

namespace rijnfel {

cDymmyAdc::cDymmyAdc() {
	m_sampleCounter = 0;
}

void cDymmyAdc::WaitSample(void) {
}

bool cDymmyAdc::IsReady(void) {
	return true;
}

uint32_t cDymmyAdc::RawSample(void) {
	m_sampleCounter++;
	return m_sampleCounter;
}

uint32_t cDymmyAdc::ConvertSample(uint32_t& sample) {
	return sample - 1;
}

cDymmyAdc::~cDymmyAdc() {
	// TODO Auto-generated destructor stub
}

} /* namespace rijnfel */
