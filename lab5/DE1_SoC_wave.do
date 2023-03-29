onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate {/DE1_SoC_testbench/LEDR[9]}
add wave -noupdate {/DE1_SoC_testbench/LEDR[8]}
add wave -noupdate {/DE1_SoC_testbench/LEDR[7]}
add wave -noupdate {/DE1_SoC_testbench/LEDR[6]}
add wave -noupdate {/DE1_SoC_testbench/LEDR[5]}
add wave -noupdate {/DE1_SoC_testbench/LEDR[4]}
add wave -noupdate {/DE1_SoC_testbench/LEDR[3]}
add wave -noupdate {/DE1_SoC_testbench/LEDR[2]}
add wave -noupdate {/DE1_SoC_testbench/LEDR[1]}
add wave -noupdate {/DE1_SoC_testbench/LEDR[0]}
add wave -noupdate /DE1_SoC_testbench/HEX0
add wave -noupdate {/DE1_SoC_testbench/KEY[3]}
add wave -noupdate {/DE1_SoC_testbench/KEY[0]}
add wave -noupdate /DE1_SoC_testbench/CLOCK_50
add wave -noupdate /DE1_SoC_testbench/CLOCK_PERIOD
add wave -noupdate /DE1_SoC_testbench/dut/n5/clock
add wave -noupdate /DE1_SoC_testbench/dut/n5/reset
add wave -noupdate {/DE1_SoC_testbench/SW[9]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11450 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 211
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {9299 ps} {13201 ps}
