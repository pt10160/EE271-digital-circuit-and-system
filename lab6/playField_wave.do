onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /playField_testbench/clk
add wave -noupdate /playField_testbench/resetField
add wave -noupdate /playField_testbench/reset
add wave -noupdate /playField_testbench/L
add wave -noupdate /playField_testbench/R
add wave -noupdate /playField_testbench/LEDR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2537 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 178
configure wave -valuecolwidth 94
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {3557 ps}
