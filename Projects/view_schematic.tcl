# view_schematic.tcl - usage: vivado -source view_schematic.tcl -tclargs <top_module>
set top_module [lindex $argv 0]
set proj_dir   "./vivado_proj"
set src_dir    "./src"
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

set constr_files [glob -nocomplain $constr_dir/*.xdc]
if {[llength $constr_files] > 0} {
    add_files -fileset constrs_1 $constr_files
}

set_property top $top_module [current_fileset]
update_compile_order -fileset sources_1

synth_design -rtl -name rtl_check_1 -mode out_of_context

start_gui