/*
 * sensor_hub.cpp
 *
 *  Created on: Aug 1, 2017
 *      Author: Elmar
 */

#include "sensor_hub.h"
#include <stdint.h>

namespace rijnfel {

cSensorHub::cSensorHub(uint32_t i_updatePeriod) :
		m_updatePeriod(i_updatePeriod) {
	m_adc = new ads::cADS101x();
	m_adcSettings = NULL;
	m_tempSettings = NULL;
}

void cSensorHub::Update() {
	if (m_adcSettings) {
		if (m_adcSettings->ShouldSample(m_updatePeriod)) {
			if (m_adcSettings->m_buffer.AddValue(m_adc->RawSample())) {
				m_adcSettings->m_callback(m_adcSettings->m_buffer);
			}
		}
	}
}

void cSensorHub::SetAdc(ads::cADS101x* i_adc) {
	if (m_adc != NULL) {
		delete m_adc;
	}
	m_adc = i_adc;
}

void cSensorHub::SetAdcSettings(
		cSensorSettings<ads::ads_sample_t> * i_adcSettings) {
	m_adcSettings = i_adcSettings;
}

void cSensorHub::SetTempSettings(cSensorSettings<uint32_t> * i_tempSettings) {
	m_tempSettings = i_tempSettings;
}

cSensorHub::~cSensorHub() {
	if (m_adcSettings)
		delete m_adcSettings;
	if (m_tempSettings)
		delete m_tempSettings;
	delete m_adc;
}

} /* namespace rijnfel */

