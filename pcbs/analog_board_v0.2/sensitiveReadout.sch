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
Sheet 2 4
Title "High Current Part of Analog Board"
Date "2017-06-14"
Rev "v0.2"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L GND #PWR018
U 1 1 5940C813
P 5225 5250
F 0 "#PWR018" H 5225 5000 50  0001 C CNN
F 1 "GND" H 5225 5100 50  0000 C CNN
F 2 "" H 5225 5250 50  0000 C CNN
F 3 "" H 5225 5250 50  0000 C CNN
	1    5225 5250
	1    0    0    -1  
$EndComp
$Comp
L AD8616 U2
U 1 1 5940C81A
P 5225 4300
F 0 "U2" H 4604 4004 50  0000 L CNN
F 1 "AD8616" H 5525 4000 50  0000 L CNN
F 2 "SMD_Packages:SOIC-8-N" H 5028 4350 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1841629.pdf" H 4928 4450 50  0001 C CNN
F 4 "AD8616ARZ" H 5225 4300 60  0001 C CNN "Farnell"
	1    5225 4300
	1    0    0    -1  
$EndComp
$Comp
L D_Photo D3
U 1 1 5940C87D
P 6875 4875
F 0 "D3" H 6895 4945 50  0000 L CNN
F 1 "BPW34" H 6835 4765 50  0000 C CNN
F 2 "Photodiodes:BPW34FA" H 6825 4875 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2046123.pdf" H 6825 4875 50  0001 C CNN
F 4 "1045425" H 6875 4875 60  0001 C CNN "Farnell"
	1    6875 4875
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR019
U 1 1 5940C884
P 6875 5250
F 0 "#PWR019" H 6875 5000 50  0001 C CNN
F 1 "GND" H 6875 5100 50  0000 C CNN
F 2 "" H 6875 5250 50  0000 C CNN
F 3 "" H 6875 5250 50  0000 C CNN
	1    6875 5250
	-1   0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 5940CEAF
P 7500 3600
F 0 "R12" V 7580 3600 50  0000 C CNN
F 1 "10M" V 7500 3600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 7430 3600 50  0001 C CNN
F 3 "" H 7500 3600 50  0000 C CNN
F 4 "9238115" V 7500 3600 60  0001 C CNN "Farnell"
	1    7500 3600
	0    -1   -1   0   
$EndComp
$Comp
L R R8
U 1 1 5940D158
P 6300 3600
F 0 "R8" V 6380 3600 50  0000 C CNN
F 1 "100k" V 6300 3600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 6230 3600 50  0001 C CNN
F 3 "" H 6300 3600 50  0000 C CNN
F 4 "2447551" V 6300 3600 60  0001 C CNN "Farnell"
	1    6300 3600
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR020
U 1 1 5940F526
P 6975 2125
F 0 "#PWR020" H 6975 1875 50  0001 C CNN
F 1 "GND" H 6975 1975 50  0000 C CNN
F 2 "" H 6975 2125 50  0000 C CNN
F 3 "" H 6975 2125 50  0000 C CNN
	1    6975 2125
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P7
U 1 1 5940F5BC
P 6875 2825
F 0 "P7" H 6875 3025 50  0000 C CNN
F 1 "CONN_01X03" V 6975 2825 50  0000 C CNN
F 2 "Samtec Connectors:Samtec-PHT-1-3-01-L-S" H 6875 2825 50  0001 C CNN
F 3 "" H 6875 2825 50  0000 C CNN
	1    6875 2825
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X03 P6
U 1 1 5940F760
P 6875 2525
F 0 "P6" H 6875 2725 50  0000 C CNN
F 1 "CONN_01X03" V 6975 2525 50  0000 C CNN
F 2 "Samtec Connectors:Samtec-PHT-1-3-01-L-S" H 6875 2525 50  0001 C CNN
F 3 "" H 6875 2525 50  0000 C CNN
	1    6875 2525
	0    -1   1    0   
$EndComp
$Comp
L R R10
U 1 1 5940F9FA
P 6875 3275
F 0 "R10" V 6955 3275 50  0000 C CNN
F 1 "1K" V 6875 3275 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 6805 3275 50  0001 C CNN
F 3 "" H 6875 3275 50  0000 C CNN
F 4 "9237496" V 6875 3275 60  0001 C CNN "Farnell"
	1    6875 3275
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 5940FA2A
P 6675 3275
F 0 "R9" V 6755 3275 50  0000 C CNN
F 1 "10k" V 6675 3275 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 6605 3275 50  0001 C CNN
F 3 "" H 6675 3275 50  0000 C CNN
F 4 "9237755" V 6675 3275 60  0001 C CNN "Farnell"
	1    6675 3275
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 5940FA82
P 7075 3275
F 0 "R11" V 7155 3275 50  0000 C CNN
F 1 "0.1k" V 7075 3275 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 7005 3275 50  0001 C CNN
F 3 "" H 7075 3275 50  0001 C CNN
F 4 "2504961" V 7075 3275 60  0001 C CNN "Farnell"
	1    7075 3275
	1    0    0    -1  
$EndComp
Wire Wire Line
	5225 4850 5225 5250
Wire Wire Line
	6875 4975 6875 5250
