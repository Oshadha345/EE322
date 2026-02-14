# Embedded Systems From First Principles - ATmega328P Deep Dive

[![Platform](https://img.shields.io/badge/platform-ATmega328P%20(Arduino%20Uno)-00599C)](https://www.microchip.com/en-us/product/ATmega328P)
[![Toolchain](https://img.shields.io/badge/toolchain-avr--gcc%20%7C%20avrdude-1F6FEB)](#toolchain-setup)
[![Language](https://img.shields.io/badge/language-C%20and%20AVR%20Assembly-2EA44F)](#architecture-philosophy)
[![Discipline](https://img.shields.io/badge/focus-deterministic%20real--time-critical)](#embedded-systems-manifesto)

This repository is a long-horizon engineering notebook and implementation lab for mastering embedded systems through the ATmega328P at register and cycle level.

## Vision Statement

Build complete internal understanding of embedded systems by moving from architecture simulation to deterministic real hardware control, with explicit timing and safety constraints.

## Why This Repo Exists

Most beginner embedded repositories optimize for "it works."  
This one optimizes for "it is understood, measured, deterministic, and explainable."

## Architecture Philosophy

1. Determinism first, features second.
2. Registers before frameworks.
3. Measured timing before assumptions.
4. Explicit hardware-software boundary.
5. Safety gates for flashing and fuses.
6. Every abstraction earns its cost in cycles and complexity.

## Layered Learning Model

### Layer 0 - Foundations
- Python CPU emulator experiments.
- Instruction decode/execute modeling.
- Cycle simulation for small instruction subsets.

### Layer 1 - Register-Level Control
- Pure AVR assembly GPIO control.
- Blink and I/O tasks with no Arduino core.

### Layer 2 - Timing Mastery
- Timer modes (CTC, PWM, overflow).
- Interrupt-driven periodic tasks.
- Deterministic delay construction and validation.

### Layer 3 - Concurrency
- Cooperative scheduler.
- Bounded execution time per task.
- Shared data discipline and race prevention.

### Layer 4 - Real-Time Design
- Task set analysis.
- Interrupt latency budgeting.
- Deadline-driven instrumentation.

### Layer 5 - Capstone
- Deterministic embedded control system with measurable timing guarantees.

## Tech Stack Summary

- MCU: ATmega328P (Arduino Uno)
- Languages: AVR Assembly, C11, Python 3
- Build: GNU Make + avr-gcc toolchain
- Flash: avrdude
- Editor: VS Code

Detailed table: `docs/TECH_STACK.md`

## Repository Structure (Example Tree)

```text
.
|-- README.md
|-- Makefile
|-- docs/
|   |-- ROADMAP.md
|   |-- PROJECT_DESCRIPTION.md
|   |-- TECH_STACK.md
|   |-- PROFILE_SHORT_DESCRIPTION.md
|   |-- deep-dives/
|   |-- methodology/
|   `-- workflow/
|-- toolchain/
|   |-- make/
|   |   |-- avr-project.mk
|   |   `-- boards/atmega328p_uno.mk
|   `-- scripts/
|       |-- flash.sh
|       `-- flash.ps1
|-- foundations/
|   |-- python-cpu-emulators/
|   `-- instruction-cycle-sim/
|-- experiments/
|   |-- asm/
|   `-- timers/
|-- labs/
|   |-- README.md
|   |-- L0_foundations/
|   |-- L1_register-control/
|   |-- L2_timing-mastery/
|   |-- L3_concurrency/
|   `-- L4_real-time-design/
|-- mini-projects/
|   |-- README.md
|   |-- beginner/
|   |-- intermediate/
|   `-- advanced/
|-- benchmarks/
|   |-- cycle-counting/
|   |-- interrupt-latency/
|   `-- timer-precision/
|-- capstone/
`-- templates/minimal-avr-asm/
```

## Toolchain Setup

Primary environment:
- VS Code
- `avr-gcc` / `avr-libc` / `binutils-avr`
- `avrdude`
- `make`
- Logic analyzer or oscilloscope (recommended)

Sanity checks:

```bash
avr-gcc --version
avr-objdump --version
avrdude -?
make --version
```

## Flashing Workflow

Default path:
1. Build ELF/HEX with `make`.
2. Verify target and port.
3. Read and back up fuses.
4. Flash only program memory.
5. Re-verify behavior on hardware.

Example:

```bash
make LAB=labs/L1_register-control/lab-01-led-blink-asm build
make LAB=labs/L1_register-control/lab-01-led-blink-asm flash PORT=COM6
```

Scripted option:

```bash
./toolchain/scripts/flash.sh labs/L1_register-control/lab-01-led-blink-asm/build/lab01_led_blink_asm.hex COM6
```

Example script (excerpt):

```bash
avrdude -v -p atmega328p -c arduino -P COM6 -b 115200 -n
avrdude -v -p atmega328p -c arduino -P COM6 -b 115200 -U lfuse:r:-:h -U hfuse:r:-:h -U efuse:r:-:h
avrdude -v -p atmega328p -c arduino -P COM6 -b 115200 -D -U flash:w:build/app.hex:i
```

## Safe Fuse Handling

Rules used in this repo:
- Never write fuses in routine flash operations.
- Always read and back up current fuses before riskier operations.
- Treat fuse changes as reviewed design changes with rationale and rollback plan.

See: `docs/methodology/safe-flashing-checklist.md`

## Timing Analysis Methodology

Timing claims must include:
1. Clock source and `F_CPU`.
2. Instruction-level or ISR-level cycle estimate.
3. Measurement method (scope, logic analyzer, GPIO instrumentation).
4. Worst-case and nominal values.

See:
- `docs/methodology/timing-analysis.md`
- `benchmarks/cycle-counting/README.md`
- `benchmarks/interrupt-latency/README.md`
- `benchmarks/timer-precision/README.md`

## Labs System (By Topic)

Labs are organized by layer and topic:
- `L0_foundations`
- `L1_register-control`
- `L2_timing-mastery`
- `L3_concurrency`
- `L4_real-time-design`

Naming convention:
- `lab-XX-topic-goal`
- Example: `lab-02-timer0-ctc`

See: `labs/README.md` and `docs/workflow/lab-naming-conventions.md`

## Mini Projects Index (By Difficulty)

- Beginner: `mini-projects/beginner/mp-01-deterministic-led-engine`
- Intermediate: `mini-projects/intermediate/mp-02-motor-pwm-controller`
- Advanced: `mini-projects/advanced/mp-03-soft-real-time-task-executive`

See: `mini-projects/README.md`

## Capstone Plan

Target project: deterministic motor supervisor with:
- Timer-driven scheduler tick.
- Fault-state machine.
- Measured interrupt latency and jitter envelope.
- Reproducible timing report.

Execution phases:
1. Requirements and timing budget.
2. Driver integration and deterministic scheduler.
3. Fault handling and watchdog policy.
4. Measurement report and hardening.

See: `capstone/README.md`

## Hardware Used

- Arduino Uno (ATmega328P @ 16 MHz)
- Breadboard
- LEDs + resistors
- Small DC motors
- External power source for motors (recommended)
- Optional logic analyzer / oscilloscope

## Performance Benchmarking

Benchmark folders:
- `benchmarks/cycle-counting`
- `benchmarks/interrupt-latency`
- `benchmarks/timer-precision`

Each benchmark must log:
- Build hash
- Compiler flags
- Setup diagram
- Raw measurement and derived statistics

## Debugging Methodology

Method:
1. Reproduce and isolate.
2. Inspect disassembly and register effects.
3. Instrument with GPIO for timing visibility.
4. Validate on hardware with measurements.
5. Patch and re-measure before accepting fix.

See: `docs/methodology/debugging-methodology.md`

## Example Makefile Structure

Root dispatcher:

```make
LAB ?= labs/L1_register-control/lab-01-led-blink-asm

build:
	$(MAKE) -C $(LAB) build

flash:
	$(MAKE) -C $(LAB) flash
```

Per-lab Makefile includes shared AVR logic from `toolchain/make/avr-project.mk`.

## Example Minimal AVR Assembly Project Structure

```text
templates/minimal-avr-asm/
|-- Makefile
`-- src/main.S
```

## Suggested Commit Strategy

Conventional, traceable commits:
- `feat(lab-02): add timer0 ctc toggle path`
- `fix(flash): block unsafe fuse writes by default`
- `docs(timing): add interrupt latency measurement protocol`

See: `docs/workflow/commit-strategy.md`

## Suggested Branch Strategy

- `main`: always buildable, review-grade.
- `feature/<topic>`: focused implementation branches.
- `lab/<layer>-<name>`: optional branch namespace for larger labs.
- PRs required for fuse/toolchain changes.

See: `docs/workflow/branch-strategy.md`

## Suggested Badges

Useful additions for this repo:
- Build status (`GitHub Actions`)
- License badge
- Last commit
- Toolchain target badge (`avr-gcc`, `avrdude`)
- MCU platform badge (`ATmega328P`)

## Learning Roadmap Timeline

See full roadmap: `docs/ROADMAP.md`

Phase timeline:
1. Weeks 1-3: Layer 0 foundations
2. Weeks 4-6: Layer 1 register-level control
3. Weeks 7-10: Layer 2 timing mastery
4. Weeks 11-14: Layer 3 concurrency
5. Weeks 15-18: Layer 4 real-time design
6. Weeks 19-24: Layer 5 capstone

## Future Expansion Plan

1. RTOS migration experiments (FreeRTOS task model).
2. ARM Cortex-M port with CMSIS startup understanding.
3. PIC architecture comparative labs.
4. FPGA co-design for timing-critical peripherals.

## Embedded Systems Manifesto

1. Hardware truth beats software optimism.
2. If timing is unmeasured, timing is unknown.
3. Deterministic behavior is a design choice, not an accident.
4. Abstractions are tools, not hiding places.
5. Safety-critical habits start in student projects.
6. The stack, interrupts, and clocks are not "advanced topics"; they are fundamentals.

---

## GitHub Project Description (Long)

`Embedded Systems From First Principles` is a professional learning repository for mastering ATmega328P architecture, register-level firmware, cycle-accurate timing analysis, and deterministic real-time design using AVR C/assembly with VS Code, avr-gcc, and avrdude.

## GitHub Profile-Ready Short Description

ATmega328P deep-dive repo for deterministic embedded design: AVR C/assembly, cycle-level timing, safe flashing, and real-time systems from first principles.

Also available in:
- `docs/PROJECT_DESCRIPTION.md`
- `docs/PROFILE_SHORT_DESCRIPTION.md`
