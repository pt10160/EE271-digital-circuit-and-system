// This file is:
// The top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input				CLOCK_50; // 50MHz clock
 	output	[6:0]		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output	[9:0]		LEDR;
	input 	[3:0] 		KEY;
	input   [9:0]		SW;


	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;

	// Generate clk off of CLOCK_50, whichClock picks rate.
	wire    [31:0] clk;
	parameter whichClock = 0;
	clock_divider cdiv (CLOCK_50, clk);

	reg L, R;
	reg [8:0] machineInput;
	LSDR randomNumber(.clk(clk[whichClock]), .reset(SW[9]), .out(machineInput));
	adder tenBit (.A(SW[8:0]), .B(machineInput), .carry(L));

	button button(.clk(clk[whichClock]), .reset(SW[9]), .button(KEY[0]), .out(R));
	playTugOfWar dut(.clk(clk[whichClock]), .reset(SW[9]), .L(L), .R(R), .LEDR(LEDR[9:1]),
					.display(HEX0) , .displayCyber(HEX3));
	
endmodule


module clock_divider (clock, divided_closcks);
	input clock;
	output reg [31:0] divided_closcks;
	
	initial
		divided_closcks = 0;
	
	always @(posedge clock)
		divided_closcks = divided_closcks + 1;
		
endmodule

module DE1_SoC_testbench();
	wire 	 [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire     [9:0] LEDR;
	reg      [3:0] KEY;
	reg      [9:0] SW;
	reg      CLOCK_50;
	
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial CLOCK_50 = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		CLOCK_50 = ~CLOCK_50;
	end 
	
	// Generate clk off of CLOCK_50, whichClock picks rate.
	wire    [31:0] clk;
	parameter whichClock = 0;
	clock_divider cdiv (CLOCK_50, clk);

	DE1_SoC dut (.CLOCK_50(clk[whichClock]), .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);
	
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin	
						      	@(posedge clk[0]);
		KEY[0] <= 1;			@(posedge clk[0]);
		SW[9]  <= 1; 		 	@(posedge clk[whichClock]);
		SW[9]  <= 0; 		 	@(posedge clk[whichClock]);
		SW[8:0]  <= 9'b11110111;			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 0;   		 	@(posedge clk[whichClock]);
		                    	@(posedge clk[whichClock]);
		KEY[0] <= 1;  			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 0;			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 1;  			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 0;			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 1;  			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 0;			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 1;  			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 0;			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);	
		KEY[0] <= 1;  			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 0;			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);	
		KEY[0] <= 1;  			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 0;			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 1;			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 0;			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 1;			@(posedge clk[whichClock]);
								@(posedge clk[whichClock]);
		KEY[0] <= 0; 			@(posedge clk[whichClock]);
		$stop;
	end
endmodule 