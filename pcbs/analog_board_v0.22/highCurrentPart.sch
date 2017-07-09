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
LIBS:ada4530-1
LIBS:ada4522-2
LIBS:ltc6268
LIBS:analog_board_v0.22-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title "High Current Part of Analog Board"
Date "2017-07-05"
Rev "v0.2"
Comp "UppSense Heart Failure Diagnostics"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L GND #PWR020
U 1 1 5940A4E3
P 8150 3325
F 0 "#PWR020" H 8150 3075 50  0001 C CNN
F 1 "GND" H 8150 3175 50  0000 C CNN
F 2 "" H 8150 3325 50  0000 C CNN
F 3 "" H 8150 3325 50  0000 C CNN
	1    8150 3325
	1    0    0    -1  
$EndComp
$Comp
L AD8616 U4
U 1 1 5940A4EA
P 8150 2650
F 0 "U4" H 7529 2354 50  0000 L CNN
F 1 "AD8616" H 8450 2350 50  0000 L CNN
F 2 "SMD_Packages:SOIC-8-N" H 7953 2700 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1841629.pdf" H 7853 2800 50  0001 C CNN
F 4 "1581952" H 8150 2650 60  0001 C CNN "Farnell"
	1    8150 2650
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 5940A522
P 9375 2350
F 0 "R13" V 9455 2350 50  0000 C CNN
F 1 "1M" V 9375 2350 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 9305 2350 50  0001 C CNN
F 3 "" H 9375 2350 50  0000 C CNN
F 4 "1576507" V 9375 2350 60  0001 C CNN "Farnell"
	1    9375 2350
	0    1    -1   0   
$EndComp
$Comp
L D_Photo D3
U 1 1 5940A54D
P 9725 3025
F 0 "D3" H 9745 3095 50  0000 L CNN
F 1 "BPW34" H 9685 2915 50  0000 C CNN
F 2 "Photodiodes:BPW34FA" H 9675 3025 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2046123.pdf" H 9675 3025 50  0001 C CNN
F 4 "1045425" H 9725 3025 60  0001 C CNN "Farnell"
	1    9725 3025
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR021
U 1 1 5940A554
P 9725 3325
F 0 "#PWR021" H 9725 3075 50  0001 C CNN
F 1 "GND" H 9725 3175 50  0000 C CNN
F 2 "" H 9725 3325 50  0000 C CNN
F 3 "" H 9725 3325 50  0000 C CNN
	1    9725 3325
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8900 2350 9225 2350
Wire Wire Line
	8150 3200 8150 3325
$Comp
L LED D2
U 1 1 5940A5C4
P 6775 1900
F 0 "D2" H 6775 2000 50  0000 C CNN
F 1 "LED" H 6775 1800 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 6775 1900 50  0001 C CNN
F 3 "" H 6775 1900 50  0000 C CNN
	1    6775 1900
	0    -1   -1   0   
$EndComp
$Comp
L POT RV1
U 1 1 5940A5CC
P 7900 3925
F 0 "RV1" V 7725 3925 50  0000 C CNN
F 1 "T73YE103KT20" V 7800 3925 50  0000 C CNN
F 2 "MyPotis:Vishay_T73YE103KT20" H 7900 3925 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2243711.pdf" H 7900 3925 50  0001 C CNN
F 4 "2550676" V 7900 3925 60  0001 C CNN "Farnell"
	1    7900 3925
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 5940A5D3
P 6775 3075
F 0 "R9" V 6855 3075 50  0000 C CNN
F 1 "100R" V 6775 3075 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 6705 3075 50  0001 C CNN
F 3 "" H 6775 3075 50  0000 C CNN
F 4 "1632456" V 6775 3075 60  0001 C CNN "Farnell"
	1    6775 3075
	1    0    0    -1  
$EndComp
Wire Wire Line
	6775 2550 6775 2925
Wire Wire Line
	6775 2050 6775 2150
$Comp
L +5V #PWR022
U 1 1 5940A5DC
P 6775 1675
F 0 "#PWR022" H 6775 1525 50  0001 C CNN
F 1 "+5V" H 6775 1815 50  0000 C CNN
F 2 "" H 6775 1675 50  0000 C CNN
F 3 "" H 6775 1675 50  0000 C CNN
	1    6775 1675
	1    0    0    -1  
