# ==============================
# ATmega328P - Arduino Uno Config
# ==============================

MCU = atmega328p
F_CPU = 16000000UL

PROGRAMMER = arduino
PORT ?= COM28
BAUD = 115200

AVRDUDE = avrdude
CC = avr-gcc
OBJCOPY = avr-objcopy
OBJDUMP = avr-objdump
SIZE = avr-size
