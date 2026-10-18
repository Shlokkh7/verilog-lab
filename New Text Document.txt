# Silicon RTL Coding Style & DV Reference Guide

## 1. Naming & Port Conventions
- Clock: `clk`
- Active-Low Reset: `rst_n`
- Module Inputs: Suffix `_i` (e.g., `data_i`, `valid_i`)
- Module Outputs: Suffix `_o` (e.g., `data_o`, `ready_o`)
- Sequential Registers: Suffix `_r` or `_q` (e.g., `state_r`, `count_r`)
- Next-State Combinational Nets: Suffix `_next` or `_d` (e.g., `state_next`, `count_next`)
- Local constants: `localparam UPPERCASE_NAME`

## 2. Synthesis Hard Rules
1. Non-blocking (`<=`) for clocked sequential blocks:
   always @(posedge clk or negedge rst_n) begin
       if (!rst_n) state_r <= IDLE;
       else        state_r <= state_next;
   end
2. Blocking (`=`) for combinational logic:
   always @(*) begin
       state_next = state_r; // Default assignment prevents latches
       case (state_r)
           IDLE: if (start_i) state_next = RUN;
           RUN:  if (done_i)  state_next = IDLE;
           default:           state_next = IDLE;
       endcase
   end
3. Never read an output port directly inside the module; use an internal `_r` register and assign it to the output net:
   assign count_o = count_r;

## 3. Clock Domain Crossing (CDC) Invariants
- Never synchronize multi-bit data buses with 2-FF synchronizers.
- Pointers crossing clock boundaries MUST be Gray-coded before passing into synchronizers.
- For single-bit control signals across domains, use a 2-stage D-FF synchronizer (`sync_2ff`).
- Ensure the destination clock period does not violate MTBF (Mean Time Between Failures) requirements.

## 4. SystemVerilog Assertions (SVA) Reference
- Overlapping implication (`|->`): If condition holds on cycle T, consequence holds on cycle T.
- Non-overlapping implication (`|=>`): If condition holds on cycle T, consequence holds on cycle T+1.
- Immediate assertion:
  assert (pointer < DEPTH) else $fatal(1, "Pointer out of bounds!");
- Concurrent assertion:
  property p_handshake_hold;
      @(posedge clk) disable iff (!rst_n)
      (valid_i && !ready_i) |=> $stable(data_i);
  endproperty
  a_handshake_hold: assert property (p_handshake_hold) else $error("Data changed while stalled!");