set top_module [lindex $argv 0]
set proj_dir   "./vivado_proj"
set src_dir    "./src"
set tb_dir     "./tb"
set constr_dir "./constraints"

if {![file exists $proj_dir]} {
    create_project auto_proj $proj_dir -part YOUR_PART_NUMBER -force
} else {
    open_project $proj_dir/auto_proj.xpr
}

remove_files [get_files] -quiet
add_files [glob -nocomplain $src_dir/*.v $src_dir/*.sv]
add_files -fileset sim_1 [glob -nocomplain $tb_dir/*.v $tb_dir/*.sv]
add_files -fileset constrs_1 [glob -nocomplain $constr_dir/*.xdc]

set_property top $top_module [current_fileset]
update_compile_order -fileset sources_1

synth_design -rtl -name rtl_check_1 -mode out_of_context

puts "===== BUILD COMPLETE ====="