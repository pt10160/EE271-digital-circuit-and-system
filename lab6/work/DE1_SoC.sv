// This file is:
// The top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input					CLOCK_50; // 50MHz clock
 	output	[6:0]		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output	[9:0]		LEDR;
	input 	[3:0] 		KEY;
	input   [9:0]		SW;
	
	// Generate clk off of CLOCK_50, whichClock picks rate.
	wire    [31:0] clk;
	parameter whichClock = 1;
	clock_divider cdiv (CLOCK_50, clk);

	reg L, R;

	userInput dut ( .clk(clk[whichClock]), .reset(SW[9]), .leftButton(KEY[0]), .rightButton(KEY[3]), .L(L), .R(R));
	playTugOfWar dut(.clk(clk[whichClock]),  .reset(SW[9]), .L(L), .R(R), .LEDR(LEDR[9:1]), .display(HEX0));
	
 
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
	wire 	   [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire     [9:0] LEDR;
	reg      [3:0] KEY;
	reg      [9:0] SW;
	reg      CLOCK_50;
	
	DE1_SoC dut (.CLOCK_50, .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);
	
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial CLOCK_50 = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		CLOCK_50 = ~CLOCK_50;
	end 
	
	// Generate clk off of CLOCK_50, whichClock picks rate.
	wire    [31:0] clk;
	parameter whichClock = 25;
	clock_divider cdiv (CLOCK_50, clk);
	
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin	
									      	@(posedge clk);
											@(posedge clk);
		KEY[3] <= 0; 	KEY[0] <= 0;    	@(posedge clk[whichClock]);
		                           			@(posedge clk[whichClock]);
						KEY[0] <= 1;  		@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
						KEY[0] <= 0;		@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
						KEY[0] <= 1;		@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
						KEY[0] <= 0;		@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);									
						KEY[0] <= 1;	    @(posedge clk[whichClock]);
		                          			@(posedge clk[whichClock]);
						KEY[0] <= 0;		@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
						KEY[0] <= 1;		@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
						KEY[0] <= 0;		@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
						KEY[0] <= 1;		@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
						KEY[0] <= 0;   		@(posedge clk[whichClock]);
		                          			@(posedge clk[whichClock]);
						KEY[0] <= 1;		@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
						KEY[0] <= 0;		@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
						KEY[0] <= 1;		@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
		KEY[3] <= 1;	KEY[0] <= 0; 		@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
		KEY[3] <= 0;						@(posedge clk[whichClock]);
		KEY[3] <= 1;              			@(posedge clk[whichClock]);
		KEY[3] <= 0;						@(posedge clk[whichClock]);
		KEY[3] <= 1;              			@(posedge clk[whichClock]);
		KEY[3] <= 0;						@(posedge clk[whichClock]);
		KEY[3] <= 1;              			@(posedge clk[whichClock]);
		KEY[3] <= 0;						@(posedge clk[whichClock]);
		KEY[3] <= 1;              			@(posedge clk[whichClock]);
		KEY[3] <= 0;						@(posedge clk[whichClock]);
		KEY[3] <= 1;              			@(posedge clk[whichClock]);
		KEY[3] <= 0;						@(posedge clk[whichClock]);
		KEY[3] <= 1;              			@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
											@(posedge clk[whichClock]);
		$stop;
	end
endmodule 