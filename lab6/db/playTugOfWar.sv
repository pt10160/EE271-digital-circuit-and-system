module playTugOfWar (
	input clk,    // Clock
	input reset,  // Asynchronous reset active low
	input L,
	input R,
	output reg [8:0] LEDR,
	output reg [6:0] display, displayCyber
);

wire resetField;

playField field (.clk, .reset, .resetField, .L, .R, .LEDR);

victory vic (.clk, .reset, .leftest(LEDR[8]), .L, .rightest(LEDR[0]), .R, .resetField, .display, .displayCyber);

endmodule

module playTugOfWar_testbench();
	reg 		clk, reset, L, R;
	wire [8:0]  LEDR;
	wire [6:0]  display;
	
	playTugOfWar dut (.clk, .reset, .L, .R, .LEDR, .display);
	
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial clk = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		clk = ~clk;
	end 
	
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin	
									@(posedge clk);
		reset <= 1;					@(posedge clk);
		reset <= 0; L <= 0;	R <= 0;	@(posedge clk);
									@(posedge clk);
					L <= 1;			@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 1; R <= 1;	@(posedge clk);
									@(posedge clk);
					L <= 0;			@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 1; 		@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 0;			@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 0; R <= 1;	@(posedge clk);
									@(posedge clk);
					L <= 1;			@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 1; 		@(posedge clk);
									@(posedge clk);
							R <= 0; @(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
		$stop;
	end
endmodule