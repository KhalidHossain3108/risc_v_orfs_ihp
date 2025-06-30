# RISC-V ORFS IHP

This repository contains the complete design flow scripts and configurations for synthesizing, placing & routing, and generating GDSII for a **custom RISC-V core** using the **IHP SG13G2** PDK with the **OpenROAD Flow**.

## 📌 Project Overview

This project demonstrates a full RTL-to-GDS design flow for a small RISC-V processor:
- Synthesized with **OpenROAD's Yosys**
- Floorplanned, placed, and routed using **OpenROAD tools**
- Targeted for fabrication with the **IHP SG13G2** 130nm BiCMOS PDK

The goal is to provide an open, reproducible reference for:
- Low-power IoT and sensor node SoCs
- Custom embedded controllers for consumer electronics
- VLSI design training for students and researchers

## 🗂️ Repository Structure

```
risc_v_orfs_ihp/
├── flow/                 # OpenROAD flow scripts and configuration files
├── src/                  # RTL design files (PicoRV32 or custom core)
├── def2gds/              # DEF to GDSII conversion scripts (Magic / KLayout)
├── docs/                 # Design reports, timing, area, power
├── results/              # Generated netlists, DEF, GDSII output
└── README.md             # Project documentation
```

## 🚀 How to Run

1️⃣ **Clone this repository:**

```bash
git clone https://github.com/KhalidHossain3108/risc_v_orfs_ihp.git
cd risc_v_orfs_ihp
```

2️⃣ **Set up OpenROAD environment:**  
Make sure you have the OpenROAD Flow Scripts installed and configured properly. Source the environment:

```bash
source env.sh
```

3️⃣ **Run the flow:**

```bash
./flow.tcl
```

This will:
- Synthesize the RTL
- Run floorplanning, placement, CTS, routing
- Generate the final DEF and GDSII layout

## ✅ Features

- 📐 RTL to GDSII using fully open-source tools
- 🟢 IHP SG13G2 PDK support
- 📉 Timing, power, and area reports included
- 📂 Reusable flow for other small cores and IP blocks

## 🧩 Applications

- IoT sensor nodes
- Wearable smart devices
- Edge AI microcontrollers
- Education & training
- Research prototypes

## 🛠️ Requirements

- Linux environment (tested on Ubuntu)
- OpenROAD Flow Scripts
- Compatible version of Magic for DEF to GDS conversion
- IHP SG13G2 PDK files (under NDA or academic license)

## ⚠️ Disclaimer

**Note:** The IHP SG13G2 PDK is under license — please ensure you have legal access. This repository does not contain proprietary PDK files.

## 📃 License

This project is released under the MIT License.

## 👤 Author

**Khalid Hossain**  
[GitHub](https://github.com/KhalidHossain3108)  

**Sheikh Tariful Islam**
[GitHub](https://github.com/tariftasfiq)  
**Contributions and pull requests are welcome!**
