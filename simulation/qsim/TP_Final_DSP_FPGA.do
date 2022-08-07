onerror {exit -code 1}
vlib work
vcom -work work TP_Final_DSP_FPGA.vho
vcom -work work ADC_FIFO_SIMULATION.vwf.vht
vsim  -c -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.TP_Final_DSP_FPGA_vhd_vec_tst
vcd file -direction TP_Final_DSP_FPGA.msim.vcd
vcd add -internal TP_Final_DSP_FPGA_vhd_vec_tst/*
vcd add -internal TP_Final_DSP_FPGA_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
