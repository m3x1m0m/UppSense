//----------------------------------------------------------------------------------------------------------------------------
// Project:    	Uppsense
// Name:	excitation_light.h
// Author:	Maximilian Stiefel
// Date:	09.08.2017
//
// Description: Class to use the excitation light in an advanced way with the help of a DAC. 
//
//----------------------------------------------------------------------------------------------------------------------------

#ifndef APP_EXCITATION_LIGHT_H_
#define APP_EXCITATION_LIGHT_H_

//-------------------------------------Libraries------------------------------------------------------------------------------
#include <stdint.h>
#include "dac101c085.h"
#include "hardware.h"

//-------------------------------------Defines--------------------------------------------------------------------------------

//-------------------------------------Namespaces-----------------------------------------------------------------------------
namespace rijnfel {
namespace light {

//-------------------------------------Enums----------------------------------------------------------------------------------

//-------------------------------------cExcitationLight-----------------------------------------------------------------------
/** Class to use the excitation light in an advanced way with the help of a DAC.
 */
class cExcitationLight
{
public:
	/** Construct object, allocate space for DAC.
	 */
	cExcitationLight(); // Constructor
	
	/** Destruct object, free space for DAC.
	 */
	~cExcitationLight(); // Destructor
	
	/** Set the desired current through excitation light.
	 * @param microamp Current in uA.
	 * @retval uint8_t Returns 1 on success, 0 when failing.
	 */
	uint8_t SetCurrent(uint16_t microamp);
	
	/** Function to be hooked up to a timer to generate rectangular signal.
	 * @retval uint8_t Returns 1 on success, 0 when failing.
	 */
	uint8_t RectangleUpdate();
	
	/** Use 2K5 pull-down resistor to turn LED completely off.
	 * @retval uint8_t Returns 1 on success, 0 when failing.
	 */
	uint8_t DeactivateLED();
private:
	dac::cDAC101C085 *m_DAC;
	uint8_t m_rectangleStatus;
	uint16_t m_DACRectHigh;
};

}
}
#endif /* APP_EXCITATION_LIGHT_H_ */
