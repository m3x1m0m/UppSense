//----------------------------------------------------------------------------------------------------------------------------
// Project:     Uppsense
// Name:        excitation_light.cpp
// Author:      Maximilian Stiefel
// Date:        09.08.2017
//
// Description: 
//
//----------------------------------------------------------------------------------------------------------------------------

//-------------------------------------Libraries------------------------------------------------------------------------------
#include "excitation_light.h"
#include "defines.h"
#include <SmingCore/SmingCore.h>

//-------------------------------------Namespaces-----------------------------------------------------------------------------
namespace rijnfel {
namespace light {

//-------------------------------------Constructor----------------------------------------------------------------------------
cExcitationLight::cExcitationLight():
		m_rectangleStatus(0), m_DACRectHigh(0)
{
	m_DAC = new dac::cDAC101C085(1, 0xE);
}

//-------------------------------------Destructor-----------------------------------------------------------------------------
cExcitationLight::~cExcitationLight()
{
	delete m_DAC;
}

//-------------------------------------setCurrent-----------------------------------------------------------------------------
uint8_t cExcitationLight::SetCurrent(uint16_t microamp)
{	
	uint32_t new_DACRectHigh = 0; 
	if(microamp < CURR_MAX_UAMP)
	{
		new_DACRectHigh = ( (microamp*R_SENSE*RESOLUTION_DAC)/VREF_DAC ) / 1000;
	        #if DEBUG_LEVEL == 1	
		Serial.print("DAC value: ");
		Serial.println(new_DACRectHigh);	
		#endif
		m_DACRectHigh = new_DACRectHigh;
		return 1;
	}
	else
		return 0;
}

//-------------------------------------rectangleUpdate------------------------------------------------------------------------
uint8_t cExcitationLight::RectangleUpdate()
{
	m_rectangleStatus ? m_DAC->ChangeSettings(dac::eOpMode::NORMAL, 0) : m_DAC->ChangeSettings(dac::eOpMode::NORMAL, m_DACRectHigh);
	m_rectangleStatus ^= 0xFF;
}

//-------------------------------------DeactivateLED--------------------------------------------------------------------------
uint8_t cExcitationLight::DeactivateLED()
{
	return m_DAC->ChangeSettings(dac::eOpMode::PULL_DOWN_2K5, 0);
}

}
}
