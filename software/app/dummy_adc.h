/*
 * dummy_adc.h
 *
 *  Created on: Aug 15, 2017
 *      Author: Elmar
 */

#ifndef APP_DUMMY_ADC_H_
#define APP_DUMMY_ADC_H_

#include "adc.h"
#include <stdint.h>

namespace rijnfel {

class cDymmyAdc: public cADC<uint32_t, uint32_t> {
public:
	cDymmyAdc();
	virtual void WaitSample(void);
	virtual bool IsReady(void);
	virtual uint32_t RawSample(void);
	virtual uint32_t ConvertSample(uint32_t & sample);
	virtual ~cDymmyAdc();
private:
	uint32_t m_sampleCounter;
};

} /* namespace rijnfel */

#endif /* APP_DUMMY_ADC_H_ */