$EndComp
Wire Wire Line
	6775 1675 6775 1750
$Comp
L GND #PWR023
U 1 1 5940A5E4
P 6775 3350
F 0 "#PWR023" H 6775 3100 50  0001 C CNN
F 1 "GND" H 6775 3200 50  0000 C CNN
F 2 "" H 6775 3350 50  0000 C CNN
F 3 "" H 6775 3350 50  0000 C CNN
	1    6775 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6775 3225 6775 3350
$Comp
L MMBT3904 Q9
U 1 1 5940A5EB
P 6875 2350
F 0 "Q9" H 7075 2425 50  0000 L CNN
F 1 "MMBT3904" H 7075 2350 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 7075 2275 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/MM/MMBT3904.pdf" H 6875 2350 50  0001 L CNN
F 4 "1757935" H 6875 2350 60  0001 C CNN "Farnell"
	1    6875 2350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9725 3125 9725 3325
Wire Wire Line
	7075 2350 7350 2350
Text GLabel 7350 2750 0    60   Input ~ 0
Signal
$Comp
L GND #PWR024
U 1 1 5940A601
P 7675 3925
F 0 "#PWR024" H 7675 3675 50  0001 C CNN
F 1 "GND" H 7675 3775 50  0000 C CNN
F 2 "" H 7675 3925 50  0000 C CNN
F 3 "" H 7675 3925 50  0000 C CNN
	1    7675 3925
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3925 8050 3925
Wire Wire Line
	7750 3925 7675 3925
Text GLabel 9825 4450 2    60   Output ~ 0
Signal
$Comp
L +5V #PWR025
U 1 1 5940A60A
P 8450 3925
F 0 "#PWR025" H 8450 3775 50  0001 C CNN
F 1 "+5V" H 8450 4065 50  0000 C CNN
F 2 "" H 8450 3925 50  0000 C CNN
F 3 "" H 8450 3925 50  0000 C CNN
	1    8450 3925
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3925 8400 3925
Wire Wire Line
	6900 2550 7350 2550
Wire Wire Line
	6775 2775 6900 2775
Wire Wire Line
	6900 2775 6900 2550
Connection ~ 6775 2775
$Comp
L GND #PWR026
U 1 1 5940EF10
P 8900 3325
F 0 "#PWR026" H 8900 3075 50  0001 C CNN
F 1 "GND" H 8900 3175 50  0000 C CNN
F 2 "" H 8900 3325 50  0000 C CNN
F 3 "" H 8900 3325 50  0000 C CNN
	1    8900 3325
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8900 2750 8900 3325
$Comp
L C C20
U 1 1 594122D8
P 7350 1750
F 0 "C20" H 7375 1850 50  0000 L CNN
F 1 "1u" H 7375 1650 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 7388 1600 50  0001 C CNN
F 3 "" H 7350 1750 50  0000 C CNN
F 4 "2496946" H 7350 1750 60  0001 C CNN "Farnell"
	1    7350 1750
	1    0    0    -1  
$EndComp
$Comp
L C C21
U 1 1 594122E0
P 7600 1750
F 0 "C21" H 7625 1850 50  0000 L CNN
F 1 "100n" H 7625 1650 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 7638 1600 50  0001 C CNN
F 3 "" H 7600 1750 50  0000 C CNN
F 4 "499687" H 7600 1750 60  0001 C CNN "Farnell"
	1    7600 1750
	1    0    0    -1  
$EndComp
$Comp
L C C22
U 1 1 594122E8
P 7850 1750
F 0 "C22" H 7875 1850 50  0000 L CNN
F 1 "10n" H 7875 1650 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 7888 1600 50  0001 C CNN
F 3 "" H 7850 1750 50  0000 C CNN
F 4 "1414662" H 7850 1750 60  0001 C CNN "Farnell"
	1    7850 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 1600 8150 1600
