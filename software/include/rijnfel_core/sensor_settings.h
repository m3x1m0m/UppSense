/*
 * sensor_settings.h
 *
 *  Created on: Aug 1, 2017
 *      Author: Elmar
 */

#ifndef APP_SENSOR_SETTINGS_H_
#define APP_SENSOR_SETTINGS_H_

#include "data_provider.h"
#include "double_buffer.h"

namespace rijnfel {
//timebase, in miliseconds.
//Example, period = 10 (ms) timebase = 250(ms)
//Callback will be called after 250/10 = 25 samples
template<typename BufferType>
class cSensorSettings {
public:
	cSensorSettings(uint32_t i_timeBase, uint32_t i_period) :
			m_periodTimer(0), m_period(i_period), m_buffer(0) {
		m_buffer.Resize((int) (i_timeBase / m_period));
	}

	void Reset() {
		m_periodTimer = 0;
		m_buffer.Reset();
	}

	bool ShouldSample(uint32_t i_updatePeriod) {
		m_periodTimer += i_updatePeriod;
		if (m_periodTimer >= m_period) {
			m_periodTimer -= m_period;
			return true;
		}
		return false;
	}
	cDataProvider m_samplesProvider;
	cDoubleBuffer<BufferType> m_buffer;
private:
	uint32_t m_periodTimer;
	uint32_t m_period;
};

}

#endif /* APP_SENSOR_SETTINGS_H_ */
