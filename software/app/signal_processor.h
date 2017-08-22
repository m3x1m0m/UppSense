//----------------------------------------------------------------------------------------------------------------------------
// Project:    	Uppsense
// Name:	signal_processor.h
// Author:	Maximilian Stiefel
// Date:	22.08.2017
//
// Description: 
//
//----------------------------------------------------------------------------------------------------------------------------

#ifndef APP_SIGNAL_PROCESSOR_H_
#define APP_SIGNAL_PROCESSOR_H_

//-------------------------------------Libraries------------------------------------------------------------------------------
#include <stdint.h>
#include "defines.h"
#include "double_buffer.h"
#include "adc.h"
#include "ads101x.h"

//-------------------------------------Defines--------------------------------------------------------------------------------

//-------------------------------------Namespaces-----------------------------------------------------------------------------
namespace rijnfel {

//-------------------------------------Enums----------------------------------------------------------------------------------

//-------------------------------------cDAC101085-----------------------------------------------------------------------------
/** Small simple driver for the TI DAC101C085.
 */
class cSignalProcessor
{

public:	
	/**
	  * 	@brief Returns the global cSignalProcessor instance.
	  *     Only one webserver should ever be running
	  *     @return global cSignalProcessor instance
	  *                                     */
	static cSignalProcessor *GetInstance();
public:	
	/**
	 * 	@brief Notifies object that new samples are available.
	 * 	@param i_adc Instance of the adc sensor.
	 * 	@param i_adcBuffer Buffer containing the raw adc values.
	 *                                     */
        void receiveADCValues(cADC<ads::ads_sample_t, int32_t> & i_adc, cDoubleBuffer<ads::ads_sample_t> & i_adcBuffer);	

private:
	// Singleton instance
	static cSignalProcessor *s_instance;
	/**
	 * @brief Constructor is private, so it can not be called.
	 */
	cSignalProcessor(){};
	/**
	 * @brief Copy constructor is private, so it can not be called.
	 */
	cSignalProcessor(cSignalProcessor const&){};
	/**
	 * @brief Assignment operator is private, so it can not be used.
	 */
	cSignalProcessor& operator=(cSignalProcessor const&){};
};
}
#endif /* APP_SIGNAL_PROCESSOR_H_ */
