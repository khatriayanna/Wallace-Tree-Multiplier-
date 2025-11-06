#  Wallace Tree Multiplier (Verilog HDL)

##  Overview  
This project implements an **8x8 Wallace Tree Multiplier** using **Verilog HDL**, a high-speed and area-efficient digital multiplier architecture.  
The Wallace Tree structure reduces the propagation delay by performing partial product reduction in parallel rather than sequentially.

The design is structured hierarchically, separating major functional blocks into independent Verilog modules — making the code modular, scalable, and easy to verify.

---
##  Objective  
The main objective of this project is to design and simulate a **Wallace Tree Multiplier** that efficiently multiplies two 8-bit binary numbers with reduced delay compared to conventional array or ripple-carry multipliers.

---

##  Design Hierarchy  

###  1. Top Module (`top.v`)  
- Serves as the integration point for all submodules.  
- Connects the **Partial Product Generator**, **Wallace Tree**, and **Final Carry Propagator**.  
- Produces the final 16-bit product output.  

**Key Features:**  
- Clean hierarchical instantiation  
- Signal management between modules  
- Combines final sum and carry outputs  

---

###  2. Partial Product Generator (`partial_product.v`)  
- Generates 8 rows of partial products by performing bitwise AND between multiplicand and multiplier bits.  
- Each bit of the multiplier is ANDed with all bits of the multiplicand.  
- The resulting partial products are passed to the Wallace Tree for reduction.

**Example:**  
If `A = a7a6a5a4a3a2a1a0` and `B = b7b6b5b4b3b2b1b0`,  
then partial product[i][j] = A[i] & B[j].

---

###  3. Wallace Tree Reduction (`wallace_tree.v`)  
- Implements the Wallace reduction structure to sum the partial products efficiently.  
- Uses **Half Adders** and **Full Adders** to compress multiple partial product bits in parallel.  
- Repeatedly reduces the number of rows until only two remain (sum and carry vectors).

**Advantages:**  
- Parallel reduction reduces computation time  
- Lower propagation delay compared to sequential adders  

---

###  4. Final Carry Propagator (`final_carry_propagator.v`)  
- Adds the final two rows obtained from the Wallace Tree reduction using a **Carry Propagate Adder (CPA)**.  
- Generates the final 16-bit product output.

**Responsibilities:**  
- Handle carry propagation  
- Ensure accurate final summation  
- Output final product result  

---

###  5. Testbench (`tb_wallace.v`)  
- Verifies the correctness and functionality of the entire design.  
- Applies multiple test vectors to simulate various input conditions.  
- Displays input multiplicand, multiplier, and output product.  
- Dumps waveform data for simulation analysis.

**Includes:**  
- Input stimulus generation  
- Console output (`$monitor`)  
- Waveform dumping (`$dumpfile`, `$dumpvars`)  

---

##  Working Principle  

The Wallace Tree Multiplier works in three main stages:

1. **Partial Product Generation:**  
   Each bit of the multiplier is multiplied with all bits of the multiplicand, forming 8 rows of partial products.

2. **Wallace Tree Reduction:**  
   Partial products are reduced using layers of **Full Adders (FA)** and **Half Adders (HA)** to minimize the number of rows step by step.

3. **Final Addition:**  
   The remaining two rows are added using a **Carry Propagate Adder**, producing the final product.

---

##  Features  
- Fast multiplication using **parallel reduction**  
- Modular and hierarchical Verilog design  
- Clear separation of logic into submodules  
- Easy to test and verify using the provided testbench  
- Fully synthesizable design  
- Compatible with FPGA or ASIC implementation  

---

##  Tools and Environment  
You can simulate or synthesize this project using any of the following tools:

| Tool | Purpose |
|------|----------|
| **ModelSim / QuestaSim** | Simulation and waveform analysis |
| **Xilinx Vivado** | FPGA synthesis and simulation |
| **Cadence Xcelium** | ASIC design simulation |
| **Icarus Verilog (CLI)** | Open-source Verilog simulation |

---

## ▶️ Simulation Example (Icarus Verilog)


```bash
# Compile all Verilog files
iverilog -o wallace_tb top.v wallace_tree.v partial_product.v final_carry_propagator.v tb_wallace.v

# Run the simulation
vvp wallace_tb

# View waveforms
gtkwave dump.vcd
