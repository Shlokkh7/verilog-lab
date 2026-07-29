param($TopModule)

# Close any existing Vivado GUI process first
Get-Process vivado -ErrorAction SilentlyContinue | Stop-Process -Force

vivado -source view_schematic.tcl -tclargs $TopModule
