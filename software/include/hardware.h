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

#include <signal_processing.h>

#define REV_2

#define SMING_RELEASE
#ifdef DEBUG_VERBOSE_LEVEL
	#undef DEBUG_VERBOSE_LEVEL
#endif
#define DEBUG_VERBOSE_LEVEL WARN

//-------------------------------------I2C ADRESSES---------------------------------------------------------------------------
#ifdef REV_1
static const uint8_t ADC_ADDRESS = 0x49;
static const uint8_t DAC1_ADDRESS = 0xE;
#define DUMMY_ADC
#endif
#ifdef REV_2
static const uint8_t ADC_ADDRESS = 0x49;
static const uint8_t DAC2_ADDRESS = 0x78;
static const uint8_t DAC1_ADDRESS = 0x09;
static const uint8_t TEMP_ADDRESS = 0x12;
#endif

static const uint16_t R_SENSE = 100; // 100 Ohm sensing resistor
static const uint16_t CURR_MAX_UAMP = 10000; // 10 mA max. 
static const uint16_t VREF_DAC = 3300; // in mV
static const uint16_t RESOLUTION_DAC = 1024;

static const int HUB_PERIOD = 500;
static const int ADC_PERIOD = 500;		// f_samp = 2 kHz
static const int ADC_TIMEBASE = ADC_PERIOD * SAMPLES * 4;


#define LED_PIN 2 // GPIO2

#endif /* APP_HARDWARE_H_ */
