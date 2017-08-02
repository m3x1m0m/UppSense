/*
 * ADS101x.cpp
 *
 *  Created on: Jul 20, 2017
 *      Author: Elmar
 */

#include "ads101x.h"
#include <SmingCore/Wire.h>

namespace rijnfel {

namespace ads {

static const uint16_t OS_POS = 15;
static const uint16_t OS_MASK = 1 << OS_POS;
static const uint16_t MUX_POS = 12;
static const uint16_t MUX_MASK = 7 << MUX_POS;
static const uint16_t PGA_POS = 9;
static const uint16_t PGA_MASK = 7 << PGA_POS;
static const uint16_t MODE_POS = 8;
static const uint16_t MODE_MASK = 1 << MODE_POS;
static const uint16_t DR_POS = 5;
static const uint16_t DR_MASK = 7 << DR_POS;

#define OS_BIT(val) 	((val << OS_POS) & OS_MASK)
#define MUX_BIT(val) 	((val << MUX_POS) & MUX_MASK)
#define PGA_BIT(val) 	((val << PGA_POS) & PGA_MASK)
#define MODE_BIT(val) 	((val << MODE_POS) & MODE_MASK)
#define DR_BIT(val) 	((val << DR_POS) & DR_MASK)

static const uint8_t REGISTER_CONVERSION = 0;
static const uint8_t REGISTER_CONFIG = 1;
static const uint8_t REGISTER_LOW_TRESHOLD = 2;
static const uint8_t REGISTER_HIGH_TRESHOLD = 2;

cADS101x::cADS101x(uint8_t i_address) :
		m_address(i_address), m_readyPin(0) {
	SetDefaults();
}
cADS101x::cADS101x(uint8_t i_readyPin, uint8_t i_address) :
		m_address(i_address), m_readyPin(i_readyPin) {
	SetDefaults();
}

void cADS101x::SetOneShot(bool i_oneShot) {
	m_oneShot = i_oneShot;
	WriteSettings(CreateSettings(0));
}

void cADS101x::SetGain(enum eGainAmplifier i_gain) {
	m_gain = i_gain;
	WriteSettings(CreateSettings(0));
}

void cADS101x::SetMux(enum eInputMux i_mux) {
	m_mux = i_mux;
	WriteSettings(CreateSettings(0));
}

void cADS101x::SetSampleSpeed(enum eSampleSpeed i_sampleSpeed) {
	m_sampleSpeed = i_sampleSpeed;
	WriteSettings(CreateSettings(0));
}

void cADS101x::WaitSample(void) {
	OneShot();
	uint16 readSettings = 0;
	do {
		readSettings = GetSettings();
	} while (readSettings & OS_MASK != 1);
}

bool cADS101x::IsReady(void) {
	return (GetSettings() & OS_MASK);
}

uint16_t cADS101x::CreateSettings(uint8_t start) {
	return OS_BIT(start) | MUX_BIT(m_mux) | PGA_BIT(m_gain)
			| MODE_BIT(m_oneShot) | DR_BIT(m_sampleSpeed);
}

void cADS101x::WriteSettings(uint16_t i_settings) {
	Wire.beginTransmission(m_address);
	Wire.write(REGISTER_CONFIG);
	Wire.write((uint8_t) (i_settings >> 8));
	Wire.write((uint8_t) (i_settings & 0xFF));
	Wire.endTransmission();

}

void cADS101x::OneShot(void) {
	if (m_oneShot) {
		uint16_t settings = CreateSettings(1);
		WriteSettings(settings);
	}
}

uint16_t cADS101x::GetSettings(void) {
	uint16_t settings;
	Wire.beginTransmission(m_address);
	Wire.write(REGISTER_CONFIG);
	Wire.endTransmission();
	Wire.beginTransmission(m_address);
	Wire.requestFrom((int) m_address, 2);	//16 bits
	settings = Wire.read() << 8;
	settings |= Wire.read();
	return settings;
}
ads_voltage_t cADS101x::ConvertSample(ads_sample_t & sample) {
	//Raw sample is in (parts of) millivolts, go to micro to remove fractions
	ads_voltage_t returnType = (sample.rawSample >> 4) * 1000; //Multiply for extra precision
	switch (sample.gain) {
	case eGainAmplifier::FSR_0_256:
		//one lsb is  0.256 mv = 256 uv
		returnType *= 256;
		break;
	case eGainAmplifier::FSR_0_512:
		//one lsb is  0.512 mv = 512 uv
		returnType *= 512;
		break;
	case eGainAmplifier::FSR_1_024:
		//one lsb is  1.024 mv = 1024 uv
		returnType *= 1024;
		break;
	case eGainAmplifier::FSR_2_048:
		//one lsb is  2.048 mv = 2048 uv
		returnType *= 2048;
		break;
	case eGainAmplifier::FSR_4_096:
		//one lsb is  4.096 mv = 4096 uv
		returnType *= 4096;
		break;
	case eGainAmplifier::FSR_6_144:
		//one lsb is  6.144 mv = 6144 uv
		returnType *= 6144;
		break;
	}
	return returnType;
}

ads_sample_t cADS101x::RawSample(void) {
	OneShot();
	ads_sample_t sample;
	Wire.beginTransmission(m_address);
	Wire.write(REGISTER_CONVERSION);
	Wire.endTransmission();
	Wire.beginTransmission(m_address);
	Wire.requestFrom((int) m_address, 2);	//16 bits
	sample.rawSample = Wire.read() << 8;
	sample.rawSample |= Wire.read();
	sample.gain = m_gain;
	sample.mux = m_mux;
	m_latestSample = sample;
	return sample;
}

void cADS101x::SetDefaults(void) {
	m_mux = eInputMux::AIN_0_1;
	m_gain = eGainAmplifier::FSR_2_048;
	m_sampleSpeed = eSampleSpeed::SPS_1600;
	m_oneShot = true;
}

}

}
