module wind (clk, reset, w, out);
input logic clk, reset; 
input logic [1:0] w;
output logic [2:0] out;
// State variables
enum { RL, LL, ML, SL } ps, ns;
// Next State logic

always_comb begin

case (ps)
RL: if (w == 2'b00) ns = SL;
else if (w == 2'b01) ns = ML;
else ns = LL;

LL: if (w == 2'b00) ns = SL;
else if (w == 2'b01) ns = RL;
else ns = ML;

ML: if (w == 2'b00) ns = SL;
else if (w == 2'b01) ns = LL;
else ns = RL;

SL: if (w == 2'b00) ns = ML;
else if (w == 2'b01) ns = RL;
else ns = LL;

endcase
end
	
// Output logic - could also be another always_comb block.

always_comb begin
case (ps)
RL: out = 3'b001;

LL: out = 3'b100;

ML: out = 3'b010;

SL: out = 3'b101;

endcase
end

// DFFs
always_ff @(posedge clk) begin
if (reset)
ps <= SL;
else
ps <= ns;
end
endmodule

module wind_testbench();
logic clk, reset;
logic [1:0] w;
logic [2:0]out;
wind dut (clk, reset, w, out);
// Set up a simulated clock.
parameter CLOCK_PERIOD=100;
initial begin
clk <= 0;
forever #(CLOCK_PERIOD/2) clk <= ~clk; // Forever toggle the clock
end
// Set up the inputs to the design. Each line is a clock cycle.
initial begin

@(posedge clk);

reset <= 1; @(posedge clk); // Always reset FSMs at start
reset <= 0; w <= 0; @(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
w <= 2'b01; @(posedge clk);
w <= 2'b00; @(posedge clk);
w <= 2'b11; @(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
w <= 0; @(posedge clk);
@(posedge clk);
$stop; // End the simulation.
end
endmodule