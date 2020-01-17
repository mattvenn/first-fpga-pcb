PACKAGE = tq144:4k
DEVICE = hx8k
PIN_DEF = 8k.pcf
SHELL := /bin/bash # Use bash syntax
SEED = 10
PROJECT = led_sw
PI_ADDR = pi@fpga.local
FOMU_FLASH = ~/fomu-flash/fomu-flash

all: $(PROJECT).bin

BUILD_DIR = ./
SOURCES = top.v pll.v pwm.v bram.v

# $@ The file name of the target of the rule.rule
# $< first pre requisite
# $^ names of all preerquisites

# rules for building the json
%.json: $(SOURCES) gamma.hex
	yosys -l yosys.log -p 'synth_ice40 -top top -json $(PROJECT).json' $(SOURCES)

%.asc: %.json $(ICEBREAKER_PIN_DEF) 
	nextpnr-ice40 -l nextpnr.log --seed $(SEED) --freq 20 --package $(PACKAGE) --$(DEVICE) --asc $@ --pcf $(PIN_DEF) --json $<

# bin, for programming
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.asc
	icepack $< $@

prog-fpga: $(BUILD_DIR)/$(PROJECT).bin
	scp $< $(PI_ADDR):/tmp/$(PROJECT).bin
	ssh $(PI_ADDR) "sudo $(FOMU_FLASH) -f /tmp/$(PROJECT).bin"

prog-flash: $(BUILD_DIR)/$(PROJECT).bin
	scp $< $(PI_ADDR):/tmp/$(PROJECT).bin
	ssh $(PI_ADDR) "sudo $(FOMU_FLASH) -w /tmp/$(PROJECT).bin; sudo $(FOMU_FLASH) -r"

debug: gamma.hex
	iverilog -o test.out top.v top_tb.v pwm.v bram.v -DDEBUG
	vvp test.out -fst
	gtkwave test.vcd test.gtkw

gamma.hex:
	python3 gamma.py   

clean:
	rm -f ${PROJECT}.json ${PROJECT}.asc ${PROJECT}.bin *log

#secondary needed or make will remove useful intermediate files
.SECONDARY:
.PHONY: all prog-flash prog-fpga clean
