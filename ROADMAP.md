# Silicon Engineering Master Roadmap: From RTL Primitives to Custom Silicon IP

## Phase 0: Foundations & Primitives [STATUS: AUDIT & CLEANUP]
> **Goal:** Consolidate existing combinational and sequential modules into unified, parameterized 32-bit libraries.

- [x] **P01:** Configurable ALU (CLA, Logic operations, Flags)
- [x] **P02:** Synchronous Dual-Port SRAM Controller
- [x] **P05:** Multi-Mode Traffic Light Controller (Mealy/Moore FSM)
- [x] **P06:** VGA 640x480 Controller with Framebuffer
- [x] **P07:** Multi-Channel PWM Generator with Dead-Time Logic
- [x] **P08:** Digital Clock & Debounced Keypad Interface
- [ ] **Cleanup Task:** Unify `cla_nbits.v` and barrel shifters into a standardized 32-bit datapath library.

---

## Phase 1: Clock Domains & Serial Bus Protocols [ESTIMATED: 4 WEEKS]
> **Goal:** Eliminate CDC blindspots and implement standard communication state machines.

- [ ] **P03: Dual-Clock Asynchronous FIFO** `[Rank 3 | Diff: Intermediate]`
  - *Focus:* Binary-to-Gray conversion, 2-FF synchronizers, full/empty condition math across clock boundaries.
  - *Exit Gate:* Pass CDC testbench pushing at 150 MHz and popping at 40 MHz under continuous full/empty stress.
- [ ] **P04: UART Transceiver with Integrated FIFOs** `[Bare Minimum | Diff: Beginner-Int]`
  - *Focus:* 16x oversampling RX filter, baud rate generator, integration with P03 FIFOs.
  - *Exit Gate:* Loopback test in simulator with random baud mismatches (±2%).
- [ ] **P09: Quad-Mode SPI Master/Slave Controller** `[Rank 14 | Diff: Beginner-Int]`
  - *Focus:* Runtime programmable CPOL and CPHA, multi-slave chip select routing.
  - *Exit Gate:* Full-duplex burst transfer verification at SPI Clock = SysClk / 2.
- [ ] **P10: I2C Host/Target Engine** `[Rank 10 | Diff: Intermediate]`
  - *Focus:* Open-drain tri-state control, clock stretching, bus arbitration logic.
  - *Exit Gate:* Multi-master collision test where lower-address master gracefully wins arbitration.
- [ ] **P11: AXI4-Lite to APB Protocol Bridge** `[Rank 5 | Diff: Intermediate]`
  - *Focus:* Two-way ready/valid handshakes, protocol translation, SLVERR/DECERR handling.
  - *Exit Gate:* 10,000 backpressure cycles with zero lost transactions or deadlock states.

---

## Phase 2: High-Performance Pipelined Datapaths & DSP [ESTIMATED: 5 WEEKS]
> **Goal:** Master multi-cycle pipelining, non-restoring math, and fixed-point algorithms.

- [ ] **P15: Radix-4 Booth Multiplier with Wallace Tree** `[Rank 12 | Diff: Intermediate]`
  - *Focus:* 32-bit signed multiplication, Booth recoding tables, carry-save reduction.
  - *Exit Gate:* Match 1,000,000 randomized vectors against a behavioral golden model (`*`).
- [ ] **P16: Non-Restoring / SRT Hardware Integer Divider** `[Rank 15 | Diff: Intermediate]`
  - *Focus:* Digit-recurrence datapath, quotient-selection logic, early termination on small operands.
  - *Exit Gate:* Verify all edge cases: divide-by-zero, signed overflow (`INT_MIN / -1`), remainder signs.
- [ ] **P17: Parameterized Pipelined FIR Filter** `[Rank 16 | Diff: Intermediate]`
  - *Focus:* Transposed direct-form architecture, symmetric coefficient folding, fixed-point saturation.
  - *Exit Gate:* Inject multi-tone sinusoids and demonstrate correct low-pass filtering in Python/NumPy FFT analysis.
- [ ] **P19: Pipelined CORDIC Processor** `[Rank 17 | Diff: Intermediate]`
  - *Focus:* Unrolled 16-stage pipeline computing Sine, Cosine, and Arctan using shift-add only.
  - *Exit Gate:* Maximum angular error < 0.005 radians across all 4 quadrants.
- [ ] **P18: Radix-2/4 64-Point FFT Engine** `[Rank 7 | Diff: Advanced]`
  - *Focus:* Butterfly processing units, twiddle-factor LUT generation, ping-pong BRAM addressing.
  - *Exit Gate:* Compute 64-point complex FFT; verify SNR > 50 dB compared to 32-bit floating-point golden model.
- [ ] **P20: IEEE 754 Single-Precision Floating Point Unit (FPU)** `[Rank 9 | Diff: Advanced]`
  - *Focus:* Pipelined FP Adder and FP Multiplier, exponent alignment, normalization, round-to-nearest-even.
  - *Exit Gate:* Pass Berkeley TestFloat verification suite for subnormal, NaN, and infinity corner cases.

---

## Phase 3: RISC-V Processor Microarchitecture [ESTIMATED: 6 WEEKS]
> **Goal:** Build, pipeline, and verify a complete 32-bit RISC-V core capable of executing compiled C code.

- [ ] **P21: Single-Cycle RV32I Processor** `[Bare Minimum | Diff: Beginner-Int]`
  - *Focus:* Monolithic datapath, immediate generator (`imm_gen`), main control decoder.
  - *Exit Gate:* Execute a bare-metal assembly loop calculating Fibonacci numbers in simulated memory.