Connection ~ 7600 1600
$Comp
L GND #PWR027
U 1 1 594122F3
P 7350 1975
F 0 "#PWR027" H 7350 1725 50  0001 C CNN
F 1 "GND" H 7350 1825 50  0000 C CNN
F 2 "" H 7350 1975 50  0000 C CNN
F 3 "" H 7350 1975 50  0000 C CNN
	1    7350 1975
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 1900 7350 1975
Wire Wire Line
	7350 1900 7850 1900
Connection ~ 7600 1900
Text Notes 5725 1450 0    60   ~ 0
Place decoupling capacitors close to component!
$Comp
L CONN_01X03 P3
U 1 1 5941362B
P 9525 4450
F 0 "P3" H 9525 4650 50  0000 C CNN
F 1 "CONN_01X03" V 9625 4450 50  0000 C CNN
F 2 "Samtec Connectors:Samtec-PHT-1-3-01-L-S" H 9525 4450 50  0001 C CNN
F 3 "" H 9525 4450 50  0000 C CNN
	1    9525 4450
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X03 P2
U 1 1 59416658
P 9200 4450
F 0 "P2" H 9200 4650 50  0000 C CNN
F 1 "CONN_01X03" V 9300 4450 50  0000 C CNN
F 2 "Samtec Connectors:Samtec-PHT-1-3-01-L-S" H 9200 4450 50  0001 C CNN
F 3 "" H 9200 4450 50  0000 C CNN
	1    9200 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9725 4225 9725 4550
Connection ~ 9725 4450
Wire Wire Line
	9725 4450 9825 4450
$Comp
L TEST SIG1
U 1 1 594174AB
P 9725 4225
F 0 "SIG1" H 9725 4525 50  0000 C BNN
F 1 "TEST" H 9725 4475 50  0000 C CNN
F 2 "Tespoints:TP_SMD_quadr_1mm" H 9725 4225 50  0001 C CNN
F 3 "" H 9725 4225 50  0000 C CNN
	1    9725 4225
	-1   0    0    -1  
$EndComp
Connection ~ 9725 4350
$Comp
L R R10
U 1 1 59417DE3
P 8250 3925
F 0 "R10" V 8330 3925 50  0000 C CNN
F 1 "100k" V 8250 3925 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 8180 3925 50  0001 C CNN
F 3 "" H 8250 3925 50  0000 C CNN
F 4 "2447551" V 8250 3925 60  0001 C CNN "Farnell"
	1    8250 3925
	0    1    1    0   
$EndComp
$Comp
L R R11
U 1 1 59417DEB
P 8450 4125
F 0 "R11" V 8530 4125 50  0000 C CNN
F 1 "10k" V 8450 4125 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 8380 4125 50  0001 C CNN
F 3 "" H 8450 4125 50  0000 C CNN
F 4 "9237755" V 8450 4125 60  0001 C CNN "Farnell"
	1    8450 4125
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 594182DF
P 8900 4125
F 0 "R12" V 8980 4125 50  0000 C CNN
F 1 "100k" V 8900 4125 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 8830 4125 50  0001 C CNN
F 3 "" H 8900 4125 50  0000 C CNN
F 4 "2447551" V 8900 4125 60  0001 C CNN "Farnell"
	1    8900 4125
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR028
U 1 1 5941842E
P 9075 4125
F 0 "#PWR028" H 9075 3975 50  0001 C CNN
F 1 "+5V" H 9075 4265 50  0000 C CNN
F 2 "" H 9075 4125 50  0000 C CNN
F 3 "" H 9075 4125 50  0000 C CNN
	1    9075 4125
	1    0    0    -1  
$EndComp
Wire Wire Line
	9075 4125 9050 4125
Wire Wire Line
	8600 4125 8750 4125
$Comp
L GND #PWR029
U 1 1 5941869D
P 8225 4125
F 0 "#PWR029" H 8225 3875 50  0001 C CNN
F 1 "GND" H 8225 3975 50  0000 C CNN
F 2 "" H 8225 4125 50  0000 C CNN
F 3 "" H 8225 4125 50  0000 C CNN
	1    8225 4125
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4125 8225 4125
Wire Wire Line
	8675 4125 8675 4350
