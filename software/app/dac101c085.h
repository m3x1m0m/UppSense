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
#include <defines.h>

//-------------------------------------Defines--------------------------------------------------------------------------------
#define PD_BITS_POS 13 // Position of power down bits
#define D_BITS_POS 2 // Position of data bits

//-------------------------------------Namespaces-----------------------------------------------------------------------------
namespace rijnfel {
namespace dac {

//-------------------------------------Enums----------------------------------------------------------------------------------
/** Represents the operational mode of the DAC.
 */
enum eOpMode {NORMAL, PULL_DOWN_2K5, PULL_DOWN_100K, HIGH_IMPEDANCE};

//-------------------------------------cDAC101085-----------------------------------------------------------------------------
/** Small simple driver for the TI DAC101C085.
 */
class cDAC101C085
{
public:
	/** 	@brief  Instantiate DAC, assign a number and an address.
	 *  	@param  i_dac_number Number of the DAC.
	 *  	@param  i_address I2C address of this DAC.
	 */
	cDAC101C085(uint8_t i_dac_number, uint8_t i_address); // Constructor
	
	/** 	@brief Free DAC, is currently doing nothing.
	 */	
	~cDAC101C085(); // Destructor
	
	/**	@brief Check if the device is answering on the bus.
	 *	@retval uint8_t Returns 1 on success, 0 when failing. 
	 */
	uint8_t CheckDev(); // Check if device is available and alive
	
	/**	@brief Read out 16 bit register of the DAC.
	 * 	@retval uint16_t 16 bit read from the DAC.
	 */
	uint16_t ReadSettings(void);
	
	/**	@brief Write new setting to DAC register.
	 * 	@retval uint8_t Returns 1 on success, 0 when failing.
	 */
	uint8_t ChangeSettings(enum eOpMode mode, uint16_t val);

private:	
	uint8_t m_dac_number; // Which of the dacs is it?
	uint8_t m_address;
	uint8_t WriteSettings(uint16_t settings);
	uint8_t I2CError(uint8_t error);
};

}
}

#endif /* APP_DAC101C085_H_ */
