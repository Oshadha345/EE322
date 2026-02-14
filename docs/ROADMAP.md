# Learning Roadmap

This roadmap is built around layered competency growth, not feature accumulation.

## Phase 1 (Weeks 1-3): Foundations

Goals:
- Build a toy CPU model in Python (register file, PC, flags, memory).
- Simulate instruction execution and cycle cost.
- Document instruction-level timing assumptions.

Deliverables:
- `foundations/python-cpu-emulators/` - Done
- `foundations/instruction-cycle-sim/`
- Lab report: cycle simulation vs expected AVR behavior.

## Phase 2 (Weeks 4-6): Register-Level Control

Goals:
- Configure GPIO by direct register writes.
- Implement LED blink in pure AVR assembly.
- Understand reset vector and startup flow.

Deliverables:
- `labs/L1_register-control/lab-01-led-blink-asm/`
- Disassembly and cycle reasoning notes.

## Phase 3 (Weeks 7-10): Timing Mastery

Goals:
- Configure timer modes (CTC, overflow, PWM).
- Replace software delays with timer-driven behavior.
- Measure jitter and timer precision.

Deliverables:
- `labs/L2_timing-mastery/lab-02-timer0-ctc/`
- `benchmarks/timer-precision/`

## Phase 4 (Weeks 11-14): Concurrency

Goals:
- Implement cooperative scheduler.
- Define task contracts and bounded runtimes.
- Track deadline misses and root causes.

Deliverables:
- `labs/L3_concurrency/lab-03-coop-scheduler/`
- Scheduler timing benchmark notes.

## Phase 5 (Weeks 15-18): Real-Time Design

Goals:
- Perform rate-monotonic style task analysis.
- Estimate and measure interrupt latency.
- Create task set with explicit timing budget.

Deliverables:
- `labs/L4_real-time-design/lab-04-rate-monotonic-analysis/`
- `benchmarks/interrupt-latency/`

## Phase 6 (Weeks 19-24): Capstone

Goals:
- Build deterministic embedded application end-to-end.
- Enforce safety procedures for flashing.
- Produce final timing dossier (cycles, latency, jitter).

Deliverables:
- `capstone/deterministic-motor-supervisor/`
- Final report with reproducible measurements.

## Future Expansion (Post-ATmega328P)

1. RTOS introduction (FreeRTOS on AVR or Cortex-M).
2. ARM Cortex-M bare-metal migration.
3. PIC architecture comparison labs.
4. FPGA/HDL co-design for hardware acceleration.