Wire Wire Line
	8675 4350 9000 4350
Connection ~ 8675 4125
Wire Wire Line
	7900 4075 7900 4450
Wire Wire Line
	7900 4450 9000 4450
Text Notes 6425 5175 0    60   ~ 0
Constant current source with 100R sensing resistor. Monitoring diode included\nwith 1uA being translated into 1V.\n
Text Notes 8650 3800 0    60   ~ 0
Constant current with ca. 4.55 mA.
Text HLabel 9000 1875 1    60   Output ~ 0
BPW34_OUT
$Comp
L GND #PWR030
U 1 1 59553CC6
P 3000 1800
F 0 "#PWR030" H 3000 1550 50  0001 C CNN
F 1 "GND" H 3000 1650 50  0000 C CNN
F 2 "" H 3000 1800 50  0001 C CNN
F 3 "" H 3000 1800 50  0001 C CNN
	1    3000 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1800 3125 1800
$Comp
L C C17
U 1 1 5955413D
P 1400 1800
F 0 "C17" H 1425 1900 50  0000 L CNN
F 1 "10u" H 1425 1700 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 1438 1650 50  0001 C CNN
F 3 "" H 1400 1800 50  0001 C CNN
F 4 "1833812" H 1400 1800 60  0001 C CNN "Farnell"
	1    1400 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9725 2550 8900 2550
Wire Wire Line
	9725 2050 9725 2825
Wire Wire Line
	9725 2350 9525 2350
Connection ~ 9725 2550
Wire Wire Line
	9000 2050 9225 2050
Wire Wire Line
	9000 1875 9000 2350
Connection ~ 9000 2350
Wire Wire Line
	9525 2050 9725 2050
Connection ~ 9725 2350
Connection ~ 9000 2050
$Comp
L Q_PMOS_GSD Q3
U 1 1 59556D86
P 2275 5475
F 0 "Q3" H 2475 5525 50  0000 L CNN
F 1 "DMP2035U" H 2475 5425 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2475 5575 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2100440.pdf" H 2275 5475 50  0001 C CNN
F 4 "2061419" H 2275 5475 60  0001 C CNN "Farnell"
	1    2275 5475
	1    0    0    1   
$EndComp
Wire Wire Line
	2375 5675 2375 5925
$Comp
L GND #PWR031
U 1 1 59557860
P 2375 6425
F 0 "#PWR031" H 2375 6175 50  0001 C CNN
F 1 "GND" H 2375 6275 50  0000 C CNN
F 2 "" H 2375 6425 50  0000 C CNN
F 3 "" H 2375 6425 50  0000 C CNN
	1    2375 6425
	1    0    0    -1  
$EndComp
Wire Wire Line
	2375 6325 2375 6425
$Comp
L +5V #PWR032
U 1 1 59557DF9
P 2375 5200
F 0 "#PWR032" H 2375 5050 50  0001 C CNN
F 1 "+5V" H 2375 5340 50  0000 C CNN
F 2 "" H 2375 5200 50  0000 C CNN
F 3 "" H 2375 5200 50  0000 C CNN
	1    2375 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2375 5200 2375 5275
Wire Wire Line
	2075 5475 1950 5475
Wire Wire Line
	1950 5400 1950 6125
Wire Wire Line
	1950 6125 2075 6125
Text HLabel 1875 5800 0    60   Input ~ 0
GPIO_COIL_3
Wire Wire Line
	1875 5800 1950 5800
Connection ~ 1950 5800
Wire Wire Line
	4025 5675 4025 5925
$Comp
L GND #PWR033
U 1 1 59558304
P 4025 6425
F 0 "#PWR033" H 4025 6175 50  0001 C CNN
F 1 "GND" H 4025 6275 50  0000 C CNN
F 2 "" H 4025 6425 50  0000 C CNN
F 3 "" H 4025 6425 50  0000 C CNN
	1    4025 6425
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4025 6325 4025 6425
$Comp
L +5V #PWR034
U 1 1 5955830B
P 4025 5200
F 0 "#PWR034" H 4025 5050 50  0001 C CNN
F 1 "+5V" H 4025 5340 50  0000 C CNN
F 2 "" H 4025 5200 50  0000 C CNN
F 3 "" H 4025 5200 50  0000 C CNN
	1    4025 5200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4025 5200 4025 5275
