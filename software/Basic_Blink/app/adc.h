/*
 * adc.h
 *
 *  Created on: Jul 20, 2017
 *      Author: Elmar
 */

#ifndef APP_ADC_H_
#define APP_ADC_H_

#include "sensor.h"

namespace rijnfel {

template<typename Sample, typename Voltage>
class cADC: public cSensor<Sample> {
public:
	cADC() {

	}
	virtual Voltage ConvertSample(Sample & sample) = 0;
	virtual ~cADC() {

	}
};
}
#endif /* APP_ADC_H_ */
