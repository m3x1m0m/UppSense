//----------------------------------------------------------------------------------------------------------------------------
// Project:     Uppsense
// Name:        dac101c085.cpp
// Author:      Maximilian Stiefel
// Date:        08.08.2017
//
// Description: Small simple driver for the TI DAC101C085.
//
//----------------------------------------------------------------------------------------------------------------------------

//-------------------------------------Libraries------------------------------------------------------------------------------
#include "dac101c085.h"
#include <SmingCore/Wire.h>
#include <SmingCore/SmingCore.h>

//-------------------------------------Namespaces-----------------------------------------------------------------------------
namespace rijnfel {
namespace dac {

//-------------------------------------Constructor----------------------------------------------------------------------------
cDAC101C085::cDAC101C085(uint8_t i_number, uint8_t i_address):
	m_number(i_number), m_address(i_address)
{}

//-------------------------------------Destructor-----------------------------------------------------------------------------
cDAC101C085::~cDAC101C085()
{}

//-------------------------------------checkDev-------------------------------------------------------------------------------
void cDAC101C085::CheckDev()
{
	// Vars
	byte error = 0;
	// Action
	#if DEBUG_LEVEL == 1
	Serial.print("DAC: Scanning address 0x");
	Serial.print(m_address, HEX);
	Serial.println(".");	
	#endif
	Wire.beginTransmission(m_address);
	error = Wire.endTransmission();
	I2CError(error); // Pass to error parser
}

//-------------------------------------changeSettings-------------------------------------------------------------------------
uint8_t cDAC101C085::ChangeSettings(enum eOpMode mode, uint16_t val)
{
	// Vars
	uint16_t settings = 0;
	// Action
	if( val > 1023)
		return 0; // This is illegal
	settings = val << D_BITS_POS; // First two bits have to be 0
	switch(mode)
	{
		case NORMAL:
		       		settings += (0b00 << PD_BITS_POS);	
				break;
		case PULL_DOWN_2K5:
				settings += (0b01 << PD_BITS_POS);	
				break;
		case PULL_DOWN_100K:
				settings += (0b10 << PD_BITS_POS);	
				break;
		case HIGH_IMPEDANCE:
				settings += (0b11 << PD_BITS_POS);	
				break;

	}
	return WriteSettings(settings);	
}

//-------------------------------------WriteSettings--------------------------------------------------------------------------
uint8_t cDAC101C085::WriteSettings(uint16_t settings)
{
	// Vars
	uint8_t error = 0;
	// Action
	Wire.beginTransmission(m_address);
	Wire.write( (uint8_t) (settings >> 8) ); // Most significant byte
	Wire.write( (uint8_t) (settings & 0xFF) ); // Least significant byte
	error = Wire.endTransmission();
	Serial.println(settings);
	return I2CError(error); // Pass to error parser	
}

//-------------------------------------ReadSettings--------------------------------------------------------------------------
uint16_t cDAC101C085::ReadSettings(void)
{
	// Vars
	uint8_t number = 0;
	uint16_t settings = 0;

	// Action
	number = Wire.requestFrom(m_address, (uint8_t) 2);
	if( number != 2)
	{
	        Serial.print("DAC: Trying to read 2 bytes from 0x");
	        Serial.print(m_address, HEX);
	        Serial.println(" went wrong.");
		return 0;
	}
	settings = (uint16_t) Wire.read() << 8; // Most significant byte
	settings += (uint16_t) Wire.read(); // Least significant byte
	return settings;
}

//-------------------------------------I2CError-------------------------------------------------------------------------------
uint8_t cDAC101C085::I2CError(uint8_t error)
{
	switch(error)
	{
		case 0:
			#if DEBUG_LEVEL == 1
			Serial.println("DAC: I2C device found. Transmission successful.");
			#endif
			break;
		case 2:
			Serial.print("DAC: Received NACK after address from 0x.");
			Serial.print(m_address, HEX);
			Serial.println(".");
			break;
		case 3:
			Serial.print("DAC: Received NACK after data from 0x.");
			Serial.print(m_address, HEX);
			Serial.println(".");
			break;
		case 4:
			Serial.print("DAC: Unknow error at 0x.");
			Serial.print(m_address, HEX);
			Serial.println(".");
			break;
	}	
	return ( (error == 0) ? 1 : 0 );
}

}
}
