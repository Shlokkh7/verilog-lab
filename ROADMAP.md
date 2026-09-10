# Silicon Engineering & Verification Master Roadmap
# From RTL Primitives to Custom Silicon IP & UVM Environments

---

## The Verification Maturity Matrix (DV Progression Track)
Every project below must meet both its **RTL Synthesis Gate** and its assigned **Verification Gate**:

* **[DV-L1] Self-Checking Directed & SVA:** Automated checks, SystemVerilog Assertions (`$rose`, `$fell`, concurrent assertions), and `$fatal` on error. No staring at waveforms.
* **[DV-L2] Constrained-Random & Functional Coverage:** Object-Oriented SystemVerilog testbenches, randomized stimulus generators, transactions, and covergroups with functional coverage metrics.
* **[DV-L3] Full UVM Testbench:** Enterprise-grade UVM environment implementing `uvm_sequence_item`, `uvm_sequencer`, `uvm_driver`, `uvm_monitor`, `uvm_agent`, `uvm_scoreboard`, and `uvm_env`.

---

## Phase 0: Foundations & Primitives [STATUS: AUDIT & CLEANUP]
> **Goal:** Consolidate existing combinational and sequential modules into unified, parameterized 32-bit libraries.

- [x] **P01:** Configurable ALU (CLA, Logic operations, Flags) `[DV-L1]`
- [x] **P02:** Synchronous Dual-Port SRAM Controller `[DV-L1]`
- [x] **P05:** Multi-Mode Traffic Light Controller (Mealy/Moore FSM) `[DV-L1]`
- [x] **P06:** VGA 640x480 Controller with Framebuffer `[DV-L1]`
- [x] **P07:** Multi-Channel PWM Generator with Dead-Time Logic `[DV-L1]`
- [x] **P08:** Digital Clock & Debounced Keypad Interface `[DV-L1]`
- [ ] **Cleanup Task:** Unify `cla_nbits.v` and barrel shifters into a standardized 32-bit datapath library.

---

## Phase 1: Clock Domains & Serial Bus Protocols [ESTIMATED: 4 WEEKS]
> **Goal:** Master Clock Domain Crossing (CDC) safety and implement standardized communication protocols.

- [ ] **P03: Dual-Clock Asynchronous FIFO** `[Rank 3 | Diff: Intermediate]` **[DV-L1 / DV-L2]**
  - *RTL Focus:* Binary-to-Gray conversion, 2-FF synchronizers, full/empty condition math across clock boundaries.
  - *Verification Focus:* Concurrent SV Assertions (SVA) checking that full/empty flags never assert simultaneously; randomized clock frequency drift testbench (e.g., 150 MHz write vs 33 MHz read).
  - *Exit Gate:* Zero data corruption or FIFO pointer overflow under 100,000 randomized read/write bursts.

- [ ] **P04: UART Transceiver with Integrated FIFOs** `[Bare Minimum | Diff: Beginner-Int]` **[DV-L1 / DV-L3 Candidate]**
  - *RTL Focus:* 16x oversampling RX filter, baud rate generator, integration with P03 FIFOs.
  - *Verification Focus:* (Optional first UVM stepping stone) Build a basic UVM Agent to generate randomized byte packets.
  - *Exit Gate:* Pass full-duplex loopback simulation with random clock skew and baud rate mismatch (±2%).

- [ ] **P09: Quad-Mode SPI Master/Slave Controller** `[Rank 14 | Diff: Beginner-Int]` **[DV-L1]**
  - *RTL Focus:* Runtime programmable CPOL and CPHA, multi-slave chip-select routing.
  - *Verification Focus:* Self-checking scoreboard verifying data transmission across all 4 modes.
  - *Exit Gate:* Continuous burst transfers at SPI Clock = SysClk / 2 without bit slips.

- [ ] **P10: I2C Host/Target Engine** `[Rank 10 | Diff: Intermediate]` **[DV-L2]**
  - *RTL Focus:* Open-drain tri-state control, clock stretching, bus arbitration logic.
  - *Verification Focus:* Constrained-random bus collisions to test multi-master arbitration and acknowledge cycles.
  - *Exit Gate:* Lower-address master gracefully wins arbitration with zero protocol hangs.

- [ ] **P11: AXI4-Lite to APB Protocol Bridge** `[Rank 5 | Diff: Intermediate]` **[DV-L3: First Full UVM Project]**
  - *RTL Focus:* Two-way ready/valid handshakes, APB state machine, `SLVERR`/`DECERR` response mapping.
  - *Verification Focus:* Full UVM environment (AXI-Lite Master Agent + APB Slave UVM Model + Scoreboard).
  - *Exit Gate:* 10,000 cycles of randomized backpressure with 100% functional coverage on all handshake transitions.

---

## Phase 2: High-Performance Pipelined Datapaths & DSP [ESTIMATED: 5 WEEKS]
> **Goal:** Master multi-cycle pipelining, non-restoring math, and fixed/floating-point algorithms.

