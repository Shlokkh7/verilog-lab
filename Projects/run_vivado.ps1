param($TopModule)
vivado -mode batch -source build.tcl -tclargs $TopModule 2>&1 | Tee-Object -FilePath vivado_build.log