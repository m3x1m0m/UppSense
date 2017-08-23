/*
 * ADS101x.h
 *
 *  Created on: Jul 20, 2017
 *      Author: Elmar
 */

#ifndef APP_ADS101X_H_
#define APP_ADS101X_H_

#include <stdint.h>
#include <hardware.h>
#include <rijnfel_core/rijnfel_core.h>

namespace rijnfel {

namespace ads {

//Voltage in uV
typedef int32_t ads_voltage_t;

enum eInputMux {
	AIN_0_1, AIN_0_3, AIN_1_3, AIN_2_3, AIN_0, AIN_1, AIN_2, AIN_3
};
enum eGainAmplifier {
	FSR_6_144, FSR_4_096, FSR_2_048, FSR_1_024, FSR_0_512, FSR_0_256
};
enum eSampleSpeed {
	SPS_128, SPS_250, SPS_490, SPS_920, SPS_1600, SPS_2400, SPS_3300
};

struct ads_sample_t {
	uint16_t rawSample;
	enum eInputMux mux;
	enum eGainAmplifier gain;
};

class cADS101x: public cADC<ads_sample_t, ads_voltage_t> {
public:

	cADS101x(uint8_t i_address = 0x48);
	cADS101x(uint8_t i_readyPin, uint8_t i_address = 0x48);

	void SetOneShot(bool i_oneShot = true);
	void SetGain(enum eGainAmplifier i_gain);
	void SetMux(enum eInputMux i_mux);
	void SetSampleSpeed(enum eSampleSpeed i_speed);
	virtual void WaitSample(void);
	virtual bool IsReady(void);
	uint16_t GetSettings(void);

	virtual ads_sample_t RawSample(void);
	virtual ads_voltage_t ConvertSample(ads_sample_t & sample);
	virtual ~cADS101x() {

	}
private:
	uint16_t CreateSettings(uint8_t i_startSample);
	uint16_t ReadRegister(uint8_t i_register);
	void WriteSettings(uint16_t i_settings);
	void SetDefaults(void);
	void OneShot(void);
private:
	uint8_t m_address, m_readyPin;
	bool m_oneShot;
	enum eInputMux m_mux;
	enum eGainAmplifier m_gain;
	enum eSampleSpeed m_sampleSpeed;
private:
#ifdef DUMMY_ADC
	uint16_t m_counter;
#endif
};
}
}
#endif /* APP_ADS101X_H_ */
