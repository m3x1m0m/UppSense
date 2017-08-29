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

cProviderAverager<uint16_t, uint32_t> averagers[4];
cProviderBuffer<uint32_t> bufferChannels[2] { { 1024 }, { 1024 } };

cProviderAverager<uint16_t, uint32_t> processedAveragers[2] { { 10 }, { 10 } };
cProviderAverager<uint16_t, uint32_t> processedAveragersBuffer[2] { { 10 }, { 10 } };

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
	// adc:uint16 -- buffer:sSizedArray[] -- signal:sSizedArray[] -- average:uint16 -- web
	for (int i = 0; i < 2; i++) {
		hub.m_adc_output[i].Connect(&bufferChannels[i].m_input);
		bufferChannels[i].m_output.Connect(&signalProcess[i].m_incommingData);
		signalProcess[i].m_processedData.Connect(&processedAveragers[i].m_input);
		processedAveragers[i].m_output.Connect(&processedAveragersBuffer[i].m_input);
		processedAveragersBuffer[i].m_output.Connect(&cWebInterface::GetInstance()->m_sensorValRaw);

	}

	for (int i = 0; i < 4; i++) {
		hub.m_adc_output[i].Connect(&averagers[i].m_input);
		averagers[i].m_output.Connect(&cWebInterface::GetInstance()->m_adcAverage[i]);
	}
	cWebInterface::GetInstance()->StartServer();

	mylight.SetCurrent(500);
	mylight.RectangleUpdate();
}