Wire Wire Line
	4325 5475 4450 5475
Wire Wire Line
	4450 5400 4450 6125
Wire Wire Line
	4450 6125 4325 6125
Text HLabel 4525 5800 2    60   Input ~ 0
GPIO_COIL_4
Wire Wire Line
	4525 5800 4450 5800
Connection ~ 4450 5800
$Comp
L Q_PMOS_GSD Q7
U 1 1 5955D522
P 4125 5475
F 0 "Q7" H 4325 5525 50  0000 L CNN
F 1 "DMP2035U" H 4325 5425 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4325 5575 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2100440.pdf" H 4125 5475 50  0001 C CNN
F 4 "2061419" H 4125 5475 60  0001 C CNN "Farnell"
	1    4125 5475
	-1   0    0    1   
$EndComp
Wire Wire Line
	3350 5700 3350 5800
Wire Wire Line
	3350 5800 4025 5800
Connection ~ 4025 5800
Wire Wire Line
	2375 5800 3075 5800
Connection ~ 2375 5800
Wire Wire Line
	3075 5800 3075 5700
Text Notes 1625 6875 0    60   ~ 0
H bridge for driving a coil with a rectangular signal in the mHz range. Designed\nfor at least 100 mA. Maximum current unknown.
Wire Wire Line
	8150 1525 8150 2100
Connection ~ 7850 1600
Connection ~ 8150 1600
$Comp
L Q_PMOS_GSD Q1
U 1 1 5956290B
P 2275 3775
F 0 "Q1" H 2475 3825 50  0000 L CNN
F 1 "DMP2035U" H 2475 3725 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2475 3875 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2100440.pdf" H 2275 3775 50  0001 C CNN
F 4 "2061419" H 2275 3775 60  0001 C CNN "Farnell"
	1    2275 3775
	1    0    0    1   
$EndComp
$Comp
L Q_NMOS_GSD Q2
U 1 1 59562912
P 2275 4425
F 0 "Q2" H 2475 4475 50  0000 L CNN
F 1 "TSM2314" H 2475 4375 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2475 4525 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2044480.pdf" H 2275 4425 50  0001 C CNN
F 4 "1864589" H 2275 4425 60  0001 C CNN "Farnell"
	1    2275 4425
	1    0    0    -1  
$EndComp
Wire Wire Line
	2375 3975 2375 4225
$Comp
L GND #PWR035
U 1 1 5956291A
P 2375 4725
F 0 "#PWR035" H 2375 4475 50  0001 C CNN
F 1 "GND" H 2375 4575 50  0000 C CNN
F 2 "" H 2375 4725 50  0000 C CNN
F 3 "" H 2375 4725 50  0000 C CNN
	1    2375 4725
	1    0    0    -1  
$EndComp
Wire Wire Line
	2375 4625 2375 4725
$Comp
L +5V #PWR036
U 1 1 59562921
P 2375 3500
F 0 "#PWR036" H 2375 3350 50  0001 C CNN
F 1 "+5V" H 2375 3640 50  0000 C CNN
F 2 "" H 2375 3500 50  0000 C CNN
F 3 "" H 2375 3500 50  0000 C CNN
	1    2375 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2375 3500 2375 3575
Wire Wire Line
	2075 3775 1950 3775
Wire Wire Line
	1950 3700 1950 4425
Wire Wire Line
	1950 4425 2075 4425
Text HLabel 1875 4100 0    60   Input ~ 0
GPIO_COIL_1
Wire Wire Line
	1875 4100 1950 4100
Connection ~ 1950 4100
Wire Wire Line
	4025 3975 4025 4225
