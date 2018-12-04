module v4_filter(clk,reset,input_data,output_data);

import v4_param::*;
/*
parameter k = 9;
parameter l = 5;
parameter M = 16;
parameter SIZE_IN = 17;
parameter SIZE_REG = 17;
parameter SIZE_OUT = 17;
*/

input wire 						clk;
input wire  					reset;
input wire	[SIZE_IN-1:0]		input_data;
reg 		[SIZE_REG-1:0]		v [14:0];
reg 		[SIZE_REG-1:0]		dkl;
reg 		[SIZE_REG-1:0]		p;
reg 		[SIZE_REG-1:0]		r;
reg 		[SIZE_REG-1:0]		s;


output reg  [SIZE_OUT-1:0]  output_data;
//output_data_v4

always @ (posedge clk or negedge reset)
begin

	if (!reset)
	  begin
      v[0] <= input_data;
      for (integer i = 0; i < k+l; i++) 
			begin
				v[i] <= 0;
			end
      dkl   <=0;
      p 	<=0;
      r		<=0;
      s		<=0;
      output_data <=0;
      end
	else
      begin
      v[0] <= input_data;
      for (integer i = 1; i<=k+l; i++)
			begin
				 v[i] <=  v[i-1];
			end	
	  dkl	<= v[0] -v[k] - v[l] + v[k+l];
	  p <= p + dkl;
      r <= p + dkl*M;
      s <= s + r; 
      output_data <= s;
      end
end

endmodule

//  vn_vnk   		<= v[0]-v[k]; 
	//  vnl_vnkl		<= v[l]-v[14];
	
	//  pn <= p + dkl*10;
    //  rn <=pn + pak_mdkl;//mdkl;
//vn_vnk-vnl_vnkl;	

/*
	  output_data <= s[5]+rn;	
	  */ 