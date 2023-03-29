module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
output logic [9:0] LEDR;
input logic [3:0] KEY;
input logic [9:0] SW;


//// Default values, turns off the HEX displays
//	assign HEX0 = 7'b1111111;//0
//	assign HEX1 = 7'b1111111;//0
//	assign HEX2 = 7'b1111111;//0
//	assign HEX3 = 7'b1111111;//0
//	assign HEX4 = 7'b1111111;//0
//	assign HEX5 = 7'b1111111;//0
	
	assign LEDR[0] = SW[8] | ( SW[7] & SW[9] );
	//B or AC due to a discount
	assign LEDR[3] = ~SW[0] & ~SW[8] & (SW[9] | ~SW[7]);
	//!B and either A or !C is valuable good and sw0 for the mark
	
	
always_comb begin
 if (~SW[9] & ~SW[8] & ~SW[7])//shoes
 begin
		HEX0 = 7'b1111111;
		HEX1 = 7'b0010010;
		HEX2 = 7'b0000110;
		HEX3 = 7'b1000000;
		HEX4 = 7'b0001001;
		HEX5 = 7'b0010010;
 end 
 else if (~SW[9] & ~SW[8] & SW[7])//jewery
 begin
		HEX0 = 7'b0010001;		
		HEX1 = 7'b0000110;
		HEX2 = 7'b0000110;
		HEX3 = 7'b1100011;
		HEX4 = 7'b0000110;
		HEX5 = 7'b1110000;
 end 
 else if (~SW[9] & SW[8] & ~SW[7])//ornam
 begin
		HEX0 = 7'b1111000;
		HEX1 = 7'b1001000;
		HEX2 = 7'b0001000;
		HEX3 = 7'b1001000;
		HEX4 = 7'b0001000;
		HEX5 = 7'b1000000;
 end
 else if (SW[9] & ~SW[8] & ~SW[7])//bssuit
 begin

		HEX0 = 7'b1001110;
		HEX1 = 7'b1001110;
		HEX2 = 7'b1000001;
		HEX3 = 7'b0010010;
		HEX4 = 7'b0010010;
		HEX5 = 7'b0000000;
		  	
 end
 else if (SW[9] & ~SW[8] & SW[7])//wtsuit
 begin
		HEX0 = 7'b1001110;
		HEX1 = 7'b1001110;
		HEX2 = 7'b1000001;
		HEX3 = 7'b0010010;
		HEX4 = 7'b1001110;
		HEX5 = 7'b1100010;
 end
 else if (SW[9] & SW[8] & SW[7])//socks
 begin
		HEX0 = 7'b1111111;
		HEX1 = 7'b0010010;
		HEX2 = 7'b0001001;
		HEX3 = 7'b1000110;
		HEX4 = 7'b1000000;
		HEX5 = 7'b0010010;
 end
 else 
 begin
		HEX0 = 7'b1111111;
		HEX1 = 7'b0001000;
		HEX2 = 7'b1000000;
		HEX3 = 7'b0001000;
		HEX4 = 7'b0001000;
		HEX5 = 7'b0000110;
 end
 end
	
endmodule


//testbench unfinished


module DE1_SoC_testbench();
	wire 	   [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire     [9:0] LEDR;
	reg      [3:0] KEY;
	reg      [9:0] SW;
	
	DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);
	
	// Try all combinations of inputs/
	integer i;
	initial	begin 
	
		SW[0] = 1'b0;	
		for (i = 0; i < 8; i++) begin
			SW[9:7] = i; #10;
		end

		SW[0] = 1'b1;	
		for (i = 0; i < 8; i++) begin
			SW[9:7] = i; #10;
		end
	end
endmodule 