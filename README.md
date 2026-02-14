# 🛠️ ATmega328P Deep Dive: Embedded From First Principles

[![MCU](https://img.shields.io/badge/MCU-ATmega328P-00599C?style=for-the-badge&logo=microchip)](https://www.microchip.com/en-us/product/ATmega328P)
[![Toolchain](https://img.shields.io/badge/Toolchain-avr--libc-1F6FEB?style=for-the-badge&logo=gnubash)](#-workflow)
[![Language](https://img.shields.io/badge/Lang-C%20%7C%20ASM-2EA44F?style=for-the-badge)](#-architecture)

> **Deterministic, register-level mastery of embedded systems.** No frameworks, just cycles and silicon. ⚡

---

### 🎯 The Mission
Moving from architecture simulation to hard-real-time hardware control. This repository optimizes for **measured, deterministic, and explainable** firmware.

### 📈 Learning Roadmap (Checklist)
- [ ] **L0: Foundations** | Python CPU Emulators & Cycle simulation
- [ ] **L1: Register-Control** | Pure AVR Assembly & GPIO (No Arduino core)
- [ ] **L2: Timing Mastery** | CTC, PWM, & Periodic Interrupts
- [ ] **L3: Concurrency** | Cooperative Schedulers & Race Prevention
- [ ] **L4: Real-Time Design** | Interrupt Latency Budgeting & Jitter Analysis
- [ ] **L5: Capstone** | Deterministic Motor Supervisor

### 🛠️ Tech Stack
- **Languages:** `AVR Assembly`, `C11`, `Python 3`
- **Build:** `avr-gcc`, `avrdude`, `GNU Make`
- **Hardware:** ATmega328P (Uno), Breadboard, Logic Analyzer 🔬

### 🏗️ Repo Structure
```text
.
├── 📂 docs/          # [Specs & Methodology](docs/)
├── 📂 toolchain/     # [Makefiles & Scripts](toolchain/)
├── 📂 labs/          # [Layered Experiments](labs/)
├── 📂 mini-projects/ # [Integrated Builds](mini-projects/)
└── 📂 benchmarks/    # [Timing Data](benchmarks/)
```

### 🚀 Quick Workflow
```bash
# Build & Flash a Lab
make LAB=labs/L1_register-control/lab-01-led-blink-asm build
make LAB=labs/L1_register-control/lab-01-led-blink-asm flash PORT=/dev/ttyACM0
```

| Resource | Link |
| :--- | :--- |
| **Flashing & Fuses** | [Safety Checklist](docs/methodology/safe-flashing-checklist.md) |
| **Timing Analysis** | [Measurement Protocol](docs/methodology/timing-analysis.md) |
| **Workflow** | [Commit](docs/workflow/commit-strategy.md) & [Branching](docs/workflow/branch-strategy.md) |
| **Roadmap** | [Full Timeline](docs/ROADMAP.md) |

### 📜 Embedded Manifesto
1. Hardware truth beats software optimism.
2. If timing is unmeasured, it is unknown.
3. Deterministic behavior is a design choice, not an accident.
4. Abstractions are tools, not hiding places.

---


![Built with AVR](https://img.shields.io/badge/Built%20with-AVR%20Bare--Metal-6f42c1?style=for-the-badge&logo=microchip&logoColor=white)
![Deterministic Timing](https://img.shields.io/badge/Timing-Deterministic-1f883d?style=for-the-badge&logo=speedtest&logoColor=white)
![No Arduino Core](https://img.shields.io/badge/Arduino%20Core-Disabled-d1242f?style=for-the-badge&logo=arduino&logoColor=white)
![Repo Level](https://img.shields.io/badge/Repo%20Mode-⚙️%20Register%20Wizard-0969da?style=for-the-badge)

`🧠 ATmega328P deep-dive for deterministic design.` | `© 2026 EEE322 Embedded Systems 🛡️`

`🏛️ Department of Electrical and Computer Engineering, University of Peradeniya`

`👨‍💻 Author: Oshadha Samarakoon` | `📧 e21345@eng.pdn.ac.lk` | `🐙 GitHub: @Oshadha345`