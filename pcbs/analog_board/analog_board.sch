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
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title "Transimpedance Amplifier"
Date "2017-05-03"
Rev "1"
Comp "Uppsala University"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L +5V #PWR04
U 1 1 58FDE6B6
P 1700 1425
F 0 "#PWR04" H 1700 1275 50  0001 C CNN
F 1 "+5V" H 1700 1565 50  0000 C CNN
F 2 "" H 1700 1425 50  0000 C CNN
F 3 "" H 1700 1425 50  0000 C CNN
	1    1700 1425
	1    0    0    -1  
$EndComp
$Comp
L TEST TP2
U 1 1 58FEC254
P 2050 1425
F 0 "TP2" H 2050 1725 50  0000 C BNN
F 1 "TEST" H 2050 1675 50  0000 C CNN
F 2 "Testpoints:TP_SMD_quadr_3mm" H 2050 1425 50  0001 C CNN
F 3 "" H 2050 1425 50  0000 C CNN
	1    2050 1425
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1700 1425 1700 1575
Wire Wire Line
	1700 1575 2050 1575
Wire Wire Line
	2050 1575 2050 1425
$Comp
L GND #PWR08
U 1 1 58FF10F3
P 2600 1525
F 0 "#PWR08" H 2600 1275 50  0001 C CNN
F 1 "GND" H 2600 1375 50  0000 C CNN
F 2 "" H 2600 1525 50  0000 C CNN
F 3 "" H 2600 1525 50  0000 C CNN
	1    2600 1525
	1    0    0    -1  
$EndComp
$Comp
L TEST TP3
U 1 1 58FF116B
P 2600 1375
F 0 "TP3" H 2600 1675 50  0000 C BNN
F 1 "TEST" H 2600 1625 50  0000 C CNN
F 2 "Testpoints:TP_SMD_quadr_3mm" H 2600 1375 50  0001 C CNN
F 3 "" H 2600 1375 50  0000 C CNN
	1    2600 1375
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2600 1375 2600 1525
$Sheet
S 2575 2650 3300 3500
U 59409417
F0 "highCurrent" 60
F1 "highCurrent.sch" 60
$EndSheet
$Sheet
S 7550 2650 3300 3500
U 5940AE3E
F0 "lowCurrent" 60
F1 "lowCurrent.sch" 60
$EndSheet
$EndSCHEMATC
