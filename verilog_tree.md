```text
verilog-lab/
├── combinational/
│   ├── adder/
│   │   ├── 1bit_full_adder/
│   │   │   ├── fa_behavioral.v
│   │   │   ├── fa_behaviour_tb.v
│   │   │   ├── fa_dataflow.v
│   │   │   ├── fa_dataflow_tb.v
│   │   │   ├── fa_structural.v
│   │   │   └── fa_structural_tb.v
│   │   ├── Adder_Substractor/
│   │   │   ├── adder_substractor.v
│   │   │   ├── adder_substractor_nbit.v
│   │   │   └── adder_substractor_nbit_tb.v
│   │   ├── CLA/
│   │   │   ├── cla_nbits.v
│   │   │   └── cla_nbits_tb.v
│   │   ├── half_adder/
│   │   │   ├── half_adder_beh.v
│   │   │   ├── half_adder_df.v
│   │   │   └── half_adder_struct.v
│   │   └── RCA/
│   │       ├── multi_adders.v
│   │       ├── rca_4bit.v
│   │       ├── rca_8bit.v
│   │       └── rca_nbits.v
│   ├── barrel_shifter/
│   │   ├── left_barrel_shifter/
│   │   │   ├── left_barrel_shifter_16bits.v
│   │   │   └── left_barrel_shifter_16bits_tb.v
│   │   ├── right_barrel_shifter/
│   │   │   ├── right_barrel_shifter_8bits.v
│   │   │   └── right_barrel_shifter_8bits_tb.v
│   │   └── submodules/
│   │       └── mux_2x1.v
│   ├── comparator/
│   │   └── comparator_4bits/
│   │       ├── comparator_4bits.v
│   │       └── comparator_4bits_tb.v
│   ├── decoder/
│   │   ├── 2x4/
│   │   │   ├── decoder_2x1_beh_tb.v
│   │   │   ├── decoder_2x4_beh.v
│   │   │   ├── decoder_2x4_df.v
│   │   │   └── decoder_2x4_df_tb.v
│   │   └── 3x8/
│   │       ├── decoder_3x8_beh.v
│   │       ├── decoder_3x8_beh_tb.v
│   │       ├── decoder_3x8_df.v
│   │       └── decoder_3x8_df_tb.v
│   ├── demux/
│   │   ├── 1x2/
│   │   │   ├── demux_1x2.v
│   │   │   └── demux_1x2_tb.v
│   │   ├── 1x4/
│   │   │   ├── demux_1x4.v
│   │   │   └── demux_1x4_tb.v
│   │   └── 1xN/
│   │       ├── demux_1xN.v
│   │       └── demux_1xN_tb.v
│   ├── encoder/
│   │   ├── 4x2/
│   │   │   ├── encoder_4x2.v
│   │   │   └── encoder_4x2_tb.v
│   │   ├── 8x3/
│   │   │   ├── encoder_8x3.v
│   │   │   └── encoder_8x3_tb.v
│   │   ├── bcd_encoder/
│   │   │   ├── bcd_encoder.v
│   │   │   └── bcd_encoder_tb.v
│   │   ├── grey_encoder/
│   │   │   ├── 4bit/
│   │   │   │   ├── grey_encoder_4bit.v
│   │   │   │   └── grey_encoder_4bit_tb.v
│   │   │   └── Nbit/
│   │   │       ├── grey_encoder_nbit.v
│   │   │       └── grey_encoder_nbit_tb.v
│   │   └── priority_encoder/
│   │       ├── priority_encoder_4x2.v
│   │       ├── priority_encoder_4x2_tb.v
│   │       ├── priority_encoder_generic.v
│   │       └── priority_encoder_generic_tb.v
│   ├── functions_and_tasks/
│   │   ├── 16x1 Mux/
│   │   │   ├── mux_16x1_fun.v
│   │   │   ├── mux_16x1_fun_tb.v
│   │   │   ├── mux_16x1_tasks.v
│   │   │   └── mux_16x1_tasks_tb.v
│   │   ├── 1x16 Demux/
│   │   │   ├── demux_1x16_fun.v
│   │   │   ├── demux_1x16_fun_tb.v
│   │   │   ├── demux_1x16_tasks.v
│   │   │   └── demux_1x16_tasks_tb.v
│   │   ├── 2x8 Decoder/
│   │   │   ├── decoder_2x4_fun.v
│   │   │   ├── decoder_2x4_fun_tb.v
│   │   │   ├── decoder_2x4_tasks.v
│   │   │   └── decoder_2x4_tasks_tb.v
│   │   ├── 3x8 Decoder/
│   │   │   ├── decoder_3x8_fun.v
│   │   │   ├── decoder_3x8_fun_tb.v
│   │   │   ├── decoder_3x8_tasks.v
│   │   │   └── decoder_3x8_tasks_tb.v
│   │   └── 8x3 Encoder/
│   │       ├── encoder_8x3_fun.v
│   │       ├── encoder_8x3_fun_tb.v
│   │       ├── encoder_8x3_tasks.v
│   │       └── encoder_8x3_tasks_tb.v
│   ├── multiplier/
│   │   ├── 4bit/
│   │   │   ├── array_multiplier_4bit.v
│   │   │   └── array_multiplier_4bit_tb.v
│   │   └── 8bit/
│   │       ├── array_multiplier_8bit.v
│   │       └── array_multiplier_8bit_tb.v
│   └── mux/
│       ├── 2x1/
│       │   └── mux_2x1_nbits.v
│       ├── 4x1/
│       │   ├── mux_4x1_nbits.v
│       │   └── mux_4x1_nbits_tb.v
│       ├── basic_gates/
│       │   ├── gates_using_2x1_mux.v
│       │   └── gates_using_2x1_mux_tb.v
│       └── Nx1/
│           ├── mux_generic_1bit.v
│           └── mux_generic_1bit_tb.v
├── Projects/
│   ├── src/
│   │   ├── fa_structural.v
│   │   ├── half_adder.v
│   │   └── step_forward_codec.v
│   ├── tb/
│   │   └── fa_structural_tb.v
│   └── vivado_proj/
│       └── auto_proj.sim/
│           └── sim_1/
│               └── behav/
│                   └── xsim/
│                       └── glbl.v
├── sequential/
│   ├── counters/
│   │   ├── asynchronous/
│   │   │   ├── down_counter/
│   │   │   │   ├── async_down_counter_nbit.v
│   │   │   │   └── async_down_counter_nbit_tb.v
│   │   │   ├── up_counter/
│   │   │   │   ├── async_up_counter_nbit.v
│   │   │   │   └── async_up_counter_nbit_tb.v
│   │   │   └── up_down/
│   │   │       ├── async_up_down_counter_nbit.v
│   │   │       └── async_up_down_counter_nbit_tb.v
│   │   └── synchronous/
│   │       ├── BCD_counter/
│   │       │   ├── BCD_counter_1digit.v
│   │       │   └── BCD_counter_1digit_tb.v
│   │       ├── johnson_counter/
│   │       │   ├── johnson_counter.v
│   │       │   └── johnson_counter_tb.v
│   │       ├── ring_counter/
│   │       │   ├── ring_counter.v
│   │       │   └── ring_counter_tb.v
│   │       └── up_down/
│   │           ├── sync_up_down_counter_3bit.v
│   │           └── sync_up_down_counter_3bit_tb.v
│   ├── latches_and_flipflops/
│   │   ├── compare_storage_elements/
│   │   │   ├── compare_storage_elements.v
│   │   │   ├── compare_storage_elements_tb.v
│   │   │   ├── D_FF_neg.v
│   │   │   ├── D_FF_pos.v
│   │   │   └── D_latch.v
│   │   ├── D_FF_reset/
│   │   │   ├── D_FF_reset.v
│   │   │   └── D_FF_reset_tb.v
│   │   └── T_FF/
│   │       ├── T_FF.v
│   │       ├── T_FF_async.v
│   │       ├── T_FF_async_tb.v
│   │       ├── T_FF_sync.v
│   │       └── T_FF_sync_tb.v
│   ├── mealy_and_moore_FSM/
│   │   ├── mealy_FSM/
│   │   │   └── detector/
│   │   │       ├── detector_101.v
│   │   │       └── detector_101_tb.v
│   │   ├── moore_FSM/
│   │   │   └── detector/
│   │   │       ├── detector_101.v
│   │   │       └── detector_101_tb.v
│   │   └── submodule/
│   │       └── D_FF.v
│   └── registers/
│       ├── register_file/
│       │   └── 16bitsx16/
│       │       ├── register_file_16bitsx16.v
│       │       └── register_file_16bitsx16_tb.v
│       ├── shift_registers/
│       │   ├── bi_directional/
│       │   │   ├── bi_directional_register.v
│       │   │   └── bi_directional_register_tb.v
│       │   ├── PIPO/
│       │   │   ├── PIPO.v
│       │   │   └── PIPO_tb.v
│       │   ├── PISO/
│       │   │   ├── PISO.v
│       │   │   └── PISO_tb.v
│       │   ├── SIPO/
│       │   │   ├── SIPO.v
│       │   │   └── SIPO_tb.v
│       │   ├── SISO/
│       │   │   ├── SISO.v
│       │   │   └── SISO_tb.v
│       │   ├── submodeules/
│       │   │   ├── D_FF_asyn_reset.v
│       │   │   └── mux_generic_1bit.v
│       │   ├── univ_shift_register/
│       │   │   ├── univ_shift_register.v
│       │   │   └── univ_shift_register_tb.v
│       │   ├── shift_registers.v
│       │   └── shift_registers_load.v
│       ├── simple_registers/
│       │   ├── simple_register_load.v
│       │   └── simple_registers.v
│       ├── universal_shift_register/
│       │   ├── univ_shift_register.v
│       │   └── univ_shift_register_tb.v
│       └── D_FF_asyn_reset.v
└── snn_fpga/
    ├── RTL/
    │   ├── comparator_nbits.v
    │   ├── counter.v
    │   ├── if_neuron.v
    │   ├── pwm_enc.v
    │   └── roshan_enc.v
    ├── snn_fpga.sim/
    │   └── sim_1/
    │       └── behav/
    │           └── xsim/
    │               └── glbl.v
    └── TB/
        ├── counter_nbits_tb.v
        └── pwm_enc_tb.v
```
