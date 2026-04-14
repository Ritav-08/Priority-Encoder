# 📘 4-to-2 Priority Encoder – Verilog

## 🔹 Overview

This project implements a **4-to-2 Priority Encoder** in Verilog along with its testbench.
A priority encoder converts multiple input lines into a smaller number of output bits based on **priority**, where the highest-priority active input is encoded.

Priority order (highest → lowest):
**A > B > C > D**

---

## 🔹 Features

* 4 input lines (`a_i`, `b_i`, `c_i`, `d_i`)
* 2-bit encoded output (`x_o`, `y_o`)
* Priority-based encoding
* Handles multiple active inputs
* Includes test cases for edge conditions (all 0s, all 1s, X states)
* Fully combinational logic (`always @(*)`)

---

## 🔹 Module Description

### 📌 Inputs

* `a_i` → Highest priority input
* `b_i` → Second priority
* `c_i` → Third priority
* `d_i` → Lowest priority

### 📌 Outputs

* `x_o`, `y_o` → Encoded 2-bit output

---

## 🔹 Working Principle

The encoder assigns binary codes based on priority:

| Active Input | Output (x_o y_o) |
| ------------ | ---------------- |
| A            | 00               |
| B            | 01               |
| C            | 10               |
| D            | 11               |

### 🔸 Special Case

* If all inputs are `0`:

  ```
  x_o = 0, y_o = 0
  ```

### 🔸 Priority Logic

* If multiple inputs are `1`, the **highest priority input is selected**:

  * A overrides all
  * B overrides C and D
  * C overrides D

---

## 🔹 Truth Table (Priority-Based)

| A | B | C | D | Output (x y) |
| - | - | - | - | ------------ |
| 0 | 0 | 0 | 0 | 00           |
| 1 | X | X | X | 00           |
| 0 | 1 | X | X | 01           |
| 0 | 0 | 1 | X | 10           |
| 0 | 0 | 0 | 1 | 11           |

---

## 🔹 Testbench Details

The testbench (`tb_pEncoder`) verifies various scenarios:

| Test Case | Inputs (A B C D) | Description            |
| --------- | ---------------- | ---------------------- |
| 1         | 0000             | All inputs zero        |
| 2         | 1000             | A active               |
| 3         | 0100             | B active               |
| 4         | 0010             | C active               |
| 5         | 0001             | D active               |
| 6         | X100             | Unknown + valid input  |
| 7         | 1X00             | Priority override case |
| 8         | 0X00             | Single unknown input   |
| 9         | XXXX             | All unknown            |
| 10        | 1111             | All inputs active      |

---

## 🔹 Simulation

### ▶️ Tools

* ModelSim / QuestaSim
* Xilinx Vivado
* Icarus Verilog + GTKWave

### ▶️ Run (Icarus Verilog Example)

```bash id="w9j2ka"
iverilog -o pEncoder.vvp pEncoder.v tb_pEncoder.v
vvp pEncoder.vvp
gtkwave pEncoder.vcd
```

---

## 🔹 Output

* Console output using `$monitor`
* Waveform dump file:

  ```
  pEncoder.vcd
  ```

---

## 🔹 Sample Output Format

```id="8k3l1z"
Time: 10 | A: 0, B: 1, C: 0, D: 0 | X: 0, Y: 1
```

---

## 🔹 Applications

* Interrupt handling systems
* Priority-based resource allocation
* Keyboard encoding logic
* Digital communication systems

---

## 🔹 File Structure

```id="d4m7xp"
├── pEncoder.v        # Priority Encoder Design
├── tb_pEncoder.v     # Testbench
├── pEncoder.vcd      # Waveform output (generated)
└── README.txt        # Documentation
```
