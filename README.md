# Aim

* make my first PCB with FPGA
* keep it super simple and cheap
* program FLASH or direct with a Raspberry Pi

![board](hardware/board.png)

[schematic](hardware/schematic.pdf)

[OHSPark project](https://oshpark.com/shared_projects/KnMD4ql8) or [Gerbers](hardware/first-fpga-pcb-2020-01-01-fab.zip)

# BOM

* FPGA iCE40-HX4K-TQ144 (8k accessible with Icestorm tools)
* 3.3v reg TLV73333PDBVT
* 1.2v reg TLV73312PDBVT
* 12MHz oscillator SIT2001BI-S2-33E-12.000000G
* 16MB FLASH IS25LP016D-JBLE

# Test

See the [test program](led_test/top.v). This flashes LED2, and LED1 is connected to SW1.

    make prog

Yosys and NextPNR are used to create the bitstream and then it's copied to the Raspberry Pi specified
by PI_ADDR in the [Makefile](led_test/Makefile). 

[Fomu-Flash](https://github.com/mattvenn/fomu-flash) is used for programming. Fomu-Flash should be able
to reconfigure the pins used with -g, but I couldn't get this to work, so I hard-coded the right pins in my
fork.

# Inspiration

* https://github.com/OLIMEX/iCE40HX1K-EVB/blob/master/iCE40HX1K-EVB_Rev_B.pdf
* https://github.com/icebreaker-fpga/icebreaker/blob/master/hardware/v1.0e/icebreaker-sch.pdf
* icestick

# Reference

* Family datasheet: http://www.latticesemi.com/view_document?document_id=49312
* Programming/FLASH spec: http://www.latticesemi.com/view_document?document_id=46502
* Pinout: http://www.latticesemi.com/view_document?document_id=49383
