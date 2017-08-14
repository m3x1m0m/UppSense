//----------------------------------------------------------------------------------------------------------------------------
// Project:    	Uppsense
// Name:	excitation_light.h
// Author:	Maximilian Stiefel
// Date:	09.08.2017
//
// Description: 
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
class cExcitationLight
{
public:
	cExcitationLight(); // Constructor
	~cExcitationLight(); // Destructor
	uint8_t SetCurrent(uint16_t microamp);
	uint8_t RectangleUpdate();
	uint8_t DeactivateLED();
private:
	dac::cDAC101C085 *m_DAC;
	uint8_t m_rectangleStatus;
	uint16_t m_DACRectHigh;
};

}
}
#endif /* APP_EXCITATION_LIGHT_H_ */
