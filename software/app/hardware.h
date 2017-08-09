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

//-------------------------------------I2C ADRESSES---------------------------------------------------------------------------
static const uint8_t ADC_ADDRESS = 0x48;
static const uint8_t DAC1_ADDRESS = 0xC;

#define R_SENSE_DIV_FACT 100 // 100 Ohm sensing resistor
#define CURR_MAX_UAMP 10000 // 10 mA max. 

#endif /* APP_HARDWARE_H_ */
