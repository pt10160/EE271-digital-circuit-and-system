module adder (
	input [8:0] A, B,
	output reg carry
);
reg [8:0] sum;

always @(A or B) begin
	{carry, sum} = A + B;
end

endmodule

module adder_testbench ();

	reg [8:0] A, B;
	wire carry;

	adder dut(.A, .B, .carry);

	initial begin
		A = 9'b100000000; B = 9'b000000001; #10;
		A = 9'b100000000; B = 9'b000000010; #10;
		A = 9'b100000000; B = 9'b000000100; #10;
		A = 9'b100000000; B = 9'b000001000; #10;
		A = 9'b100000000; B = 9'b000010000; #10;
		A = 9'b100000000; B = 9'b000100000; #10;
		A = 9'b100000000; B = 9'b001000000; #10;
		A = 9'b100000000; B = 9'b010000000; #10;
		A = 9'b100000000; B = 9'b100000000; #10;
		
	end

endmodule
