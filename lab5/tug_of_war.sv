module centerLight (clock, reset, L, R, NL, NR, lightOn);
	input logic clock, reset;
	// L is true when left key is pressed, R is true when the right key
	// is pressed, NL is true when the light on the left is on, and NR
	// is true when the light on the right is on.
	input logic L, R, NL, NR;
	// when lightOn is true, the center light should be on.
	output logic lightOn;
	// Your code goes here!!

	enum{on, off}ps,ns;

		always_comb begin
			case(ps)
						off: if(NL&R) ns = on;
							  else if(NR&L) ns = on;
							  else ns = off;
							  
						on:  if(R^L) ns = off;
							  else ns = on;
			endcase
		end
		
		always_comb begin
			case(ps)
						off: lightOn = 1'b0;
						on:  lightOn = 1'b1;
			endcase
		end
		
		
		
		always_ff @(posedge clock)begin
			if(reset) ps <= on;
			else ps <= ns;
			end
	
endmodule


module normalLight (clock, reset, L, R, NL, NR, lightOn);
input logic clock, reset;
// L is true when left key is pressed, R is true when the right key
// is pressed, NL is true when the light on the left is on, and NR
// is true when the light on the right is on.
input logic L, R, NL, NR;
// when lightOn is true, the normal light should be on.
output logic lightOn;
// Your code goes here!!

enum{on, off}ps,ns;

	always_comb begin
	case(ps)
				off: if(NL&R) ns = on;
					  else if(NR&L) ns = on;
					  else ns = off;
					  
				on:  if(R^L) ns = off;
					  else ns = on;
	endcase
	end
	
	always_comb begin
	case(ps)
				off: lightOn = 1'b0;
				on:  lightOn = 1'b1;
	endcase
	end
	
	
	
	always_ff @(posedge clock)begin
		if(reset) ps <= off;
		else ps <= ns;
	end
endmodule

//module userInput(clock,press,reset,set);
//
//	input logic clock, reset;
//	input logic press;
//
//	output logic set;
//
//	logic temp1, temp2;
//
//	always_ff @(posedge clock) begin
//		temp1 <= press;
//		temp2 <= temp1;
//	end
//	
//	
//	enum{on,off} ps,ns;
//	
//	always_comb begin
//		case(ps)
//			on:if(temp2) ns = on;
//				else	ns = off;
//				
//				
//			off:if(temp2) ns = on;
//					else	ns = off;
//				
//		endcase
//	end 
//	
//	always_comb begin
//	
//		case(ps)
//			on: set = 1;
//			off: set = 0;
//			hold: set = 0;
//		endcase
//		
//	end
//	
//	always_ff @(posedge clock)
//		if(reset) ps <= off;
//		else ps <= ns;
//		
//		
//endmodule

module userInput(clock, reset, pressed, set);
	input logic clock, reset, pressed;
	output logic set;
	
	enum{ON, OFF, HOLD} ps, ns;

always_comb begin
	case(ps)
		ON:	if(pressed)ns = HOLD;
				
				else ns = OFF;
						
		OFF: 	if(pressed)ns = ON;
				
				else ns = OFF;
				
		HOLD: if(pressed)ns = HOLD;
				
				else ns = OFF;
				
	endcase
	end
	
	always_comb begin
	case(ps)
		ON: set = 1;
		OFF: set = 0;
		HOLD: set = 0;
	endcase
	
end

always_ff @(posedge clock)
		if (reset) 
			ps <= OFF;
		else
			ps <= ns;

endmodule

module hexdisplay(clock,reset,win1, win2,hexOut);
	
	input logic clock, reset;
	input logic win1, win2;
	
	output logic [6:0]hexOut;

	
	
	always_ff @(posedge clock) begin
		if(reset) hexOut = 7'b1111111;
		
			else if (win1) 
				hexOut = 7'b1111001;
				
				
			else if (win2) 
				hexOut = 7'b0100100;
				
				
//			else 
//				hexOut = 7'b1111111;
	end
	

	

	
endmodule

module checkWin(clock, reset,lm,rm,L,R,winner1,winner2);

input logic clock, reset;
input logic lm,rm,L,R;
output logic winner1,winner2;

	always_ff @(posedge clock) begin
		if(reset)begin
			winner1 = 0;
			winner2 = 0;
			end
		else
			if(lm & L & ~R)
				winner1 = 1;
			
			else if(rm & R & ~L)
				winner2 = 1;
				
			else begin
				winner1 = 0;
				winner2 = 0;
		end
	end	

endmodule
