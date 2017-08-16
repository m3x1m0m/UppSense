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

/**
 * Abstract interface for Analog to Digital converters.
 * Template holds sample type and voltage type
 */
template<typename Sample, typename Voltage>
class cADC: public cSensor<Sample> {
public:
	/**
	 * Default constructor
	 */
	cADC() {

	}

	/**
	 * This virtual function should be implemented to convert a sample to a voltage
	 * @param i_sample the raw sample that should be converted
	 * @return a voltage in mili-volt
	 */
	virtual Voltage ConvertSample(Sample & i_sample) = 0;

	/**
	 * Default destructor
	 */
	virtual ~cADC() {

	}
};
}
#endif /* APP_ADC_H_ */
