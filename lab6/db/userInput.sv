// userInput module take in two button signals and 
module userInput (
	input clk,    // Clock
	input reset,  // Asynchronous reset active low
	input leftButton,
	input rightButton,
	output reg L, 
	output reg R
);

	button Left (.clk, .reset, .button(leftButton) , .out(L));
	button Right(.clk, .reset, .button(rightButton), .out(R));

endmodule

module button (
	input clk,    // Clock
	input reset,  // Asynchronous reset active low
	input button,
	output reg out
);
	reg ns, oldButton;
	parameter on = 1'b1, off = 1'b0;

	always @(*)
		case (out)
			on:  
			begin
				ns = off;
			end 
			
			off:
			begin
				if(button == on & button != oldButton)
					ns = on;
				else
					ns = off;
			end
			default: ns = off;
		endcase

    // DFFs
    always @(posedge clk)
    	if (reset)
    	begin
			out <= off;
			oldButton <= off;
		end
        else 
        begin 
        	out <= ns;
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
		reset <= 0; button <= 1;   	@(posedge clk);
                           			@(posedge clk);
                           			@(posedge clk);
                           			@(posedge clk);
                    button <= 0;    @(posedge clk);
                    @(posedge clk);
                    button <= 1; @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    button <= 0; @(posedge clk);
                    @(posedge clk);
	$stop;
	end

endmodule