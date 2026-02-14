# Safe Flashing Checklist

Use this checklist before every hardware flash.

## Pre-Flash

1. Confirm board and MCU (`atmega328p` for Uno).
2. Confirm serial port and programmer config.
3. Confirm power path is stable (especially with motors attached).
4. Confirm the HEX belongs to the intended commit/tag.
5. Build with warnings treated as errors.

## Fuse Safety

1. Read and back up current fuse values.
2. Do not write fuses during normal iteration.
3. If fuse change is required, record:
   - Reason
   - Expected behavior change
   - Recovery plan
4. Require review for any fuse-writing command.

## Flash Execution

1. Probe target with avrdude no-write (`-n`) first.
2. Flash program memory only.
3. Verify signature and flash completion output.

## Post-Flash

1. Run smoke test on known GPIO signal.
2. Validate timer behavior against expected frequency.
3. Log result and anomalies in lab notes.

