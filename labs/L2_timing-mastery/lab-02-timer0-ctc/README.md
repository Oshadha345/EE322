# Lab 02: Timer0 CTC Periodic Interrupt

## Objective

Replace software delay loops with Timer0 CTC interrupts for periodic deterministic events.

## Focus

- Configure `TCCR0A`, `TCCR0B`, `OCR0A`, `TIMSK0`.
- ISR cycle budget.
- Jitter measurement via GPIO instrumentation.

## Exit Criteria

- Stable periodic tick within defined tolerance.
- Documented ISR latency and maximum jitter.