$Comp
L GND #PWR037
U 1 1 59562931
P 4025 4725
F 0 "#PWR037" H 4025 4475 50  0001 C CNN
F 1 "GND" H 4025 4575 50  0000 C CNN
F 2 "" H 4025 4725 50  0000 C CNN
F 3 "" H 4025 4725 50  0000 C CNN
	1    4025 4725
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4025 4625 4025 4725
$Comp
L +5V #PWR038
U 1 1 59562938
P 4025 3500
F 0 "#PWR038" H 4025 3350 50  0001 C CNN
F 1 "+5V" H 4025 3640 50  0000 C CNN
F 2 "" H 4025 3500 50  0000 C CNN
F 3 "" H 4025 3500 50  0000 C CNN
	1    4025 3500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4025 3500 4025 3575
Wire Wire Line
	4325 3775 4450 3775
Wire Wire Line
	4450 3700 4450 4425
Wire Wire Line
	4450 4425 4325 4425
Text HLabel 4525 4100 2    60   Input ~ 0
GPIO_COIL_2
Wire Wire Line
	4525 4100 4450 4100
Connection ~ 4450 4100
$Comp
L Q_PMOS_GSD Q5
U 1 1 59562954
P 4125 3775
F 0 "Q5" H 4325 3825 50  0000 L CNN
F 1 "DMP2035U" H 4325 3725 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4325 3875 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2100440.pdf" H 4125 3775 50  0001 C CNN
F 4 "2061419" H 4125 3775 60  0001 C CNN "Farnell"
	1    4125 3775
	-1   0    0    1   
$EndComp
Wire Wire Line
	3350 4000 3350 4100
Wire Wire Line
	3350 4100 4025 4100
Connection ~ 4025 4100
Wire Wire Line
	2375 4100 3075 4100
Connection ~ 2375 4100
Wire Wire Line
	3075 4100 3075 4000
Text HLabel 9000 4550 0    60   Input ~ 0
LED_CONTROLL
$Comp
L GND #PWR039
U 1 1 59563916
P 1850 1800
F 0 "#PWR039" H 1850 1550 50  0001 C CNN
F 1 "GND" H 1850 1650 50  0000 C CNN
F 2 "" H 1850 1800 50  0001 C CNN
F 3 "" H 1850 1800 50  0001 C CNN
	1    1850 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1800 1850 1800
Wire Wire Line
	2000 1650 1400 1650
Wire Wire Line
	1400 1950 1400 2025
Wire Wire Line
	1400 2025 2000 2025
Wire Wire Line
	2000 2025 2000 1950
$Comp
L +3.3V #PWR040
U 1 1 59563EC0
P 3000 1425
F 0 "#PWR040" H 3000 1275 50  0001 C CNN
F 1 "+3.3V" H 3000 1565 50  0000 C CNN
F 2 "" H 3000 1425 50  0001 C CNN
F 3 "" H 3000 1425 50  0001 C CNN
	1    3000 1425
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1425 3000 1500
Wire Wire Line
	2800 1500 3125 1500
$Comp
L C C18
U 1 1 595644A6
P 2900 2250
F 0 "C18" H 2925 2350 50  0000 L CNN
F 1 "10u" H 2925 2150 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 2938 2100 50  0001 C CNN
F 3 "" H 2900 2250 50  0001 C CNN
F 4 "1833812" H 2900 2250 60  0001 C CNN "Farnell"
	1    2900 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1950 2900 1950
Wire Wire Line
	2900 1950 2900 2100
$Comp
L GND #PWR041
U 1 1 5956469D
P 2900 2425
F 0 "#PWR041" H 2900 2175 50  0001 C CNN
F 1 "GND" H 2900 2275 50  0000 C CNN
F 2 "" H 2900 2425 50  0001 C CNN
F 3 "" H 2900 2425 50  0001 C CNN
	1    2900 2425
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2400 2900 2425
Text HLabel 3400 2050 2    60   Output ~ 0
-3.3V
Wire Wire Line
	2900 2050 3400 2050
Connection ~ 2900 2050
NoConn ~ 2800 1650
$Comp
L C C19
U 1 1 59565F34
P 3125 1650
F 0 "C19" H 3150 1750 50  0000 L CNN
F 1 "1u" H 3150 1550 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 3163 1500 50  0001 C CNN
F 3 "" H 3125 1650 50  0000 C CNN
F 4 "1845751" H 3125 1650 60  0001 C CNN "Farnell"
	1    3125 1650
	1    0    0    -1  
