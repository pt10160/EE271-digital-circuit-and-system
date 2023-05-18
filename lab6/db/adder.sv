module adder (
	input [8:0] A, B,
	output reg carry
);
wire [8:0] sum;

always @(A or B) begin
	{carry, sum} = A + B;
end

endmodule
