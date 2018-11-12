import parameters::N;

module task3 (A, B, C, clk, reset, data_result);
	
	input wire 						clk, reset;	
	input wire   	[N-1:0] 		A, B, C;
	output 			[(N*2)-1:0]		data_result;
	reg 			[(N*2)-1:0]		data_AB, data_C; 
	
	always @(negedge reset or posedge clk)
	begin
		if (!reset) begin
			data_result <= 0;
		end
		
		else begin 
			data_AB 	<= A * B;
			data_C 		<= C;
			data_result <= data_AB + data_C;
		end
	end
endmodule 
			