# Aim

* make my first PCB with FPGA
* keep it super simple and cheap
* program FLASH or direct with a Raspberry Pi

# BOM

* FPGA iCE40-HX1K-VQ100
* 3.3v reg TLV73333PDBVT
* 1.2v reg TLV73312PDBVT
* 12MHz oscillator SIT2001BI-S2-33E-12.000000G
* 16MB FLASH

# Questions

* clock and reset gbin, will PLL be ok? Have been confused with not being able to use some pins as clock pins before
* flash - pullups needed? From datasheet think only CS is needed to put into flash config mode
    * icestick pull ups on sck and ss
    * icebreaker pullups on all
    * olimex pullups on ss. sdi & sdo joined with 22r
* why no VCC and gnd PLL on the v100 package? Is it missing PLL?
* sequencing PSU necessary? Seen a note on the icebreaker board but nothing on Olimex
* any 8 pin SPI FLASH part ok? Or need something specific - where are the docs on this?

# Todo

* double check FPGA pinout against lattice docs 
* pick FLASH mem part

# Inspiration

* https://github.com/OLIMEX/iCE40HX1K-EVB/blob/master/iCE40HX1K-EVB_Rev_B.pdf
* https://github.com/icebreaker-fpga/icebreaker/blob/master/hardware/v1.0e/icebreaker-sch.pdf
* icestick
