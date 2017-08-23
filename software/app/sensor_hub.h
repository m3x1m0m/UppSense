/*
 * sensor_hub.h
 *
 *  Created on: Aug 1, 2017
 *      Author: Elmar
 */

#ifndef APP_SENSOR_HUB_H_
#define APP_SENSOR_HUB_H_

#include <rijnfel_core/sensor_settings.h>
#include "ads101x.h"


namespace rijnfel {

class cSensorHub {
public:
	//in milliseconds
	cSensorHub(uint32_t i_updatePeriod);
	void SetAdc(ads::cADS101x * i_adc);
	void SetAdcSettings(cSensorSettings<ads::ads_sample_t> * i_adcSettings);
	void Stop();
	void Start();
	void SetTempSettings(cSensorSettings<uint32_t> * i_tempSettings);
	void Update();
	virtual ~cSensorHub();

private:
	uint32_t m_updatePeriod;
	cSensorSettings<ads::ads_sample_t> * m_adcSettings;
	cSensorSettings<uint32_t> * m_tempSettings;
	ads::cADS101x * m_adc;
	bool m_running;
};

} /* namespace rijnfel */

#endif /* APP_SENSOR_HUB_H_ */
