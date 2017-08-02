/*
 * temperature.h
 *
 *  Created on: Aug 1, 2017
 *      Author: Elmar
 */

#ifndef APP_TEMPERATURE_H_
#define APP_TEMPERATURE_H_

#include "sensor.h"

namespace rijnfel {
template<typename Sample, typename Temperature>
class cTemperatureSensor: cSensor<Sample> {
public:
	cTemperatureSensor() {

	}
	virtual Temperature ConvertSample(Sample sample) = 0;
	virtual ~cTemperatureSensor() {

	}
};

}

#endif /* APP_TEMPERATURE_H_ */
