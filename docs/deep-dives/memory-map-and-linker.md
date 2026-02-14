# Deep Dive: Memory Map and Linker Behavior

## Scope

- Flash, SRAM, EEPROM boundaries.
- Section placement (`.text`, `.data`, `.bss`).
- Startup initialization cost and implications.

## Study Outcomes

1. Read map/disassembly files to locate data and code.
2. Explain `.data` copy and `.bss` zeroing on startup.
3. Optimize memory layout for predictable behavior.

