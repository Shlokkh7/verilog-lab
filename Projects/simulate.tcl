# simulate.tcl - usage: vivado -mode batch -source simulate.tcl -tclargs <design_top> <tb_top>
set design_top [lindex $argv 0]
set tb_top     [lindex $argv 1]
set proj_dir   "./vivado_proj"
set src_dir    "./src"
set tb_dir     "./tb"
set constr_dir "./constraints"

if {![file exists $proj_dir/auto_proj.xpr]} {
    create_project auto_proj $proj_dir -part xc7z020clg484-1 -force
} else {
    open_project $proj_dir/auto_proj.xpr
}

remove_files [get_files] -quiet

set src_files [glob -nocomplain $src_dir/*.v $src_dir/*.sv]
if {[llength $src_files] > 0} {
    add_files $src_files
}

set tb_files [glob -nocomplain $tb_dir/*.v $tb_dir/*.sv]
if {[llength $tb_files] > 0} {
    add_files -fileset sim_1 $tb_files
}

set_property top $design_top [current_fileset]
set_property top $tb_top [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

launch_simulation
start_gui   