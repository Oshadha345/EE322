# Benchmarking Methodology

## Core Metrics

1. Cycle count (critical path).
2. Interrupt latency (best/worst-case).
3. Timer precision and jitter.
4. CPU utilization estimate for scheduler-driven designs.

## Benchmark Rules

1. One independent variable per benchmark.
2. Keep toolchain version fixed during a benchmark run.
3. Record environmental factors (clock source, supply conditions).
4. Include both calculation and measurement.

## Reporting Template

```text
Benchmark:
Commit:
MCU / F_CPU:
Build Flags:
Setup:
Method:
Result (avg/min/max):
Interpretation:
Follow-up action:
```

