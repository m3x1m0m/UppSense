//----------------------------------------------------------------------------------------------------------------------------
// Project:    	Uppsense
// Name:	hardware.h
// Author:	Maximilian Stiefel
// Date:	09.08.2017
//
// Description: 
//
//----------------------------------------------------------------------------------------------------------------------------

#ifndef APP_HARDWARE_H_
#define APP_HARDWARE_H_

#define REV_1

//-------------------------------------I2C ADRESSES---------------------------------------------------------------------------
static const uint8_t ADC_ADDRESS = 0x49;
static const uint8_t DAC1_ADDRESS = 0xE;

static const uint16_t R_SENSE = 100; // 100 Ohm sensing resistor
static const uint16_t CURR_MAX_UAMP = 10000; // 10 mA max. 
static const uint16_t VREF_DAC = 3300; // in mV
static const uint16_t RESOLUTION_DAC = 1024;

static const int HUB_PERIOD = 5;
static const int ADC_TIMEBASE = 250;
static const int ADC_PERIOD = 5;
static const int RECT_PERIOD = 2500; // in us

#define LED_PIN 2 // GPIO2

#endif /* APP_HARDWARE_H_ */
