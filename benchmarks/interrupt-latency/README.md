# Interrupt Latency

## Objective

Measure interrupt entry latency and ISR response variability across workload conditions.

## Protocol

1. Trigger known interrupt source.
2. Toggle GPIO at ISR entry/exit.
3. Capture with analyzer.
4. Report min/avg/max latency and jitter.