$EndComp
Connection ~ 3000 1500
Connection ~ 3000 1800
Text Notes 3325 1650 0    60   ~ 0
Place decoupling capacitors close to component!
$Comp
L CONN_01X03 P1
U 1 1 59567D00
P 1450 1225
F 0 "P1" H 1450 1425 50  0000 C CNN
F 1 "CONN_01X03" V 1550 1225 50  0000 C CNN
F 2 "Samtec Connectors:Samtec-PHT-1-3-01-L-S" H 1450 1225 50  0001 C CNN
F 3 "" H 1450 1225 50  0000 C CNN
	1    1450 1225
	-1   0    0    -1  
$EndComp
$Comp
L +3.3V #PWR042
U 1 1 595680C2
P 1825 1125
F 0 "#PWR042" H 1825 975 50  0001 C CNN
F 1 "+3.3V" H 1825 1265 50  0000 C CNN
F 2 "" H 1825 1125 50  0001 C CNN
F 3 "" H 1825 1125 50  0001 C CNN
	1    1825 1125
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1825 1125 1650 1125
NoConn ~ 1650 1325
Text Notes 1850 1175 0    60   ~ 0
Boost pin to make the oscillator faster. Enabled when connected to 3.3 V.
Text Notes 1375 2825 0    60   ~ 0
Charge pump to generate -3.3 V.
Text GLabel 3075 4000 1    60   UnSpc ~ 0
COIL_1
Text GLabel 3350 4000 1    60   UnSpc ~ 0
COIL_2
Text GLabel 3075 5700 1    60   UnSpc ~ 0
COIL_3
Text GLabel 3350 5700 1    60   UnSpc ~ 0
COIL_4
$Comp
L CONN_01X04 J3
U 1 1 5956B77E
P 5600 4925
F 0 "J3" H 5600 5175 50  0000 C CNN
F 1 "CONN_01X04" V 5700 4925 50  0000 C CNN
F 2 "China Connectors:LED_CONN_1.25_PITCH" H 5600 4925 50  0001 C CNN
F 3 "" H 5600 4925 50  0001 C CNN
	1    5600 4925
	1    0    0    -1  
$EndComp
Text GLabel 5400 4775 0    60   UnSpc ~ 0
COIL_1
Text GLabel 5400 4875 0    60   UnSpc ~ 0
COIL_2
Text GLabel 5400 4975 0    60   UnSpc ~ 0
COIL_3
Text GLabel 5400 5075 0    60   UnSpc ~ 0
COIL_4
$Comp
L TEST GPIO1
U 1 1 59595C55
P 1950 3700
F 0 "GPIO1" H 1950 4000 50  0000 C BNN
F 1 "TEST" H 1950 3950 50  0000 C CNN
F 2 "Tespoints:TP_SMD_quadr_1mm" H 1950 3700 50  0001 C CNN
F 3 "" H 1950 3700 50  0000 C CNN
	1    1950 3700
	-1   0    0    -1  
$EndComp
$Comp
L TEST GPIO2
U 1 1 59596119
P 4450 3700
F 0 "GPIO2" H 4450 4000 50  0000 C BNN
F 1 "TEST" H 4450 3950 50  0000 C CNN
F 2 "Tespoints:TP_SMD_quadr_1mm" H 4450 3700 50  0001 C CNN
F 3 "" H 4450 3700 50  0000 C CNN
	1    4450 3700
	-1   0    0    -1  
$EndComp
$Comp
L TEST GPIO3
U 1 1 59596260
P 1950 5400
F 0 "GPIO3" H 1950 5700 50  0000 C BNN
F 1 "TEST" H 1950 5650 50  0000 C CNN
F 2 "Tespoints:TP_SMD_quadr_1mm" H 1950 5400 50  0001 C CNN
F 3 "" H 1950 5400 50  0000 C CNN
	1    1950 5400
	-1   0    0    -1  
