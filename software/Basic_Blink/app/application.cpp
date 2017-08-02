#include <user_config.h>
#include <SmingCore/SmingCore.h>
#include <SmingCore/HardwareSerial.h>
#include "ads101x.h"

#define LED_PIN 2 // GPIO2

using namespace rijnfel;
Timer procTimer;
ads::cADS101x adc;
bool state = true;
uint16_t sampless = 1;
uint8_t channel = 0;
unsigned int average[4];

void readAdc() {
	//while (adc.IsReady()) {
	adc.SetMux(static_cast<ads::eInputMux>(ads::eInputMux::AIN_0 + channel));
	channel++;
	if (channel > 3) {
		channel = 0;
	}
	uint16_t settings = adc.GetSettings();
	Serial.printf("Settings = %d;\n\r", settings);

	if (false) {
		adc.SetMux(
				static_cast<ads::eInputMux>(ads::eInputMux::AIN_0 + channel));
		ads::ads_sample_t sample = adc.RawSample();
		average[channel] += adc.ConvertSample(sample) / 1000; //want it in mv
		channel++;
		if (channel > 3) {
			channel = 0;
			sampless++;
			if (sampless > 3300) {
				for (uint8_t i = 0; i < 4; i++) {
					Serial.printf("C[%d] = %d; ", i, average[i] / sampless);
					average[i] = 0;
				}
				Serial.printf("\n\r");
				sampless = 0;
			}
		}
	}
	WDT.alive();
	//}
	//Serial.printf("Not ready anymore\n\r");
}

void blink() {
	readAdc();
}

void init() {
	Serial.begin(460800);
	Wire.pins(5, 4);

	Wire.begin();
	//SET higher CPU freq & disable wifi sleep
	system_update_cpu_freq(SYS_CPU_160MHZ);
	WDT.enable(false);
	pinMode(LED_PIN, OUTPUT);
	adc.SetMux(ads::eInputMux::AIN_0);
	adc.SetSampleSpeed(ads::eSampleSpeed::SPS_3300);
	procTimer.initializeMs(500, readAdc).start();
}
