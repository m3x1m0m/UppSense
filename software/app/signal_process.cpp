/*
 * signal_process.cpp
 *
 *  Created on: Aug 22, 2017
 *      Author: Elmar
 */

#include "signal_process.h"
#include <stddef.h>
#include <SmingCore/SmingCore.h>
#include <rijnfel_core/rijnfel_core.h>
#include <arduinoFFT.h>
#include <signal_processing.h>

//TODO remove this

namespace rijnfel {

cSignalProcess::cSignalProcess() :
		m_incommingData(this) {
	m_currentIndex = 0;
	m_currentMaxIndex = 0;
	m_currentBuffer = NULL;
	// TODO Auto-generated constructor stub

}

cSignalProcess::~cSignalProcess() {
	// TODO Auto-generated destructor stub
}

void cSignalProcess::ReceiveCallback(void* i_data, cDataReceiver* i_provider) {
	sSizedArray * arr = static_cast<sSizedArray*>(i_data);
	process(arr->array, arr->size);
	m_processedData.Push(i_data);
}

void cSignalProcess::process(uint32_t* io_array, size_t size) {
	//Vars
	arduinoFFT FFT;
	double vReal[SAMPLES];
	double vImag[SAMPLES];

	//Action
	Serial.printf("Size:%d\n", size);
	for(int i = 0; i < SAMPLES; i++)
	{
		vReal[i] = (double)(io_array[i]);	
	}
	Serial.printf("Casted.\n");
	FFT.Windowing(vReal, SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);	
	Serial.printf("Windowed.\n");
	FFT.Compute(vReal, vImag, SAMPLES, FFT_FORWARD);
	Serial.printf("Computed.\n");
	print(vReal);
}

void cSignalProcess::print(double* vData)
{
	for(int i = 0; i < SAMPLES; i++)
	{
		if(i == SAMPLES-1)
			Serial.printf("%f\n", vData[i]);
		else
			Serial.printf("%f, ", vData[i]);
	}
}

} /* namespace rijnfel */
