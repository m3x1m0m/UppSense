//----------------------------------------------------------------------------------------------------------------------------
// Project:    	Uppsense
// Name:	dac101c085.h
// Author:	Maximilian Stiefel
// Date:	08.08.2017
//
// Description: Small simple driver for the TI DAC101C085.
//
//----------------------------------------------------------------------------------------------------------------------------

#ifndef APP_DAC101C085_H_
#define APP_DAC101C085_H_

//-------------------------------------Libraries------------------------------------------------------------------------------
#include <stdint.h>
#include "defines.h"

//-------------------------------------Defines--------------------------------------------------------------------------------
#define PD_BITS_POS 13 // Position of power down bits
#define D_BITS_POS 2 // Position of data bits

//-------------------------------------Namespaces-----------------------------------------------------------------------------
namespace rijnfel {
namespace dac {

//-------------------------------------Enums----------------------------------------------------------------------------------
enum eOpMode {NORMAL, PULL_DOWN_2K5, PULL_DOWN_100K, HIGH_IMPEDANCE};

//-------------------------------------cDAC101085-----------------------------------------------------------------------------
class cDAC101C085
{
public:
	cDAC101C085(uint8_t number, uint8_t i_address); // Constructor
	~cDAC101C085(); // Destructor
	void CheckDev(); // Check if device is available and alive
	uint16_t ReadSettings(void);
	uint8_t ChangeSettings(enum eOpMode mode, uint16_t val);

private:	
	uint8_t m_number; // Which of the dacs is it?
	uint8_t m_address;
	uint8_t WriteSettings(uint16_t settings);
	uint8_t I2CError(uint8_t error);
};

}
}
#endif /* APP_DAC101C085_H_ */
