# Default activity (override with: make Activity=path/to/folder)
Activity ?= labs/L1_register-control/lab-01-led-blink-asm

# Include board configuration
include toolchain/make/boards/atmega328p_uno.mk

# Include shared AVR rules
include toolchain/make/avr-project.mk