# Minimal AVR Assembly Template

Use this template to bootstrap new low-level experiments.

## Structure

```text
minimal-avr-asm/
|-- Makefile
`-- src/main.S
```

## Build

```bash
make -C templates/minimal-avr-asm build
```

## Flash

```bash
make -C templates/minimal-avr-asm flash PORT=COM6
```