Wire Wire Line
	6450 3600 7350 3600
Wire Wire Line
	6975 2125 6975 2325
Wire Wire Line
	6775 2225 6975 2225
Wire Wire Line
	6775 2225 6775 2325
Connection ~ 6975 2225
Wire Wire Line
	6875 2325 6875 2225
Connection ~ 6875 2225
Wire Wire Line
	6675 3425 6675 3600
Connection ~ 6675 3600
Wire Wire Line
	6875 3425 6875 3600
Connection ~ 6875 3600
Wire Wire Line
	7075 3425 7075 3600
Connection ~ 7075 3600
Wire Wire Line
	6675 3125 6675 3025
Wire Wire Line
	6675 3025 6775 3025
Wire Wire Line
	6875 3125 6875 3025
Wire Wire Line
	6975 3025 7075 3025
Wire Wire Line
	7075 3025 7075 3125
Wire Wire Line
	7650 4200 5975 4200
$Comp
L GND #PWR021
U 1 1 59410288
P 6325 5250
F 0 "#PWR021" H 6325 5000 50  0001 C CNN
F 1 "GND" H 6325 5100 50  0000 C CNN
F 2 "" H 6325 5250 50  0000 C CNN
F 3 "" H 6325 5250 50  0000 C CNN
	1    6325 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5975 4400 6325 4400
Wire Wire Line
	6325 4400 6325 5250
$Comp
L +5V #PWR022
U 1 1 59411770
P 5225 3750
F 0 "#PWR022" H 5225 3600 50  0001 C CNN
F 1 "+5V" H 5225 3890 50  0000 C CNN
F 2 "" H 5225 3750 50  0000 C CNN
F 3 "" H 5225 3750 50  0000 C CNN
	1    5225 3750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR023
U 1 1 5941B3CF
P 1675 1725
F 0 "#PWR023" H 1675 1575 50  0001 C CNN
F 1 "+5V" H 1675 1865 50  0000 C CNN
F 2 "" H 1675 1725 50  0000 C CNN
F 3 "" H 1675 1725 50  0000 C CNN
	1    1675 1725
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 5941B3D6
P 1950 1925
F 0 "C7" H 1975 2025 50  0000 L CNN
F 1 "1u" H 1975 1825 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 1988 1775 50  0001 C CNN
F 3 "" H 1950 1925 50  0000 C CNN
F 4 "2496946" H 1950 1925 60  0001 C CNN "Farnell"
	1    1950 1925
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 5941B3DE
P 2200 1925
F 0 "C8" H 2225 2025 50  0000 L CNN
F 1 "100n" H 2225 1825 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 2238 1775 50  0001 C CNN
F 3 "" H 2200 1925 50  0000 C CNN
F 4 "499687" H 2200 1925 60  0001 C CNN "Farnell"
	1    2200 1925
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 5941B3E6
P 2450 1925
F 0 "C9" H 2475 2025 50  0000 L CNN
F 1 "10n" H 2475 1825 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 2488 1775 50  0001 C CNN
F 3 "" H 2450 1925 50  0000 C CNN
F 4 "1414662" H 2450 1925 60  0001 C CNN "Farnell"
	1    2450 1925
	1    0    0    -1  
$EndComp
Wire Wire Line
	1675 1725 1675 1775
Wire Wire Line
	1675 1775 2450 1775
Connection ~ 1950 1775
Connection ~ 2200 1775
$Comp
L GND #PWR024
U 1 1 5941B3F1
P 1950 2150
F 0 "#PWR024" H 1950 1900 50  0001 C CNN
F 1 "GND" H 1950 2000 50  0000 C CNN
F 2 "" H 1950 2150 50  0000 C CNN
F 3 "" H 1950 2150 50  0000 C CNN
	1    1950 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 2075 1950 2150
Wire Wire Line
	1950 2075 2450 2075
Connection ~ 2200 2075
Text Notes 1650 2450 0    60   ~ 0
Place decoupling capacitors close to component!
Wire Wire Line
	6875 4675 6875 4200
Connection ~ 6875 4200
Wire Wire Line
	4100 3600 6150 3600
Wire Wire Line
	5975 4000 6725 4000
$Comp
L C C10
U 1 1 59421E44
P 6875 4000
F 0 "C10" H 6900 4100 50  0000 L CNN
F 1 "1p" H 6900 3900 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6913 3850 50  0001 C CNN
F 3 "" H 6875 4000 50  0000 C CNN
F 4 "1759179" H 6875 4000 60  0001 C CNN "Farnell"
	1    6875 4000
	0    1    -1   0   
$EndComp
Wire Wire Line
	6075 3150 6075 4000
Connection ~ 6075 4000
Wire Wire Line
	7025 4000 7650 4000
Wire Wire Line
	7650 3600 7650 4200
Connection ~ 7650 4000
Text HLabel 5725 3150 0    60   Output ~ 0
BPW34FA_OUT
Wire Wire Line
	6075 3150 5725 3150
Connection ~ 6075 3600
Wire Wire Line
	4425 4000 4425 4200
Wire Wire Line
	4100 3600 4100 4400
Wire Wire Line
	4100 4400 4425 4400
$EndSCHEMATC
