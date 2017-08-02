/*
 * sensor.h
 *
 *  Created on: Aug 1, 2017
 *      Author: Elmar
 */

#ifndef APP_SENSOR_H_
#define APP_SENSOR_H_

#include <stddef.h>

namespace rijnfel {
template<typename Sample>
class cSensor {
public:
	cSensor() {
		m_callback = NULL;
	}
	Sample GetLatestSample(void) {
		return m_latestSample;
	}
	void SetOnSampleCallBack(void (*i_callback)(Sample & o_sample)) {
		m_callback = i_callback;
	}
	virtual void WaitSample(void) = 0;
	virtual bool IsReady(void) = 0;
	virtual Sample RawSample(void) = 0;
	virtual ~cSensor() {

	}
protected:
	Sample m_latestSample;
	void (*m_callback)(Sample & o_sample);
};
}

#endif /* APP_SENSOR_H_ */
