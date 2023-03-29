module DE1_SoC(CLOCK_50, KEY,HEX0,LEDR,SW, reset);
	input logic CLOCK_50,reset;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	output logic [9:0] LEDR;
	output logic [6:0] HEX0;
	
	assign LEDR[0] = 1'b0;
	
//	logic [31:0] div_clk;
//	parameter whichClock = 25;
//	clock_divider cdiv (.clock(CLOCK_50), .reset(reset), .divided_clocks(div_clk));
	
	
	logic right,left;
	logic winl,winr;

	userInput player1(.clock(CLOCK_50), .reset(SW[9]), .pressed(~KEY[0]), .set(right));
	userInput player2(.clock(CLOCK_50), .reset(SW[9]), .pressed(~KEY[3]), .set(left));
	
	normalLight n1(.clock(CLOCK_50), .reset(SW[9]), .L(left), .R(right), .NL(LEDR[2]), .NR(1'b0), .lightOn(LEDR[1]));
	normalLight n2(.clock(CLOCK_50), .reset(SW[9]), .L(left), .R(right), .NL(LEDR[3]), .NR(LEDR[1]), .lightOn(LEDR[2]));
	normalLight n3(.clock(CLOCK_50), .reset(SW[9]), .L(left), .R(right), .NL(LEDR[4]), .NR(LEDR[2]), .lightOn(LEDR[3]));
	normalLight n4(.clock(CLOCK_50), .reset(SW[9]), .L(left), .R(right), .NL(LEDR[5]), .NR(LEDR[3]), .lightOn(LEDR[4]));
	
	centerLight n5(.clock(CLOCK_50), .reset(SW[9]|winl|winr), .L(left), .R(right), .NL(LEDR[6]), .NR(LEDR[4]), .lightOn(LEDR[5]));
	
	normalLight n6(.clock(CLOCK_50), .reset(SW[9]), .L(left), .R(right), .NL(LEDR[7]), .NR(LEDR[5]), .lightOn(LEDR[6]));
	normalLight n7(.clock(CLOCK_50), .reset(SW[9]), .L(left), .R(right), .NL(LEDR[8]), .NR(LEDR[6]), .lightOn(LEDR[7]));
	normalLight n8(.clock(CLOCK_50), .reset(SW[9]), .L(left), .R(right), .NL(LEDR[9]), .NR(LEDR[7]), .lightOn(LEDR[8]));
	normalLight n9(.clock(CLOCK_50), .reset(SW[9]), .L(left), .R(right), .NL(1'b0), .NR(LEDR[8]), .lightOn(LEDR[9]));
	
	checkWin winnerIs(.clock(CLOCK_50), .reset(SW[9]),.lm(LEDR[9]),.rm(LEDR[1]),.L(left),.R(right),.winner1(winl),.winner2(winr));
	
	hexdisplay display(.clock(CLOCK_50),.reset(SW[9]),.win1(winl),.win2(winr),.hexOut(HEX0));
//	logic clkSelect;
//	assign clkSelect = CLOCK_50;
//	always_ff @(posedge clkSelect) begin
//
//		if (winl) 
//			HEX0 = 7'b1111001;
//		else if (winr)
//			HEX0 = 7'b0100100;
//
//		end


endmodule




//module DE1_SoC_testbench(); //CLOCK_50, KEY, SW, LEDR, HEX0
//	logic CLOCK_50;
//	logic [9:0] SW;
//	logic [3:0] KEY;
//	logic [9:0] LEDR;
//	logic [6:0] HEX0;
//	
//
//	//instantiating tugOfWarDriver
//	DE1_SoC dut (CLOCK_50, SW, LEDR, KEY, HEX0);
//	
////	initial CLOCK_50 = 1;
//	parameter CLOCK_PERIOD = 100;
//	
////	always begin
////			#(CLOCK_PERIOD/2);
////		CLOCK_50 = ~CLOCK_50;
////	end
//
//	initial begin 
//	CLOCK_50 <= 0;
//	forever #(CLOCK_PERIOD/2) CLOCK_50 = ~CLOCK_50;
//	end
//
//	
//	
//	initial begin			//only toggles with the player 1&2 keys 
//				SW[9] <= 1; @(posedge CLOCK_50);
//								@(posedge CLOCK_50);
//				SW[9] <= 0;	@(posedge CLOCK_50);
//								@(posedge CLOCK_50);
//								
//		SW[8:0] <= 9'b111000000; @(posedge CLOCK_50); 
//														
//		KEY[0] <= 1; 		@(posedge CLOCK_50); //checking scoreBoard for counter1
//		KEY[0] <= 0;		@(posedge CLOCK_50);
//		KEY[0] <= 1;		@(posedge CLOCK_50);	
//		KEY[0] <= 0;		@(posedge CLOCK_50);
//		KEY[0] <= 1;		@(posedge CLOCK_50);
//		KEY[0] <= 0;		@(posedge CLOCK_50);
//		KEY[0] <= 1;		@(posedge CLOCK_50);
//		KEY[0] <= 0;		@(posedge CLOCK_50);
//		KEY[0] <= 1;		@(posedge CLOCK_50);
//		KEY[0] <= 0;		@(posedge CLOCK_50);
//		KEY[0] <= 1;		@(posedge CLOCK_50);	//1
//		
//		
//		KEY[0] <= 1; 		@(posedge CLOCK_50);
//		KEY[0] <= 0;		@(posedge CLOCK_50);
//		KEY[0] <= 1;		@(posedge CLOCK_50);
//		KEY[0] <= 0;		@(posedge CLOCK_50);
//		KEY[0] <= 1;		@(posedge CLOCK_50);
//		KEY[0] <= 0;		@(posedge CLOCK_50);
//		KEY[0] <= 1;		@(posedge CLOCK_50);
//		KEY[0] <= 0;		@(posedge CLOCK_50);
//		KEY[0] <= 1;		@(posedge CLOCK_50);
//		KEY[0] <= 0;		@(posedge CLOCK_50);	// should restart game here!
//		KEY[0] <= 1;		@(posedge CLOCK_50); //7
//		
//								
//		SW[9] <= 1;			@(posedge CLOCK_50); //reset
//								@(posedge CLOCK_50);
//		SW[9] <= 0;			@(posedge CLOCK_50);
//								@(posedge CLOCK_50);
//								
//		KEY[3] <= 1; 		@(posedge CLOCK_50); //checking scoreBoard for counter2
//		KEY[3] <= 0;		@(posedge CLOCK_50);
//		KEY[3] <= 1;		@(posedge CLOCK_50);
//		KEY[3] <= 0;		@(posedge CLOCK_50);
//		KEY[3] <= 1;		@(posedge CLOCK_50);
//		KEY[3] <= 0;		@(posedge CLOCK_50);
//		KEY[3] <= 1;		@(posedge CLOCK_50);
//		KEY[3] <= 0;		@(posedge CLOCK_50);
//		KEY[3] <= 1;		@(posedge CLOCK_50);
//		KEY[3] <= 0;		@(posedge CLOCK_50);
//		KEY[3] <= 1;		@(posedge CLOCK_50);
//		
//								
//		SW[9] <= 1;			@(posedge CLOCK_50); //reset
//								@(posedge CLOCK_50);
//		SW[9] <= 0;			@(posedge CLOCK_50);
//								@(posedge CLOCK_50);
//	
//		$stop;
//	end

module DE1_SoC_testbench();
logic CLOCK_50;
logic [6:0] HEX0;
logic [9:0] LEDR;
logic [3:0] KEY;
logic [9:0] SW;
DE1_SoC dut (.CLOCK_50, .HEX0, .KEY, .LEDR, .SW);
// Set up a simulated clock.
parameter CLOCK_PERIOD=100;	
initial begin
CLOCK_50 <= 0;
forever #(CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50; // Forever toggle the clock
end
// Test the design.
initial begin
				SW[9] <= 1; @(posedge CLOCK_50);
								@(posedge CLOCK_50);
				SW[9] <= 0;	@(posedge CLOCK_50);
								@(posedge CLOCK_50);
								
		SW[8:0] <= 9'b111000000; @(posedge CLOCK_50); 

repeat(1) @(posedge CLOCK_50);

		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);	
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);	//1
		
		KEY[0] <= 1; 		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);	
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);	//2
		
		KEY[0] <= 1; 		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50); //3
		
		KEY[0] <= 1; 		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50); //4
		
		KEY[0] <= 1; 		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50); //5
		
		KEY[0] <= 1; 		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50); //6
		
		KEY[0] <= 1; 		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);	// should restart game here!
		KEY[0] <= 1;		@(posedge CLOCK_50); //7
		
		KEY[0] <= 1; 		@(posedge CLOCK_50); //another evaluation round...
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50); 
		
		KEY[0] <= 1; 		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 0;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		KEY[0] <= 1;		@(posedge CLOCK_50);
		
		SW[9] <= 1;			@(posedge CLOCK_50); //reset
								@(posedge CLOCK_50);
		SW[9] <= 0;			@(posedge CLOCK_50);
								@(posedge CLOCK_50);
								
		KEY[3] <= 1; 		@(posedge CLOCK_50); //checking scoreBoard for counter2
		KEY[3] <= 0;		@(posedge CLOCK_50);
		KEY[3] <= 1;		@(posedge CLOCK_50);
		KEY[3] <= 0;		@(posedge CLOCK_50);
		KEY[3] <= 1;		@(posedge CLOCK_50);
		KEY[3] <= 0;		@(posedge CLOCK_50);
		KEY[3] <= 1;		@(posedge CLOCK_50);
		KEY[3] <= 0;		@(posedge CLOCK_50);
		KEY[3] <= 1;		@(posedge CLOCK_50);
		KEY[3] <= 0;		@(posedge CLOCK_50);
		KEY[3] <= 1;		@(posedge CLOCK_50);
		
		KEY[3] <= 1; 		@(posedge CLOCK_50);
		KEY[3] <= 0;		@(posedge CLOCK_50);
		KEY[3] <= 1;		@(posedge CLOCK_50);
		KEY[3] <= 0;		@(posedge CLOCK_50);
		KEY[3] <= 1;		@(posedge CLOCK_50);
		KEY[3] <= 0;		@(posedge CLOCK_50);
		KEY[3] <= 1;		@(posedge CLOCK_50);
		KEY[3] <= 0;		@(posedge CLOCK_50);
		KEY[3] <= 1;		@(posedge CLOCK_50);
		KEY[3] <= 0;		@(posedge CLOCK_50);
		KEY[3] <= 1;		@(posedge CLOCK_50);
								
		SW[9] <= 1;			@(posedge CLOCK_50); //reset
								@(posedge CLOCK_50);
		SW[9] <= 0;			@(posedge CLOCK_50);
								@(posedge CLOCK_50);
	
		$stop;// End the simulation.

end

endmodule

