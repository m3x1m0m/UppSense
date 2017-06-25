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
LIBS:silabs
LIBS:ft232rl
LIBS:ch340g
LIBS:backplane-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L USB_B P3
U 1 1 5948EBA5
P 7200 4300
F 0 "P3" H 7400 4100 50  0000 C CNN
F 1 "USB_B" H 7150 4500 50  0000 C CNN
F 2 "MyUSB:USB3145-30-1-A" V 7150 4200 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1841848.pdf" V 7150 4200 50  0001 C CNN
F 4 "2443141" H 7200 4300 60  0001 C CNN "Farnell"
	1    7200 4300
	-1   0    0    1   
$EndComp
Text GLabel 1850 2250 0    60   UnSpc ~ 0
5V
Text GLabel 1850 2350 0    60   UnSpc ~ 0
ADC1
Text GLabel 1850 2450 0    60   UnSpc ~ 0
ADC2
Text GLabel 2350 2350 2    60   UnSpc ~ 0
ADC3
Text GLabel 2350 2250 2    60   UnSpc ~ 0
GND
$Comp
L CONN_02X03 P1
U 1 1 594F86D2
P 2100 2350
F 0 "P1" H 2100 2550 50  0000 C CNN
F 1 "CONN_02X03" H 2100 2150 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03" H 2100 1150 50  0001 C CNN
F 3 "" H 2100 1150 50  0000 C CNN
	1    2100 2350
	1    0    0    -1  
$EndComp
Text GLabel 2350 2450 2    60   UnSpc ~ 0
ADC4
$Comp
L CH340G U1
U 1 1 594FA4BA
P 5150 4200
F 0 "U1" H 5150 3700 60  0000 C CNN
F 1 "CH340G" H 5150 4700 60  0000 C CNN
F 2 "SMD_Packages:SO-16-N" H 5350 3550 60  0001 C CNN
F 3 "http://cdn2.boxtec.ch/pub/diverse/ch340g-datasheet.pdf" H 5350 3550 60  0001 C CNN
	1    5150 4200
	1    0    0    -1  
$EndComp
Text GLabel 9050 2000 0    60   UnSpc ~ 0
5V
Text GLabel 9050 2100 0    60   UnSpc ~ 0
GND
Text GLabel 9050 2200 0    60   UnSpc ~ 0
I2C_SCL
Text GLabel 9050 2300 0    60   UnSpc ~ 0
I2C_SDA
Text GLabel 9050 2400 0    60   UnSpc ~ 0
UART_TX
Text GLabel 9050 2600 0    60   UnSpc ~ 0
DAC1
Text GLabel 9550 2600 2    60   UnSpc ~ 0
DAC2
Text GLabel 9550 2300 2    60   UnSpc ~ 0
GPIO3
Text GLabel 9550 2400 2    60   UnSpc ~ 0
GPIO4
Text GLabel 9050 2500 0    60   UnSpc ~ 0
UART_RX
Text GLabel 9550 2200 2    60   UnSpc ~ 0
GPIO2
Text GLabel 9550 2100 2    60   UnSpc ~ 0
GPIO1
Text GLabel 9550 2000 2    60   UnSpc ~ 0
GPIO0
Text GLabel 9550 2500 2    60   UnSpc ~ 0
nRST
$Comp
L CONN_02X07 P4
U 1 1 594FADC8
P 9300 2300
F 0 "P4" H 9300 2700 50  0000 C CNN
F 1 "CONN_02X07" V 9300 2300 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x07" H 9300 1100 50  0001 C CNN
F 3 "" H 9300 1100 50  0000 C CNN
	1    9300 2300
	1    0    0    -1  
$EndComp
Text GLabel 9050 3000 0    60   UnSpc ~ 0
5V
Text GLabel 9050 3100 0    60   UnSpc ~ 0
GND
Text GLabel 9050 3200 0    60   UnSpc ~ 0
I2C_SCL
Text GLabel 9050 3300 0    60   UnSpc ~ 0
I2C_SDA
Text GLabel 9050 3400 0    60   UnSpc ~ 0
UART_TX
Text GLabel 9050 3600 0    60   UnSpc ~ 0
DAC1
Text GLabel 9550 3600 2    60   UnSpc ~ 0
DAC2
Text GLabel 9550 3300 2    60   UnSpc ~ 0
GPIO3
Text GLabel 9550 3400 2    60   UnSpc ~ 0
GPIO4
Text GLabel 9050 3500 0    60   UnSpc ~ 0
UART_RX
Text GLabel 9550 3200 2    60   UnSpc ~ 0
GPIO2
Text GLabel 9550 3100 2    60   UnSpc ~ 0
GPIO1
Text GLabel 9550 3000 2    60   UnSpc ~ 0
GPIO0
Text GLabel 9550 3500 2    60   UnSpc ~ 0
nRST
$Comp
L CONN_02X07 P5
U 1 1 594FAEEA
P 9300 3300
F 0 "P5" H 9300 3700 50  0000 C CNN
F 1 "CONN_02X07" V 9300 3300 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x07" H 9300 2100 50  0001 C CNN
F 3 "" H 9300 2100 50  0000 C CNN
	1    9300 3300
	1    0    0    -1  
$EndComp
Text GLabel 1850 2900 0    60   UnSpc ~ 0
5V
Text GLabel 1850 3000 0    60   UnSpc ~ 0
ADC1
Text GLabel 1850 3100 0    60   UnSpc ~ 0
ADC2
Text GLabel 2350 3000 2    60   UnSpc ~ 0
ADC3
Text GLabel 2350 2900 2    60   UnSpc ~ 0
GND
$Comp
L CONN_02X03 P2
U 1 1 594FAFF9
P 2100 3000
F 0 "P2" H 2100 3200 50  0000 C CNN
F 1 "CONN_02X03" H 2100 2800 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03" H 2100 1800 50  0001 C CNN
F 3 "" H 2100 1800 50  0000 C CNN
	1    2100 3000
	1    0    0    -1  
$EndComp
Text GLabel 2350 3100 2    60   UnSpc ~ 0
ADC4
$EndSCHEMATC
