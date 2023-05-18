module playField (
	input clk,    // Clock
	input resetField,
	input reset,  // Asynchronous reset active low
	input L, R,	  // Input signal
	output reg [8:0] LEDR
);
	reg [8:0] ns;
	// next state logic
	always @(*)
		if ((LEDR == 9'b100000000) | (LEDR == 9'b000000001))
			ns = LEDR;
		else if (R & ~L) 
			ns = LEDR >> 1;
		else if (L & ~R)  
			ns = LEDR << 1;
		else
			ns = LEDR;

	// DFFs
    always @(posedge clk)
    	if (reset | resetField)
            LEDR <= 9'b000010000;
        else 
        	LEDR <= ns;

endmodule

module playField_testbench ();
	reg 		clk, resetField reset, L, R;
	wire [8:0]  LEDR;

	playField field (.clk, .resetField, .reset, .L, .R, .LEDR);

	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial clk = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		clk = ~clk;
	end 

		initial begin	
									@(posedge clk);
		reset <= 1;					@(posedge clk);
		reset <= 0; L <= 0;	R <= 0;	@(posedge clk);
									@(posedge clk);
					L <= 1;			@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 1; R <= 1;	@(posedge clk);
					L <= 0;			@(posedge clk);
					L <= 1; R <= 0; @(posedge clk);
									@(posedge clk);
					L <= 0;			@(posedge clk);
									@(posedge clk);
					L <= 1;			@(posedge clk);
					L <= 0; 		@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 1;			@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 0; R <= 1;	@(posedge clk);
									@(posedge clk);
		resetField <= 1;			@(posedge clk);
		resetField <= 0; 	R <= 1; @(posedge clk);
					L <= 1;			@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 0; 		@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
							R <= 0; @(posedge clk);
									@(posedge clk);

		$stop;
	end

endmodule