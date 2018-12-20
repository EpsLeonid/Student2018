module v6_filter(clk, reset, input_data, output_data);

import v6_param::*;

input wire 						clk;
input wire  					reset;
input wire	[SIZE_IN-1:0]		input_data;
reg 		[SIZE_REG-1:0]		v [11:0];
reg 		[SIZE_REG-1:0]		dk;
reg 		[SIZE_REG-1:0]		dl;
reg 		[SIZE_REG-1:0]		dl_prom[5:0];
reg 		[SIZE_REG-1:0]		p;
reg 		[SIZE_REG-1:0]		p_delay;
reg 		[SIZE_REG-1:0]		q;
reg 		[SIZE_REG-1:0]		s;

output reg  [SIZE_OUT-1:0]  output_data;

always @ (posedge clk or negedge reset)
begin

	if (!reset)
	  begin
            v[0] <= 0;
      
      for (integer i = 1; i<=k; i++)
			begin
				 v[i] <=  v[i-1];
			end
	  dk <= 0;
	  dl <= 0;
	  dl_prom[0] <= 0; 
	  for (integer i = 1; i<=l; i++)
			begin
				 dl_prom[i] <=  0;
			end
	  p <= 0;
	  q <= 0;
	  s <= 0;
	  output_data <= 0;

      end
	else
      begin
      v[0] <= input_data;
      
      for (integer i = 1; i<=k; i++)
			begin
				 v[i] <=  v[i-1];
			end
	  dk <= v[0] + v[k-1];
	  dl <= v[0] + v[l-1];
	  dl_prom[0] <= dl; 
	  for (integer i = 1; i<=l; i++)
			begin
				 dl_prom[i] <=  dl_prom[i-1];
			end
	  p <= p + dk - k*dl_prom[l-1]; 
	  p_delay <= p;
	  q <= q + m2*p;
	  s <= s + q + m1*p_delay;
	  output_data <= s>>7;
      end
end

endmodule
