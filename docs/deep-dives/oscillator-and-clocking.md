# Deep Dive: Oscillator and Clocking

## Scope

- Clock sources on ATmega328P.
- Relationship between `F_CPU`, timer tick, and instruction timing.
- Clock tolerance and timing error propagation.

## Study Outcomes

1. Explain how clock selection impacts deterministic behavior.
2. Derive timer period from prescaler + compare values.
3. Quantify expected timing drift from oscillator tolerance.

