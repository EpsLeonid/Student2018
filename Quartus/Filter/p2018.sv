import V2_param::*;
module p2018(clk,reset,in,out);
input wire[WIDTH-1:0]			in;
output reg[WIDTH-1:0]         		out;
//
input wire            			reset;
input wire               		clk;
//
//zadanie 3: filter
logic [WIDTH-1:0] sig[k+l-1:0] = '{default:0};
	logic [WIDTH-1:0] d = 0, m = 0, p = 0, r = 0, s = 0;

	always_ff @(posedge clk) 
	begin
		if (reset) 
		begin
			d <= in - sig[l] - sig[k] + sig[0];
			p <= d + p;
			m <= M * d;
			r <= p + m;
			s <= s + r;
for (integer i = 0; i < k+l; i++) 
			begin
				sig[i] <= i == (k+l-1) ? in : sig[i+1];
			end
		end
		else 
		begin
			d <= 0;
			p <= 0;
			m <= 0;
			r <= 0;
			s <= 0;

			for (integer i = 0; i < k+l; i++) 
			begin
				sig[i] <= 0;
			end
		end
	end

	assign out = s >>> 7;
endmodule
     