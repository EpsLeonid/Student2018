module task2 (d, clk, reset, out);
	// d trigger
	input wire d, clk, reset;
	output reg out;
	 
	always @(negedge reset or posedge clk)
	begin
		if (!reset)
			out <= 0;
		else
			out <= d;
	end
endmodule 