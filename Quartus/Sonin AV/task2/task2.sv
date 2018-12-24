module task2 (d, clk, out);
	// d trigger
	input wire d, clk;
	output reg out;
	 
	always @(posedge clk)
		out = d;
endmodule 