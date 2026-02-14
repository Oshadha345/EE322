#include <avr/io.h>

.global main

main:
    sbi DDRB, DDB5
loop:
    sbi PINB, PINB5
    rjmp loop

