# implement.tcl - usage: vivado -mode batch -source implement.tcl -tclargs <top_module>
set top_module [lindex $argv 0]
set proj_dir   "./vivado_proj"

file mkdir ./reports

if {![file exists $proj_dir/auto_proj.xpr]} {
    puts "ERROR: No project found. Run synthesis first."
    exit 1
}

open_project $proj_dir/auto_proj.xpr

# Load the post-synthesis checkpoint instead of re-synthesizing
open_checkpoint ./vivado_proj/post_synth.dcp

opt_design
place_design
route_design

report_utilization -file ./reports/utilization_impl.rpt
report_timing_summary -file ./reports/timing_impl.rpt

write_checkpoint -force ./vivado_proj/post_route.dcp
write_bitstream -force ./vivado_proj/${top_module}.bit

puts "===== IMPLEMENTATION COMPLETE ====="