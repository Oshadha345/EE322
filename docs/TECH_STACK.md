# Tech Stack Summary

| Area | Stack |
|---|---|
| Target MCU | ATmega328P (Arduino Uno) |
| Languages | AVR Assembly, C11, Python 3 |
| Build | GNU Make |
| Compiler | avr-gcc |
| Binary utilities | avr-objcopy, avr-objdump, avr-size |
| Flashing | avrdude |
| Editor | VS Code |
| Measurement | Logic analyzer / oscilloscope (recommended) |
| Version Control | Git + GitHub |

## Philosophy for Tool Choices

- Keep tools transparent and scriptable.
- Prefer CLI tooling over opaque IDE workflows.
- Keep every build and flash action reproducible from shell.

