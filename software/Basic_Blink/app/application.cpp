#include <user_config.h>
#include <SmingCore/SmingCore.h>
#include <SmingCore/HardwareSerial.h>
#include "ads101x.h"
#include "sensor_hub.h"
#include "sensor_settings.h"
#include "double_buffer.h"
#include "web_interface.h"

#define LED_PIN 2 // GPIO2

using namespace rijnfel;

void STADisconnect(String ssid, uint8_t ssid_len, uint8_t bssid[6],
		uint8_t reason);
void STAGotIP(IPAddress ip, IPAddress mask, IPAddress gateway);

Timer procTimer;
ads::cADS101x adc;
uint8_t channel = 0;

cSensorHub hub(5);
int test = 0;
void updateSensorHub() {
	hub.Update();
}

void adcCallback(cDoubleBuffer<ads::ads_sample_t> & buffer) {
	cWebInterface::GetInstance()->UpdateAdc(adc, buffer);
	adc.SetMux(static_cast<ads::eInputMux>(ads::eInputMux::AIN_0 + channel));
	channel++;
	if (channel > 3) {
		channel = 0;
	}
}

void init() {
	spiffs_mount();
	Serial.begin(460800);
	Wire.pins(4, 5);
	Wire.begin();
	//SET higher CPU freq & disable wifi sleep
	system_update_cpu_freq(SYS_CPU_160MHZ);
	wifi_set_sleep_type(NONE_SLEEP_T);
	//WDT.enable(false);
	pinMode(LED_PIN, OUTPUT);
	adc.SetMux(ads::eInputMux::AIN_0);
	adc.SetSampleSpeed(ads::eSampleSpeed::SPS_3300);
	hub.SetAdc(&adc);

	cSensorSettings<ads::ads_sample_t> * adcSettings;
	adcSettings = new cSensorSettings<ads::ads_sample_t>(&adcCallback, 250, 5);
	hub.SetAdcSettings(adcSettings);

	WifiEvents.onStationDisconnect(STADisconnect);
	WifiEvents.onStationGotIP(STAGotIP);
/*	WifiAccessPoint.setIP(IPAddress(10, 0, 0, 1));		//TODO
	WifiAccessPoint.config("Sensus", "", AUTH_OPEN, false, 3);*/
	cWebInterface::GetInstance()->Start();

	procTimer.initializeMs(100, updateSensorHub).start();
}

void STADisconnect(String ssid, uint8_t ssid_len, uint8_t bssid[6],
		uint8_t reason) {
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
