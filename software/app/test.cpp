/*
 * test.cpp
 *
 *  Created on: Aug 23, 2017
 *      Author: Elmar
 */

#include <SmingCore/HardwareSerial.h>
#include "tests.h"

void SettingsTest(rijnfel::ads::cADS101x * ads1015) {
	for (int channel = 0; channel < 4; channel++) {
		ads1015->SetMux(static_cast<rijnfel::ads::eInputMux>(rijnfel::ads::eInputMux::AIN_0 + channel));
		Serial.printf("Settings: %d\n\r", ads1015->GetSettings());
	}
}

void AdcTest(rijnfel::ads::cADS101x * ads1015) {
	for (int channel = 0; channel < 4; channel++) {
		ads1015->SetMux(static_cast<rijnfel::ads::eInputMux>(rijnfel::ads::eInputMux::AIN_0 + channel));
		rijnfel::ads::ads_sample_t sample = ads1015->RawSample();
		Serial.printf("converted: %d channel: %d\n\r", ads1015->ConvertSample(sample), sample.mux);
	}
}