- [ ] **P22: Classic 5-Stage Pipelined RV32I Core** `[Rank 2 | Diff: Intermediate-Adv]`
  - **Milestone 22.1 (Pipelining):** Split datapath into IF, ID, EX, MEM, WB with stage registers.
  - **Milestone 22.2 (Hazard Unit):** Implement load-use hazard detection and bubble injection.
  - **Milestone 22.3 (Forwarding Unit):** EX-to-EX and MEM-to-EX forwarding networks.
  - **Milestone 22.4 (Branch Target):** Branch comparison in EX stage with 2-cycle flush penalties.
  - *Exit Gate:* Pass 100% of the official `riscv-tests` (RV32UI suite: `add`, `lui`, `jal`, etc.).

---

## Phase 4: Memory Subsystem, Interconnect & SoC Infrastructure [ESTIMATED: 5 WEEKS]
> **Goal:** Transform the raw core into a production-style SoC platform.

- [ ] **P13: Programmable Interrupt Controller (PIC)** `[Rank 13 | Diff: Intermediate]`
  - *Focus:* Edge/level detection, priority arbitration, masking registers, vector address generation.
  - *Exit Gate:* Trigger nested interrupts and verify prioritized CPU preemption.
- [ ] **P24: 2-Way Set-Associative L1 Cache (Instruction & Data)** `[Rank 6 | Diff: Advanced]`
  - *Focus:* Tag comparison, Pseudo-LRU replacement, write-back with write-allocate, dirty bit tracking.
  - *Exit Gate:* Cache hit/miss stress test demonstrating zero memory leaks and 100% write-back data integrity.
- [ ] **P14: Multi-Channel Scatter-Gather DMA Controller** `[Rank 8 | Diff: Advanced]`
  - *Focus:* Descriptor chain fetching, AXI-to-AXI memory burst transfers, FIFO buffering.
  - *Exit Gate:* Stream 64KB blocks from memory to a simulated peripheral with zero CPU intervention.
- [ ] **P12: SDRAM / Basic DDR Controller** `[Rank 11 | Diff: Advanced]`
  - *Focus:* Row/column command sequencing, auto-refresh counters, precharge and activate timing constraints.
  - *Exit Gate:* Synthesize and pass a timing-accurate memory model simulation conforming to JEDEC specs.

---

## Phase 5: Hardware Acceleration Engines [ESTIMATED: 6 WEEKS]
> **Goal:** Design high-throughput, memory-mapped coprocessors connected to the RISC-V SoC.

- [ ] **P27: AES-128 / AES-256 Cryptographic Engine** `[Rank 1 Tied | Diff: Intermediate-Adv]`
  - *Focus:* Fully pipelined 10/14-round encryption datapath, SubBytes LUT/BRAM, on-the-fly KeyExpansion.
  - *Exit Gate:* Achieve 1 block per clock cycle throughput; match NIST AES Known Answer Test (KAT) vectors.
- [ ] **P28: 2D Systolic Array GEMM Accelerator (TPU-Style)** `[Rank 1 | Diff: Advanced]`
  - *Focus:* Weight-stationary $4\times4$ or $8\times8$ processing elements (PEs), skewed matrix inputs, output draining.
  - *Exit Gate:* Compute integer matrix multiplication ($A \times B$) and match Python NumPy outputs.
- [ ] **P29: Hardware CNN Inference Engine** `[Rank 1 Tied | Diff: Advanced]`
  - *Focus:* Line buffers for $3\times3$ sliding-window convolutions, max-pooling stride logic, ReLU activation.
  - *Exit Gate:* Process a $28\times28$ MNIST image end-to-end and report accuracy matching the PyTorch model.
- [ ] **P30: SNN Leaky Integrate-and-Fire (LIF) Core** `[Rank 20 | Diff: Advanced-Expert]`
  - *Focus:* Upgrade existing `snn_fpga`: programmable membrane leakage, threshold comparator, spike-routing crossbar.
  - *Exit Gate:* Realize a 2-layer spiking network that fires output spikes matching a software SNN simulation (e.g., snnTorch).

---

## Phase 6: Production-Grade Capstones [ADVANCED PORTFOLIO]
> **Goal:** Tackle advanced microarchitectures that establish mastery in ASIC/FPGA design.

- [ ] **P25: Memory Management Unit (MMU) with TLB** `[Rank 18 | Diff: Advanced]`
  - *Focus:* Hardware Sv32 page table walker, 16-entry fully associative TLB, page fault exception traps.
  - *Exit Gate:* Execute a virtual-memory mapped program with page hits, page misses, and access violation faults.
- [ ] **P26: Dual-Core Shared-Memory Subsystem (MESI Protocol)** `[Rank 19 | Diff: Expert]`
  - *Focus:* Shared snooping bus, 4-state MESI cache coherence protocol, atomic test-and-set locks.
  - *Exit Gate:* Run two cores simultaneously modifying a shared memory buffer without race conditions.
- [ ] **P31: 10G/1G Ethernet MAC Controller** `[Rank 21 | Diff: Advanced]`
  - *Focus:* Preamble detection, frame delimiters, runtime CRC32 calculation and verification, AXI-Stream interface.
  - *Exit Gate:* Zero-drop line-rate packet framing in simulation using standard Ethernet test frames.
- [ ] **P23: Out-of-Order Execution Core (Tomasulo / Scoreboard)** `[Rank 4 | Diff: Expert]`
  - *Focus:* Instruction reservation stations, Common Data Bus (CDB), register renaming, dynamic branch prediction.
  - *Exit Gate:* Correctly resolve RAW/WAR/WAW hazards without stalls while achieving higher IPC than the 5-stage core.