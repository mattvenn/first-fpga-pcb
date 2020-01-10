PACKAGE = tq144:4k
DEVICE = hx8k
PIN_DEF = 8k.pcf
SHELL := /bin/bash # Use bash syntax
SEED = 10
PROJECT = led_sw
PI_ADDR = pi@fpga.local
FOMU_FLASH = ~/fomu-flash/fomu-flash

all: $(PROJECT).bin $(PROJECT).rpt 

BUILD_DIR = ./
SOURCES = top.v

# $@ The file name of the target of the rule.rule
# $< first pre requisite
# $^ names of all preerquisites

# rules for building the json
%.json: $(SOURCES)
	yosys -l yosys.log -p 'synth_ice40 -top top -json $(PROJECT).json' $(SOURCES)

%.asc: %.json $(ICEBREAKER_PIN_DEF) 
	nextpnr-ice40 -l nextpnr.log --seed $(SEED) --freq 20 --package $(PACKAGE) --$(DEVICE) --asc $@ --pcf $(PIN_DEF) --json $<

# bin, for programming
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.asc
	icepack $< $@

prog: $(BUILD_DIR)/$(PROJECT).bin
	scp $< $(PI_ADDR):/tmp/$(PROJECT).bin
	# -f writes to fpga directly, -w to the flash, and then needs a -r to reset it 
	ssh $(PI_ADDR) "sudo $(FOMU_FLASH) -f /tmp/$(PROJECT).bin"

clean:
	rm -f ${PROJECT}.json ${PROJECT}.asc ${PROJECT}.bin *log

#secondary needed or make will remove useful intermediate files
.SECONDARY:
.PHONY: all prog clean
