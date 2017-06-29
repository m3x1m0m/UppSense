EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ad8616
LIBS:icl7660
LIBS:analog_board-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title "SensUs Sensor"
Date "2017-06-14"
Rev "v.0.2"
Comp "Uppsala University"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5100 3125 1700 1175
U 5940AE3E
F0 "sensitiveReadout" 60
F1 "sensitiveReadout.sch" 60
F2 "BPW34FA_OUT" O L 5100 3325 60 
$EndSheet
$Sheet
S 8000 3150 1700 1150
U 5954D902
F0 "interface" 60
F1 "interface.sch" 60
F2 "5V" O L 8000 3300 60 
F3 "ADC1" I L 8000 3800 60 
F4 "ADC2" I L 8000 3900 60 
F5 "ADC3" I L 8000 4000 60 
F6 "ADC4" I L 8000 4100 60 
F7 "GND" O L 8000 3500 60 
F8 "3.3V" O L 8000 3400 60 
F9 "I2C_SCL" O R 9700 4000 60 
F10 "DAC1" O R 9700 3300 60 
F11 "DAC2" O R 9700 3400 60 
F12 "GPIO4" B R 9700 3850 60 
F13 "GPIO3" B R 9700 3750 60 
F14 "GPIO2" B R 9700 3650 60 
F15 "GPIO1" B R 9700 3550 60 
F16 "I2C_SDA" B R 9700 4100 60 
$EndSheet
$Sheet
S 1950 3100 1700 1200
U 59409417
F0 "highCurrentPart" 60
F1 "highCurrentPart.sch" 60
F2 "BPW34_OUT" O L 1950 3275 60 
$EndSheet
$Comp
L +3.3V #PWR?
U 1 1 59551FE0
P 7650 3400
F 0 "#PWR?" H 7650 3250 50  0001 C CNN
F 1 "+3.3V" H 7650 3540 50  0000 C CNN
F 2 "" H 7650 3400 50  0001 C CNN
F 3 "" H 7650 3400 50  0001 C CNN
	1    7650 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3400 7650 3400
$Comp
L GND #PWR?
U 1 1 595520F8
P 7650 3500
F 0 "#PWR?" H 7650 3250 50  0001 C CNN
F 1 "GND" H 7650 3350 50  0000 C CNN
F 2 "" H 7650 3500 50  0001 C CNN
F 3 "" H 7650 3500 50  0001 C CNN
	1    7650 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3500 8000 3500
$Comp
L +5V #PWR?
U 1 1 59552732
P 7650 3150
F 0 "#PWR?" H 7650 3000 50  0001 C CNN
F 1 "+5V" H 7650 3290 50  0000 C CNN
F 2 "" H 7650 3150 50  0001 C CNN
F 3 "" H 7650 3150 50  0001 C CNN
	1    7650 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3300 7800 3300
Wire Wire Line
	7800 3300 7800 3150
Wire Wire Line
	7800 3150 7650 3150
$EndSCHEMATC
