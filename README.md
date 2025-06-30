
# 🚀 RISC-V ORFS IHP

This repository contains the **complete design flow scripts** and configurations for **synthesizing**, **placing & routing**, and **generating GDSII** for a custom **RISC-V core** using the **IHP SG13G2 PDK** with the **OpenROAD Flow**.

---

## 📌 Project Overview

This repository presents a **complete RTL-to-GDSII design flow** for a small **RISC-V processor**, implemented entirely with **open-source tools** and targeted for fabrication using the **IHP SG13G2 130nm BiCMOS PDK**.

---

### 🔑 Key Highlights

✅ **RTL Synthesis (Yosys)**  
The Register Transfer Level (RTL) description of the RISC-V processor is synthesized using **Yosys**, an open-source framework for RTL synthesis. Yosys translates the Verilog HDL code into a gate-level netlist compatible with the target standard cell library. Logic is optimized, unused gates are eliminated, and constraints for area and timing are applied.

✅ **Physical Design (OpenROAD)**  
The **OpenROAD toolchain** handles all stages of physical design:
- **Floorplanning:** Defines die/core area, blockages, and places power straps and IO pins.
- **Placement:** Arranges standard cells optimally to minimize wirelength and meet timing.
- **Clock Tree Synthesis (CTS):** Builds a balanced clock network with minimum skew.
- **Routing:** Connects all cells and IO pins with metal interconnects, ensuring DRC compliance.
- **Signoff:** Verifies DRC, runs LVS, and checks static timing analysis (STA).

Each step is automated with OpenROAD scripts, enabling a **fully open-source ASIC flow**.

✅ **Process Design Kit (IHP SG13G2)**  
The physical design is mapped to the **IHP SG13G2 PDK** — a 130nm BiCMOS node. This library provides standard cells, DRC rules, and tech files needed to tape out for fabrication.

---

### 🎯 Project Purpose

The goal is to provide an **open, reproducible reference** for:
- Designing **low-power embedded RISC-V cores** for IoT nodes, wearables, and small devices.
- Developing custom **microcontroller-class processors** for specific embedded applications.
- Practical **VLSI design training** for students, hobbyists, and researchers to learn ASIC design using **free, open-source EDA tools**.

By publishing this flow, we aim to **lower the barrier to custom chip design**, proving that RTL-to-GDSII is achievable **without costly commercial licenses**.

---

## 🗂️ Repository Structure

\`\`\`
risc_v_orfs_ihp/
├── flow/         # OpenROAD flow scripts and configuration files
├── src/          # RTL design files (PicoRV32 or custom core)
├── def2gds/      # DEF to GDSII conversion scripts (Magic / KLayout)
├── docs/         # Design reports: timing, area, power
├── results/      # Generated netlists, DEF, GDSII output
└── README.md     # Project documentation
\`\`\`

---

## 🚀 How to Run

1️⃣ **Clone this repository:**

\`\`\`bash
git clone https://github.com/KhalidHossain3108/risc_v_orfs_ihp.git
cd risc_v_orfs_ihp
\`\`\`

2️⃣ **Set up OpenROAD environment:**  
Make sure you have the **OpenROAD Flow Scripts** installed and configured properly. Source the environment:

\`\`\`bash
source env.sh
\`\`\`

3️⃣ **Run the flow:**

\`\`\`bash
./flow.tcl
\`\`\`

This will:
- Synthesize the RTL
- Run floorplanning, placement, CTS, routing
- Generate the final **DEF** and **GDSII** layout

---

## ✅ Features

- 📐 RTL-to-GDSII using **fully open-source tools**
- 🟢 **IHP SG13G2 PDK** support
- 📉 Includes timing, power, and area reports
- 📂 Reusable flow for other small cores or custom IP blocks

---

## 🧩 Applications

- IoT **sensor nodes**
- **Wearable smart devices**
- Edge AI **microcontrollers**
- **Education & training**
- Research **prototypes**

---

## 🛠️ Requirements

- Linux environment (**tested on Ubuntu**)
- [OpenROAD Flow Scripts](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts)
- Compatible version of **Magic** or **KLayout** for DEF-to-GDS conversion
- **IHP SG13G2 PDK** (under NDA or academic license)

---

## ⚠️ Disclaimer

**Note:** The **IHP SG13G2 PDK** is under license — please ensure you have **legal access**.  
This repository **does not include any proprietary PDK files**.

---

## 📃 License

This project is released under the **MIT License**.

---

## 👤 Author

**Khalid Hossain**  
[GitHub](https://github.com/KhalidHossain3108)

**Sheikh Tariful Islam**  
[GitHub](https://github.com/tariftasfiq)

**Contributions and pull requests are welcome!**

---

**🔗 Open VLSI. Open Silicon. Open Knowledge.**
