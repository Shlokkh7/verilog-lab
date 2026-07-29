param($TopModule)

Get-Process vivado -ErrorAction SilentlyContinue | Stop-Process -Force

vivado -mode batch -source synthesize.tcl -tclargs $TopModule 2>&1 | Tee-Object -FilePath vivado_synth.log