- [ ] **P15: Radix-4 Booth Multiplier with Wallace Tree** `[Rank 12 | Diff: Intermediate]` **[DV-L1]**
  - *RTL Focus:* Signed 32-bit multiplication, Booth recoding tables, carry-save reduction tree.
  - *Verification Focus:* Golden-model comparison against behavioral operator (`*`) across 1,000,000 vectors.
  - *Exit Gate:* Zero mismatch across all signed boundary conditions (`INT_MIN`, `INT_MAX`, `-1`, `0`).

- [ ] **P16: Non-Restoring / SRT Hardware Integer Divider** `[Rank 15 | Diff: Intermediate]` **[DV-L1]**
  - *RTL Focus:* Digit-recurrence datapath, quotient-selection logic, early termination on small operands.
  - *Verification Focus:* Assertions verifying divide-by-zero flag behavior and remainder sign rules.
  - *Exit Gate:* 100% pass rate comparing quotient and remainder outputs against software math models.

- [ ] **P17: Parameterized Pipelined FIR Filter** `[Rank 16 | Diff: Intermediate]` **[DV-L1]**
  - *RTL Focus:* Transposed direct-form architecture, symmetric coefficient folding, fixed-point saturation.
  - *Verification Focus:* File I/O testbench reading Python/NumPy generated test vectors and checking output SNR.
  - *Exit Gate:* Frequency response attenuation matches MATLAB/Python reference filter specs.

- [ ] **P19: Pipelined CORDIC Processor** `[Rank 17 | Diff: Intermediate]` **[DV-L1]**
  - *RTL Focus:* Unrolled 16-stage pipeline computing Sine, Cosine, and Arctan using shift-add only.
  - *Verification Focus:* Automated error checking comparing CORDIC output angles against math library `sin`/`cos`.
  - *Exit Gate:* Maximum angular error < 0.005 radians across all 4 quadrants.

- [ ] **P18: Radix-2/4 64-Point FFT Engine** `[Rank 7 | Diff: Advanced]` **[DV-L2]**
  - *RTL Focus:* Butterfly processing units, twiddle-factor LUT generation, ping-pong BRAM addressing.
  - *Verification Focus:* Randomized complex sinusoid stimuli; functional coverage on twiddle address sequences.
  - *Exit Gate:* Output SNR > 50 dB compared to 32-bit floating-point FFT reference.

- [ ] **P20: IEEE 754 Single-Precision Floating Point Unit (FPU)** `[Rank 9 | Diff: Advanced]` **[DV-L2]**
  - *RTL Focus:* Pipelined FP Adder and FP Multiplier, exponent alignment, normalization, round-to-nearest-even.
  - *Verification Focus:* Berkeley TestFloat compliance suite stimulus injection via testbench.
  - *Exit Gate:* Zero failures across subnormal numbers, NaNs, infinities, and all rounding modes.

---

## Phase 3: RISC-V Processor Microarchitecture [ESTIMATED: 6 WEEKS]
> **Goal:** Build, pipeline, and verify a complete 32-bit RISC-V core capable of executing compiled C code.

- [ ] **P21: Single-Cycle RV32I Processor** `[Bare Minimum | Diff: Beginner-Int]` **[DV-L1]**
  - *RTL Focus:* Monolithic datapath, immediate generator (`imm_gen`), main control decoder.
  - *Exit Gate:* Run a bare-metal assembly program calculating Fibonacci numbers in simulated memory.

- [ ] **P22: Classic 5-Stage Pipelined RV32I Core** `[Rank 2 | Diff: Intermediate-Adv]` **[DV-L2]**
  - **Milestone 22.1 (Pipelining):** Slicing datapath into IF, ID, EX, MEM, and WB with stage registers.
  - **Milestone 22.2 (Hazard Unit):** Implement load-use hazard detection and pipeline bubble/stall injection.
  - **Milestone 22.3 (Forwarding Unit):** Implement EX-to-EX and MEM-to-EX data forwarding networks.
  - **Milestone 22.4 (Branch Resolution):** Branch evaluation in EX stage with 2-cycle flush penalties.
  - *Verification Focus:* Automated register-file comparison testbench against a software instruction set simulator (ISS / Spike).
  - *Exit Gate:* Pass 100% of official `riscv-tests` (RV32UI suite: `add`, `lui`, `jal`, `sw`, `lw`, etc.).

---

## Phase 4: Memory Subsystem, Interconnect & SoC Infrastructure [ESTIMATED: 5 WEEKS]
> **Goal:** Transform the raw core into a production-style SoC platform.

- [ ] **P13: Programmable Interrupt Controller (PIC)** `[Rank 13 | Diff: Intermediate]` **[DV-L1]**
  - *RTL Focus:* Edge/level detection, priority arbitration, masking registers, vector address generation.
  - *Exit Gate:* Trigger simultaneous nested interrupts and verify prioritized CPU preemption.