$EndComp
$Comp
L TEST GPIO4
U 1 1 5959632C
P 4450 5400
F 0 "GPIO4" H 4450 5700 50  0000 C BNN
F 1 "TEST" H 4450 5650 50  0000 C CNN
F 2 "Tespoints:TP_SMD_quadr_1mm" H 4450 5400 50  0001 C CNN
F 3 "" H 4450 5400 50  0000 C CNN
	1    4450 5400
	-1   0    0    -1  
$EndComp
$Comp
L TEST 3V3
U 1 1 59596507
P 3250 2150
F 0 "3V3" H 3250 2450 50  0000 C BNN
F 1 "TEST" H 3250 2400 50  0000 C CNN
F 2 "Tespoints:TP_SMD_quadr_1mm" H 3250 2150 50  0001 C CNN
F 3 "" H 3250 2150 50  0000 C CNN
	1    3250 2150
	1    0    0    1   
$EndComp
Wire Wire Line
	3250 2150 3250 2050
Connection ~ 3250 2050
Connection ~ 4450 3775
Connection ~ 1950 3775
Connection ~ 4450 5475
Connection ~ 1950 5475
$Comp
L ICL7660S U3
U 1 1 5956AD62
P 2400 1500
F 0 "U3" H 2245 1630 40  0000 C CNN
F 1 "ICL7660S" H 2525 1630 40  0000 C CNN
F 2 "SMD_Packages:SOIC-8-N" H 2400 1500 60  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2059962.pdf" H 2400 1500 60  0001 C CNN
F 4 "1561969" H 2400 1500 60  0001 C CNN "Farnell"
	1    2400 1500
	1    0    0    -1  
$EndComp
$Comp
L C C23
U 1 1 5956BF7A
P 9375 2050
F 0 "C23" H 9400 2150 50  0000 L CNN
F 1 "100n" H 9400 1950 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 9413 1900 50  0001 C CNN
F 3 "" H 9375 2050 50  0000 C CNN
F 4 "499687" H 9375 2050 60  0001 C CNN "Farnell"
	1    9375 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 1225 1825 1225
Wire Wire Line
	1825 1225 1825 1500
Wire Wire Line
	1825 1500 2000 1500
Text Notes 8325 1200 0    60   ~ 0
Low-pass has a cut-off freq. of approx. 1.6 Hz, ergo DC.
$Comp
L +3.3V #PWR043
U 1 1 595BE0DA
P 8150 1525
F 0 "#PWR043" H 8150 1375 50  0001 C CNN
F 1 "+3.3V" H 8150 1665 50  0000 C CNN
F 2 "" H 8150 1525 50  0001 C CNN
F 3 "" H 8150 1525 50  0001 C CNN
	1    8150 1525
	-1   0    0    -1  
$EndComp
$Comp
L Q_NMOS_GSD Q4
U 1 1 59557415
P 2275 6125
F 0 "Q4" H 2475 6175 50  0000 L CNN
F 1 "TSM2314" H 2475 6075 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2475 6225 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2044480.pdf" H 2275 6125 50  0001 C CNN
F 4 "1864589" H 2275 6125 60  0001 C CNN "Farnell"
	1    2275 6125
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_GSD Q8
U 1 1 59558B41
P 4125 6125
F 0 "Q8" H 4325 6175 50  0000 L CNN
F 1 "TSM2314" H 4325 6075 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4325 6225 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2044480.pdf" H 4125 6125 50  0001 C CNN
F 4 "1864589" H 4125 6125 60  0001 C CNN "Farnell"
	1    4125 6125
	-1   0    0    -1  
$EndComp
$Comp
L Q_NMOS_GSD Q6
U 1 1 5956294D
P 4125 4425
F 0 "Q6" H 4325 4475 50  0000 L CNN
F 1 "TSM2314" H 4325 4375 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4325 4525 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2044480.pdf" H 4125 4425 50  0001 C CNN
F 4 "1864589" H 4125 4425 60  0001 C CNN "Farnell"
	1    4125 4425
	-1   0    0    -1  
$EndComp
Text Notes 5550 3700 0    60   ~ 0
Investigate if AD8616 here can be replaced by the LM358 (most likely yes, footprints match). 
$EndSCHEMATC
