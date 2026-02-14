# Cycle Counting

## Objective

Produce cycle-accurate estimates for critical routines and validate against measured toggled GPIO intervals.

## Protocol

1. Disassemble target function/ISR.
2. Count cycle cost for each execution path.
3. Instrument start/end GPIO.
4. Compare expected vs measured pulse width.

