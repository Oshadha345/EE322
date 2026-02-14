# Debugging Methodology

## Principle

Debugging in embedded systems is evidence-driven. Do not infer behavior from intent; infer from observed electrical and binary facts.

## Workflow

1. Reproduce consistently.
2. Minimize test case.
3. Verify toolchain and build flags.
4. Inspect disassembly around failing path.
5. Add GPIO instrumentation for temporal visibility.
6. Validate register and memory assumptions.
7. Isolate hardware effects (power noise, wiring, load).
8. Confirm fix with regression test.

## Common Failure Classes

- Wrong clock assumptions (`F_CPU` mismatch).
- Timer prescaler misconfiguration.
- ISR too long, causing missed deadlines.
- Shared state race in main loop vs ISR.
- Stack overrun due to recursion/deep call chains.
- Incorrect DDR/PORT/PIN register sequencing.

## Debug Artifacts To Preserve

- Failing commit hash.
- Annotated scope traces.
- Disassembly snippet.
- Root cause and prevention note.

