#include <user_config.h>
#include <hardware.h>
#include <SmingCore/SmingCore.h>
#include <SmingCore/HardwareSerial.h>
#include <application.h>
#include <stdint.h>

#include <rijnfel_core/rijnfel_core.h>
#include "excitation_light.h"
#include "ads101x.h"
#include "ads_converter.h"
#include "web_interface.h"
#include "signal_process.h"
#include "sensor_hub.h"
#include "access_point.h"

#include "tests.h"

using namespace rijnfel;

cAdsConverter * adsConverter;

//We want different signal processing for the channels
cSignalProcess signalProcess[2];
Timer procTimer;
Timer rectangleTimer;
Timer _stopTimer;
light::cExcitationLight mylight;
cSensorHub hub(HUB_PERIOD);
ads::cADS101x ads1015(0, ADC_ADDRESS);

static bool _sensorStationRunning = false;
static bool _keepRunning = false;

static void UpdateSensorHub() {
	WDT.alive();
	hub.Update();
}

static void StopRunning() {
	StopSensorStation();
}

void StartSensorStation(int seconds) {
	if (_sensorStationRunning) {
		return;
	}
	if (seconds == 0) {
		_keepRunning = true;
	} else {
		_stopTimer.initializeMs(seconds * 1000, StopRunning).start(false);
		_keepRunning = false;
	}
	procTimer.initializeUs(HUB_PERIOD, UpdateSensorHub).start();
	_sensorStationRunning = true;
}

void StopSensorStation(void) {
	if (!_sensorStationRunning)
		return;
	if (!_keepRunning) {
		_stopTimer.stop();
	}
	procTimer.initializeUs(HUB_PERIOD, UpdateSensorHub).stop();
	_sensorStationRunning = false;
}

void ChangeSampleChannel(int channel) {
	if (channel > 0 && channel < 5) {
		if (_sensorStationRunning) {
			hub.Stop();
		}
		ads1015.SetMux(static_cast<ads::eInputMux>(ads::eInputMux::AIN_0 + channel - 1));
		if (_sensorStationRunning) {
			hub.Start();
		}
	}
}

void ready() {
	hub.Start();
	access_point_config();
}

void init() {
	spiffs_mount();
	Serial.begin(460800);
	system_update_cpu_freq(SYS_CPU_160MHZ);
	access_point_start();
	System.onReady(ready);

	Wire.pins(4, 5);
	Wire.begin();

	Serial.systemDebugOutput(false);
	delay(10);
	system_set_os_print(0);
	// Turn off LED for measurements
	hub.Stop();
	pinMode(LED_PIN, OUTPUT);
	digitalWrite(LED_PIN, 1);
	ads1015.SetMux(ads::eInputMux::AIN_0);
	ads1015.SetSampleSpeed(ads::eSampleSpeed::SPS_3300);
	ads1015.SetGain(ads::eGainAmplifier::FSR_4_096);
	ads1015.SetOneShot(false);
	hub.SetAdc(&ads1015);
	adsConverter = new cAdsConverter(ads1015);

	cSensorSettings<ads::ads_sample_t> * adcSettings;
	adcSettings = new cSensorSettings<ads::ads_sample_t>(ADC_TIMEBASE, ADC_PERIOD);
	adcSettings->m_samplesProvider.Connect(&adsConverter->m_rawSamples);
	hub.SetAdcSettings(adcSettings);

	// Channel one and two are getting processed
	adsConverter->m_convertedSamples[0].Connect(&signalProcess[0].m_incommingData);
	adsConverter->m_convertedSamples[1].Connect(&signalProcess[1].m_incommingData);
	signalProcess[0].m_processedData.Connect(&cWebInterface::GetInstance()->m_adc_0);
	signalProcess[1].m_processedData.Connect(&cWebInterface::GetInstance()->m_adc_1);
	// Channel three and four are not
	adsConverter->m_convertedSamples[2].Connect(&cWebInterface::GetInstance()->m_adc_2);
	adsConverter->m_convertedSamples[3].Connect(&cWebInterface::GetInstance()->m_adc_3);

	cWebInterface::GetInstance()->StartServer();

	mylight.SetCurrent(500);
	mylight.RectangleUpdate();
}

