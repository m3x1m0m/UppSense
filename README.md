![UppSense](http://uppsense.eu/wp-content/uploads/2017/07/cropped-logo-final-version.png)

UppSense17- Open Source sensor for chemical analysis based on fuoresence.
 
## Hardware
![Hardware Block Diagram](http://uppsense.eu/github_pics/block_smaller.png)

The hardware consists out of three PCBs so far: An analog PCB, a digital PCB and an active Backplane. Two PCBs are developed with KiCAD. One is developed with Altium.

A transimpedance amplifier is used to convert light into a voltage. With a
second stage this voltage is amplified. Both outputs are available for the ADC. 

On the digital board there is besides an ESP8266, an ADC, an DAC and a temperature
sensor. The DAC is needed to steer the LED driver circuit, that excites the
sample. 
 
## Software
The software is written in C++ leveraging the [Sming](https://github.com/SmingHub/Sming) framework.

## Web & Contact
Website: www.uppsense.eu | Email: contact@uppsense.eu
