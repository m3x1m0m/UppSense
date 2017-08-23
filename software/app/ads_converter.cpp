/*
 * ads_converter.cpp
 *
 *  Created on: Aug 22, 2017
 *      Author: Elmar
 */

#include "ads_converter.h"

namespace rijnfel {

cAdsConverter::cAdsConverter(cADC<ads::ads_sample_t, int32_t> & i_adc) :
		m_adc(i_adc), m_rawSamples(this) {
	// TODO Auto-generated constructor stub

}

cAdsConverter::~cAdsConverter() {
	// TODO Auto-generated destructor stub
}

void cAdsConverter::ReceiveCallback(void* i_data, cDataReceiver* i_provider) {
	//We dont car for the provider
	cDoubleBuffer<ads::ads_sample_t> * i_adcBuffer = static_cast<cDoubleBuffer<ads::ads_sample_t>*>(i_data);
	ads::ads_sample_t * buf = &i_adcBuffer->GetReadyBuffer()[0];
	if (buf != NULL) {
		sSizedArray arr;
		int pos = buf->mux - ads::eInputMux::AIN_0;
		int64_t average = 0;
		int size = i_adcBuffer->GetSize();
		arr.size = size;
		arr.array = new uint32_t[size];
		for (int i = 0; i < size; i++) {
			arr.array[i] = m_adc.ConvertSample(buf[i]);
		}
		m_convertedSamples[pos].Push(static_cast<void *>(&arr));
		delete arr.array;
	}
}

} /* namespace rijnfel */

