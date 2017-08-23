/*
 * tests.h
 *
 *  Created on: Aug 23, 2017
 *      Author: Elmar
 */

#ifndef APP_TESTS_H_
#define APP_TESTS_H_

#include "ads101x.h"
#include "dac101c085.h"

void SettingsTest(rijnfel::ads::cADS101x ads1015);
void AdcTest(rijnfel::ads::cADS101x * ads1015);

#endif /* APP_TESTS_H_ */
