import v1_parameter::*;

module v1_filter
(
  input wire                                              reset,
  input wire                                              clk,
//---------------------------------------------------------------------  
  input wire [SIZE_ADC_DATA-1:0]                          input_data,
//---------------------------------------------------------------------
  output reg signed [SIZE_FILTER_DATA-1:0]                output_data);
import v1_parameter::*; 

//---------------------------------------------------------------------
  reg signed [SIZE_ADC_DATA+6:0]                            signal_delay [N_v1 :0];
  reg signed [SIZE_ADC_DATA+6:0]                            dkl;
  reg signed [SIZE_ADC_DATA+6:0]                            dkl1;
  reg signed [SIZE_ADC_DATA+6:0]                            dkl2;
  reg signed [SIZE_ADC_DATA+6:0]                          p;
  reg signed [SIZE_ADC_DATA+6:0]                          p_1;
  reg signed [SIZE_ADC_DATA+6:0]                          Mdkl;
  reg signed [SIZE_ADC_DATA+6:0]                          r;
  reg signed [SIZE_ADC_DATA+6:0]                          s;
//----------------------------------------------------------------------
always @ (posedge clk or negedge reset)
	begin
		if (!reset)
		begin
		dkl                                           <= 0;
		dkl1                                          <= 0;
		dkl2                                          <= 0;
		p                                             <= 0;
		p_1                                             <= 0;
		Mdkl                                          <= 0;
		r                                             <= 0;
		s                                             <= 0;
		for (integer i = 0; i<=N_v1 ; i++)
			begin
				signal_delay[i]                       <= 0;
			end
		output_data                                   <= 0;
		end
				else
		begin
		signal_delay[0]                               <= input_data;
		for (integer i = 1; i<=N_v1 ; i++)
			begin
				signal_delay[i]                       <= signal_delay[i-1];
			end
// dkl(n) = (v(n)   - v(n-k)) - (v(n-l) - v(n-k-l))
// p(n) = p(n-1) + dkl(n), n<=0
// r(n) = p(n)   + M*dkl(n)
// s(n) = s(n-1) + r(n),   n<=0
// M = 1/(exp(Tclk/tau) - 1)
		dkl                                           <= signal_delay[0] - signal_delay[K_v1 ];
		dkl1                                          <= signal_delay[L_v1 ] - signal_delay[K_v1 + L_v1 ];
		dkl2                                          <= dkl - dkl1; 
		p                                             <= p + dkl2;
		Mdkl                                          <= M_v1  * dkl2;
	    p_1                                           <= p;
		r                                             <= p_1 + Mdkl;
		s                                             <= s + r;
//		s_shift                                       <= s >>> 7;
//		s_round                                       <= s_shift +1//s_shift;
		output_data                                   <= s >>> 7; //s_round;
		
		
		end  
	end 
endmodule 