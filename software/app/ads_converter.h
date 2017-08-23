/*
 * ads_converter.h
 *
 *  Created on: Aug 22, 2017
 *      Author: Elmar
 */

#ifndef APP_ADS_CONVERTER_H_
#define APP_ADS_CONVERTER_H_

#include <rijnfel_core/rijnfel_core.h>
#include "ads101x.h"

namespace rijnfel {

class cAdsConverter: public cDataSink {
public:
	cAdsConverter(cADC<ads::ads_sample_t, int32_t> & i_adc);
	virtual void ReceiveCallback(void * i_data, cDataReceiver * i_provider);
	// Every channel has its own provider, after this we can not distinguish anymore
	cDataProvider m_convertedSamples[4];
	cDataReceiver m_rawSamples;
	virtual ~cAdsConverter();
private:
	cADC<ads::ads_sample_t, int32_t> & m_adc;
};

} /* namespace rijnfel */

#endif /* APP_ADS_CONVERTER_H_ */
