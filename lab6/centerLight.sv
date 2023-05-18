module centerLight (
	input clk,    // Clock
	input reset,  // Asynchronous reset active low
	// L is true when left key is pressed, R is true when the right key
	// is pressed, NL is true when the light on the left is on, and NR
	// is true when the light on the right is on.
	input L,
	input R,
	input NL,
	input NR,
	// when lightOn is true, the center light should be on.
	output reg lightOn
);

	reg ns;
	// output lightOn;
	parameter on = 1'b1, off = 1'b0;

	// next state logic
	always @(*)
		case (lightOn)
			on: 	if (R & L | ~R & ~L) 
							ns = on;
					else    ns = off;
			off:	if (NL & R & ~L | NR & L & ~R)  
					  	 	ns = on;
			    	else 	ns = off;
			default : ns = 1'bx;
		endcase

    // DFFs
    always @(posedge clk)
    	if (reset)
            lightOn <= on;
        else 
        	lightOn <= ns;

endmodule

module normalLight (
	input clk,    // Clock
	input reset,  // Asynchronous reset active low
	// L is true when left key is pressed, R is true when the right key
	// is pressed, NL is true when the light on the left is on, and NR
	// is true when the light on the right is on.
	input L,
	input R,
	input NL,
	input NR,
	// when lightOn is true, the center light should be on.
	output reg lightOn
);
	reg ns;
	parameter on = 1'b1, off = 1'b0;

	// next state logic
	always @(*)
		case (lightOn)
			on: 	if (R & L | ~R & ~L) 
							ns = on;
					else    ns = off;
			off:	if (NL & R & ~L | NR & L & ~R)  
					  	 	ns = on;
			    	else 	ns = off;
			default : ns = 1'bx;
		endcase

    // DFFs
    always @(posedge clk)
    	if (reset)
            lightOn <= off;
        else 
        	lightOn <= ns;

endmodule