param($DesignTop, $TbTop)
vivado -mode batch -source simulate.tcl -tclargs $DesignTop $TbTop 2>&1 | Tee-Object -FilePath vivado_sim.log