- [ ] **P24: 2-Way Set-Associative L1 Cache (Instruction & Data)** `[Rank 6 | Diff: Advanced]` **[DV-L2]**
  - *RTL Focus:* Tag comparison, Pseudo-LRU replacement, write-back with write-allocate, dirty bit tracking.
  - *Verification Focus:* Constrained-random memory reads/writes stressing cache thrashing, evictions, and line fills.
  - *Exit Gate:* 100% data integrity verified between CPU, cache, and backing memory.

- [ ] **P14: Multi-Channel Scatter-Gather DMA Controller** `[Rank 8 | Diff: Advanced]` **[DV-L3: Production UVM]**
  - *RTL Focus:* Descriptor chain fetching, AXI memory burst transfers, internal FIFO buffering.
  - *Verification Focus:* UVM environment testing random descriptor lengths, misaligned transfers, and backpressure.
  - *Exit Gate:* Stream 64KB blocks between memory and peripherals with zero CPU overhead.

- [ ] **P12: SDRAM / Basic DDR Controller** `[Rank 11 | Diff: Advanced]` **[DV-L2]**
  - *RTL Focus:* Row/column command sequencing, auto-refresh counters, precharge and activate timing constraints.
  - *Exit Gate:* Pass timing-accurate memory model simulation conforming to JEDEC specs.

---

## Phase 5: Hardware Acceleration Engines [ESTIMATED: 6 WEEKS]
> **Goal:** Design high-throughput, memory-mapped coprocessors connected to the RISC-V SoC.

- [ ] **P27: AES-128 / AES-256 Cryptographic Engine** `[Rank 1 Tied | Diff: Intermediate-Adv]` **[DV-L2]**
  - *RTL Focus:* Fully pipelined 10/14-round encryption datapath, SubBytes LUT/BRAM, on-the-fly KeyExpansion.
  - *Exit Gate:* 1 block/clock cycle throughput; pass NIST AES Known Answer Test (KAT) vectors.

- [ ] **P28: 2D Systolic Array GEMM Accelerator (TPU-Style)** `[Rank 1 | Diff: Advanced]` **[DV-L2 / DV-L3]**
  - *RTL Focus:* Weight-stationary $4\times4$ or $8\times8$ processing elements (PEs), skewed matrix inputs, output draining.
  - *Verification Focus:* Random matrix stimulus generator comparing array outputs against NumPy matrix multiplication.
  - *Exit Gate:* Verified integer matrix multiplication ($A \times B$) with 100% computational correctness.

- [ ] **P29: Hardware CNN Inference Engine** `[Rank 1 Tied | Diff: Advanced]` **[DV-L2]**
  - *RTL Focus:* Line buffers for $3\times3$ sliding-window convolutions, max-pooling stride logic, ReLU activation.
  - *Exit Gate:* Classify a $28\times28$ MNIST test image end-to-end and match PyTorch model predictions.

- [ ] **P30: SNN Leaky Integrate-and-Fire (LIF) Core** `[Rank 20 | Diff: Advanced-Expert]` **[DV-L2]**
  - *RTL Focus:* Upgrade existing `snn_fpga`: programmable membrane leakage, threshold comparator, spike-routing crossbar.
  - *Exit Gate:* Multi-layer spiking network firing output spikes matching a software SNN simulation (e.g., snnTorch).

---

## Phase 6: Production-Grade Capstones [ADVANCED PORTFOLIO]
> **Goal:** Tackle advanced microarchitectures that establish mastery in ASIC/FPGA design.

- [ ] **P25: Memory Management Unit (MMU) with TLB** `[Rank 18 | Diff: Advanced]` **[DV-L2]**
  - *RTL Focus:* Hardware Sv32 page table walker, 16-entry fully associative TLB, page fault exception traps.
  - *Exit Gate:* Execute a virtual-memory mapped program with verified page hits, misses, and access traps.

- [ ] **P26: Dual-Core Shared-Memory Subsystem (MESI Protocol)** `[Rank 19 | Diff: Expert]` **[DV-L3]**
  - *RTL Focus:* Shared snooping bus, 4-state MESI cache coherence protocol, atomic test-and-set locks.
  - *Exit Gate:* Two cores execute concurrent read-modify-write loops to a shared variable without race conditions.

- [ ] **P31: 10G/1G Ethernet MAC Controller** `[Rank 21 | Diff: Advanced]` **[DV-L3]**
  - *RTL Focus:* Preamble detection, frame delimiters, runtime CRC32 calculation and verification, AXI-Stream interface.
  - *Exit Gate:* Zero-drop line-rate packet framing in simulation using standard Ethernet test frames.

- [ ] **P23: Out-of-Order Execution Core (Tomasulo / Scoreboard)** `[Rank 4 | Diff: Expert]` **[DV-L3]**
  - *RTL Focus:* Instruction reservation stations, Common Data Bus (CDB), register renaming, dynamic branch prediction.
  - *Exit Gate:* Correctly resolve RAW/WAR/WAW hazards without stalls while achieving higher IPC than the P22 pipelined core.