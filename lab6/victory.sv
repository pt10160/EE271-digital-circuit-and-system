module victory (
	input clk,     // Clock
	input reset,   // Asynchronous reset active low
	input leftest, // the most left light ON or OFF
	input L,	   // signal that left button is pressed
	input rightest,// the most right light ON or OFF
	input R,       // signal that right button is pressed
	output reg resetField, // Output when anyone win the game
	output reg [6:0] display, displayCyber
);

	// 3-bit register to store the current winning times
	reg [2:0] ps, ns, psCyb, nsCyb;

	// states encoding
	parameter zero = 3'b000, seven = 3'b111;

	always @(*)
		if ((ps != seven) & (leftest & L & ~R))  begin
			// Human score +1
			resetField = 1'b1;
			ns = ps + 3'b001;
			nsCyb = psCyb;
		end
		else if ((psCyb != seven) & (rightest & R & ~L)) begin
			resetField = 1'b1;
			ns = ps;
			nsCyb = psCyb + 3'b001;
		end
		else if (ps == seven || psCyb == seven) begin
			resetField = 1'b1;
			ns = ps;
			nsCyb = psCyb;
		end
		else begin
			resetField = 1'b0;
			ns = ps;
			nsCyb = psCyb;
		end


	decoder human (.state(ps), .display(display));
	decoder cyber (.state(psCyb), .display(displayCyber));

	// DFFs
    always @(posedge clk)
    	if (reset) begin
            ps <= zero;
            psCyb <= zero;
       	end
        else begin
        	ps <= ns;
        	psCyb <= nsCyb;
        end

endmodule

module decoder (
	input [2:0] state,    // state encoding
	output reg [6:0] display // LED output
);
	// states encoding
	parameter zero = 3'b000, one = 3'b001, two = 3'b010, three = 3'b011, 
			four = 3'b100, five = 3'b101, six = 3'b110, seven = 3'b111;

	// output encoding
	reg [6:0] nil, ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN;
	assign nil  = 7'b1111111;
	assign ZERO = 7'b1000000;
	assign ONE  = 7'b1111001;
	assign TWO  = 7'b0100100;
	assign THREE= 7'b0110000;
	assign FOUR = 7'b0011001;
	assign FIVE = 7'b0010010;
	assign SIX  = 7'b0000010;
	assign SEVEN= 7'b1111000;

	always @(*)
		case (state)
			zero    : display = ZERO;
			one     : display = ONE;
			two     : display = TWO;
			three   : display = THREE;
			four    : display = FOUR;
			five    : display = FIVE;
			six     : display = SIX;
			seven   : display = SEVEN;
			default : display = nil;
		endcase

endmodule