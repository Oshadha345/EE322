# Timing Analysis Methodology

Timing claims must be reproducible and bounded.

## 1. Define Timing Contract

- What must happen?
- Under what deadline?
- Under what load/worst-case path?

## 2. Static Cycle Estimate

1. Inspect generated disassembly (`avr-objdump -d -S`).
2. Count cycles on hot paths and ISR body.
3. Include branch/taken/not-taken cycle differences.
4. Include prologue/epilogue for interrupts.

## 3. Hardware Instrumentation

1. Toggle a GPIO at code boundaries.
2. Capture pulse width/period with analyzer or scope.
3. Measure:
   - Average
   - Max
   - Min
   - Jitter

## 4. Compare Estimate vs Measurement

- Explain delta sources:
  - Compiler optimization effects
  - Interrupt nesting/preemption
  - Clock tolerance

## 5. Document Results

Each timing report should include:
- Commit hash
- `F_CPU` and timer prescaler values
- Build flags
- Measurement setup
- Raw numbers and interpretation

