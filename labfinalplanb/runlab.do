# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.

vlog "./DE1_SoC.sv"

vlog "./LEDDriver.sv"
vlog "./LEDArray.sv"
vlog "./lightCtr.sv"
vlog "./laneRight.sv"
vlog "./laneLeft.sv"
vlog "./northSideWalk.sv"
vlog "./southSideWalk.sv"
vlog "./processInput.sv"
vlog "./gameEnd.sv"


# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work DE1_SoC_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do DE1_SoC_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
