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
#include "hardware.h"
#include <SmingCore/SmingCore.h>

//-------------------------------------Namespaces-----------------------------------------------------------------------------
namespace rijnfel {
namespace light {

//-------------------------------------Constructor----------------------------------------------------------------------------
cExcitationLight::cExcitationLight():
		m_rectangleStatus(0), m_DACRectHigh(0)
{
	m_DAC = new dac::cDAC101C085(1, DAC1_ADDRESS);
}

//-------------------------------------Destructor-----------------------------------------------------------------------------
cExcitationLight::~cExcitationLight()
{
	delete m_DAC;
}

//-------------------------------------setCurrent-----------------------------------------------------------------------------
uint8_t cExcitationLight::SetCurrent(uint16_t microamp)
{	
	uint16_t new_DACRectHigh = 0 
	if(microamp < CURR_MAX_UAMP)
	{
		new_DACRectHigh = microamp/R_SENSE_DIV_FACT;
	       	Serial.println(m_DACRectHigh);	
		return 1;
	}
	else
		return 0;
}

//-------------------------------------rectangleUpdate------------------------------------------------------------------------
uint8_t cExcitationLight::RectangleUpdate()
{
	m_rectangleStatus ? m_DAC->ChangeSettings(dac::eOpMode::NORMAL, 0) : m_DAC->ChangeSettings(dac::eOpMode::NORMAL, m_DAC_Rect_High);
	m_rectangleStatus ^= 0xFF;
}


}
}
