# Deep Dive: Interrupts and Latency

## Scope

- Interrupt entry/exit sequence.
- Latency contributors (current instruction, global interrupt state, ISR length).
- Jitter causes and mitigation.

## Study Outcomes

1. Compute baseline interrupt latency in cycles.
2. Measure real latency and compare to estimate.
3. Define ISR design rules for deterministic systems.

