import package_settings::*;
module v5_filter(
input wire 	clk,
input wire  reset,
input wire [SIZE_ADC_DATA-1:0] input_data,
//-----------------------------------------------------------------------------

output reg [SIZE_FILTER_DATA-1:0] output_data);
//-----------------------------------------------------------------------------
import v5_parameter::*;
//-----------------------------------------------------------------------------
reg signed [SIZE_ADC_DATA*2+2:0] inMem [DELAY:0];
reg signed [SIZE_ADC_DATA*2+2:0] BUF1;
reg signed [SIZE_ADC_DATA*2+2:0] BUF2;
reg signed [SIZE_ADC_DATA*2+2:0] SUMBUF;
reg signed [SIZE_ADC_DATA*2+2:0] MULTBUF;
reg signed [SIZE_ADC_DATA*2+2:0] p;
reg signed [SIZE_ADC_DATA*2+2:0] r;
reg signed [SIZE_ADC_DATA*2+2:0] s;



always @ (posedge clk or negedge reset)
begin
	if (!reset)
		begin
			BUF1 <= 0;
			BUF2 <= 0;
			SUMBUF <= 0;
			MULTBUF  <= 0;
			p <= 0;
			r <= 0;
			s <= 0;	
//-----------------------------------------------------------------------------
			for (integer i = 0; i<=DELAY; i++)
			begin
				inMem[i]<= 0;
			end
			output_data <= 0;
	end
	else
	begin
		inMem[0]<= input_data;
		for (integer i = 1; i<=DELAY; i++)
		begin
			inMem[i]<= inMem[i-1];
		end
		BUF1 <= inMem[0] - inMem[k];
		BUF2 <= inMem[l] - inMem[k+l];
		SUMBUF <= BUF1 - BUF2;
		p <= p + SUMBUF;
		MULTBUF	<= SUMBUF * M;
		r <= p + MULTBUF;
		s <= s + r;
		output_data <= s >>> 7;
	end
end	
endmodule
