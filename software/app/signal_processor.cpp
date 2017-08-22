//----------------------------------------------------------------------------------------------------------------------------
// Project:     Uppsense
// Name:        signal_processor.cpp
// Author:      Maximilian Stiefel
// Date:        22.08.2017
//
// Description:
//
//----------------------------------------------------------------------------------------------------------------------------

//-------------------------------------Libraries------------------------------------------------------------------------------
#include "signal_processor.h"
#include <SmingCore/SmingCore.h>

//-------------------------------------Namespaces-----------------------------------------------------------------------------
namespace rijnfel {

cSignalProcessor* cSignalProcessor::s_instance = NULL;

//-------------------------------------GetInstance----------------------------------------------------------------------------
cSignalProcessor* cSignalProcessor::GetInstance()
{
	if(s_instance == NULL)
		s_instance = new cSignalProcessor;
	return s_instance;
}

//-------------------------------------receiveADCValues-----------------------------------------------------------------------
void cSignalProcessor::receiveADCValues(cADC<ads::ads_sample_t, int32_t> & i_adc, cDoubleBuffer<ads::ads_sample_t>& i_adcBuffer) {
        ads::ads_sample_t * buf = &i_adcBuffer.GetReadyBuffer()[0];
        if (buf != NULL) {
                int pos = buf->mux - ads::eInputMux::AIN_0;
                int64_t average = 0;
                int size = i_adcBuffer.GetSize();
                for (int i = 0; i < size; i++) {
                        average += i_adc.ConvertSample(buf[i]);                 
                }
                if (size != 0) {
                        average /= size;
                }
       		Serial.printf("Average: %d/n/r", average);         
	}
}
}
