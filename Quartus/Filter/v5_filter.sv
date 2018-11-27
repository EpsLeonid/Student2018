import package_settings::*;

//-----------------------------------------------------------------------------
// dkl(n) = (v(n)   - v(n-k)) - (v(n-l) - v(n-k-l))
//   p(n) = p(n-1) + dkl(n), n<=0
//   r(n) = p(n)   + M*dkl(n)
//   s(n) = s(n-1) + r(n),   n<=0
//   M    = 1/(exp(Tclk/tau) - 1)
//-----------------------------------------------------------------------------
module v5_filter(
input wire 												clk,
input wire                            					reset,
input wire               [SIZE_ADC_DATA-1:0]              input_data,
//-----------------------------------------------------------------------------

output reg               [SIZE_FILTER_DATA-1:0]          output_data);
//-----------------------------------------------------------------------------
import parameter_v5::*;
//-----------------------------------------------------------------------------
reg signed               [SIZE_ADC_DATA*2+2:0]                             signal_delay [DELAY:0];
reg signed              [SIZE_ADC_DATA*2+2:0]                             dk;
reg signed        [SIZE_ADC_DATA*2+2:0]                             dl;
reg signed        [SIZE_ADC_DATA*2+2:0]                             dkl;
reg signed        [SIZE_ADC_DATA*2+2:0]               mdkl;
reg signed        [SIZE_ADC_DATA*2+2:0]                           p;
reg signed        [SIZE_ADC_DATA*2+2:0]                           p1;
reg signed        [SIZE_ADC_DATA*2+2:0]                         r;
reg signed        [SIZE_ADC_DATA*2+2:0]                         s;



always @ (posedge clk or negedge reset)
	begin
		if (!reset)
		begin
			dk                                              <= 0;
			dl                                              <= 0;
			dkl                                             <= 0;
			mdkl                                            <= 0;
			p                                               <= 0;
			p1                                              <= 0;
			r                                               <= 0;
			s                                               <= 0;	
//-----------------------------------------------------------------------------
			for (integer i = 0; i<=DELAY; i++)
			begin
				signal_delay[i]                            <= 0;
			end
			output_data                                    <= 0;
		end
		else
		begin
			signal_delay[0]                                <= input_data;
			for (integer i = 1; i<=DELAY; i++)
			begin
				signal_delay[i]                            <= signal_delay[i-1];
			end
			dk                                             <= signal_delay[0] - signal_delay[k];
			dl											   <= signal_delay[l] - signal_delay[k+l];
			dkl											   <= dk - dl;
			p                                              <= p + dkl;
			mdkl										   <= dkl * M;//M*dkl;
			r											   <= p + mdkl;
			s											   <= s + r;
			output_data                                    <= s >>> 7;
		end
	end	
endmodule
