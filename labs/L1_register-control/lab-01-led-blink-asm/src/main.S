#include <avr/io.h>

.global main

main:
    ; Configure PB5 (Arduino Uno onboard LED pin) as output.
    ; sbi DDRB, DDB5  <-- This was out of range
    ldi r16, (1 << DDB5)
    out _SFR_IO_ADDR(DDRB), r16

loop:
    ; Toggle PB5 by writing 1 to PINB5.
    ; sbi PINB, PINB5 <-- This was out of range
    ldi r16, (1 << PINB5)
    out _SFR_IO_ADDR(PINB), r16
    
    rcall delay_approx_250ms
    rjmp loop

; Approximate delay loop for initial bring-up.
; Timer-based deterministic delay is introduced in Layer 2 labs.
delay_approx_250ms:
    ldi r18, 0x20
outer_loop:
    ldi r19, 0xFF
middle_loop:
    ldi r20, 0xFF
inner_loop:
    dec r20
    brne inner_loop
    dec r19
    brne middle_loop
    dec r18
    brne outer_loop
    ret

