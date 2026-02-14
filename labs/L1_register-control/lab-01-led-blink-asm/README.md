# Lab 01: LED Blink in Pure AVR Assembly

## Objective

Toggle onboard LED (PB5 on Uno) using direct register instructions in assembly.

## Registers Used

- `DDRB` for direction
- `PINB` for toggle

## Build

```bash
make -C labs/L1_register-control/lab-01-led-blink-asm build
```

## Flash

```bash
make -C labs/L1_register-control/lab-01-led-blink-asm flash PORT=COM6
```

## Timing Notes

- Delay routine is software-loop based and only a baseline reference.
- Later labs replace this with timer-driven deterministic scheduling.

