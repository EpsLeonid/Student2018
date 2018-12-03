import v2_param::*;
module v2_filter(clk,reset,in,out);
input wire[V2_WIDTH-1:0]			in;
output reg[V2_WIDTH-1:0]         	out;
//
input wire            			reset;
input wire               		clk;
//
//zadanie 3: filter
logic [V2_WIDTH-1:0] sig[V2_k+V2_l-1:0] = '{default:0};
	logic [V2_WIDTH-1:0] d = 0, m = 0, p = 0, r = 0, s = 0;

	always_ff @(posedge clk) 
	begin
		if (reset) 
		begin
			d <= in - sig[V2_l] - sig[V2_k] + sig[0];
			p <= d + p;
			m <= V2_M * d;
			r <= p + m;
			s <= s + r;
for (integer i = 0; i < V2_k+V2_l; i++) 
			begin
				sig[i] <= i == (V2_k+V2_l-1) ? in : sig[i+1];
			end
		end
		else 
		begin
			d <= 0;
			p <= 0;
			m <= 0;
			r <= 0;
			s <= 0;

			for (integer i = 0; i < V2_k+V2_l; i++) 
			begin
				sig[i] <= 0;
			end
		end
	end

	assign out = s >>> 7;
endmodule
     