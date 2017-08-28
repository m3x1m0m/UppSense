/*
 * access_point.cpp
 *
 *  Created on: Aug 28, 2017
 *      Author: Elmar
 */

#include <user_config.h>
#include <SmingCore/SmingCore.h>
#include "access_point.h"

static void STADisconnect(String ssid, uint8_t ssid_len, uint8_t bssid[6], uint8_t reason) {
	if (!WifiAccessPoint.isEnabled()) {
		WifiStation.disconnect();
		WifiAccessPoint.enable(true);
		WifiStation.connect();
	}
}

static void STAGotIP(IPAddress ip, IPAddress mask, IPAddress gateway) {
	if (WifiAccessPoint.isEnabled()) {
		WifiAccessPoint.enable(false);
	}
}

void access_point_start() {
	wifi_set_sleep_type(NONE_SLEEP_T);
	WifiAccessPoint.setIP(IPAddress(10, 0, 0, 1));
	WifiAccessPoint.enable(true);
	WifiEvents.onStationDisconnect(STADisconnect);
	WifiEvents.onStationGotIP(STAGotIP);
}

void access_point_config() {
	WifiAccessPoint.config("Sensus", "", AUTH_OPEN, false, 3);
}
