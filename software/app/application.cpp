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

using namespace rijnfel;

void STADisconnect(String ssid, uint8_t ssid_len, uint8_t bssid[6], uint8_t reason);
void STAGotIP(IPAddress ip, IPAddress mask, IPAddress gateway);

cAdsConverter * adsConverter;

//We want different signal processing for the channels
cSignalProcess signalProcess[2];
Timer procTimer;
Timer rectangleTimer;
uint8_t channel = 0;
light::cExcitationLight mylight;
cSensorHub hub(HUB_PERIOD);
ads::cADS101x ads1015(0, ADC_ADDRESS);

void ChangeSampleChannel(int channel) {
	if (channel > 0 && channel < 5) {
		hub.Stop();
		ads1015.SetMux(static_cast<ads::eInputMux>(ads::eInputMux::AIN_0 + channel - 1));
		hub.Start();
	}
}

void SettingsTest() {
	channel++;
	if (channel > 3) {
		channel = 0;
		cWebInterface::GetInstance()->PrintValues();
	}
	ads1015.SetMux(static_cast<ads::eInputMux>(ads::eInputMux::AIN_0 + channel));
	Serial.printf("Settings: %d\n\r", ads1015.GetSettings());
}

void AdcTest() {
	channel++;
	if (channel > 3) {
		channel = 0;
	}
	ads1015.SetMux(static_cast<ads::eInputMux>(ads::eInputMux::AIN_0 + channel));
	ads::ads_sample_t sample = ads1015.RawSample();
	Serial.printf("raw: %d converted: %d channel: %d\n\r", sample.rawSample, ads1015.ConvertSample(sample), sample.mux);
}

void updateSensorHub() {
	WDT.alive();
	hub.Update();
}

void ready() {
	WifiAccessPoint.config("Sensus", "", AUTH_OPEN, false, 3);
	//debugf("READY!");

	// If AP is enabled:
	//debugf("AP. ip: %s mac: %s", WifiAccessPoint.getIP().toString().c_str(), WifiAccessPoint.getMAC().c_str());
}

void init() {
	spiffs_mount();
	Serial.begin(460800);
	system_update_cpu_freq(SYS_CPU_160MHZ);
	wifi_set_sleep_type(NONE_SLEEP_T);

	System.onReady(ready);

	WifiAccessPoint.setIP(IPAddress(10, 0, 0, 1));
	WifiAccessPoint.enable(true);

	Wire.pins(4, 5);
	Wire.begin();
	//SET higher CPU freq & disable wifi sleep

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

	WifiEvents.onStationDisconnect(STADisconnect);
	WifiEvents.onStationGotIP(STAGotIP);
	cWebInterface::GetInstance()->StartServer();

	procTimer.initializeMs(HUB_PERIOD, updateSensorHub).start();

	hub.Start();
	//procTimer.initializeMs(1000, AdcTest).start();
	//procTimer.initializeMs(5000, SettingsTest).start();
	//mylight.SetCurrent(5000);
	//mylight.RectangleUpdate();	
}

void STADisconnect(String ssid, uint8_t ssid_len, uint8_t bssid[6], uint8_t reason) {
	if (!WifiAccessPoint.isEnabled()) {
		WifiStation.disconnect();
		WifiAccessPoint.enable(true);
		WifiStation.connect();
	}
}

void STAGotIP(IPAddress ip, IPAddress mask, IPAddress gateway) {
	if (WifiAccessPoint.isEnabled()) {
		WifiAccessPoint.enable(false);
	}
	// Add commands to be executed after successfully connecting to AP and got IP from it
}
