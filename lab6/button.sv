// button module takes into one button long input and output only one pulse
module button (
	input clk,    // Clock
	input reset,  // Asynchronous reset active low
	input button,
	output reg out
);
	reg oldButton;
	parameter on = 1'b1, off = 1'b0;

	assign out = ~oldButton && button;

    // DFFs
    always @(posedge clk)
    	if (reset)
    	begin
			oldButton <= on;
		end
        else 
        begin 
        	oldButton <= button;
        end

endmodule

module button_testbench ();
	reg clk;
	reg reset;
	reg button;
	wire out;

	button dut (.clk, .reset, .button, .out);
	
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
									@(posedge clk);
		reset <= 1;					@(posedge clk);
		reset <= 0; button <= 0;   	@(posedge clk);
                           			@(posedge clk);
                           			@(posedge clk);
                           			@(posedge clk);
                    button <= 1;   	@(posedge clk);
                           			@(posedge clk);
                           			@(posedge clk);
                           			@(posedge clk);
                    button <= 0;    @(posedge clk);
                    				@(posedge clk);
                    button <= 1; 	@(posedge clk);
                    				@(posedge clk);
                    				@(posedge clk);
                    				@(posedge clk);
                    				@(posedge clk);
                   				 	@(posedge clk);
                    button <= 0; 	@(posedge clk);
                    				@(posedge clk);
	$stop;
	end

endmodule