import package_settings::*;
module v2_filter (
input wire 								clk,
input wire                      		reset,
input wire [SIZE_ADC_DATA-1:0]  		input_data,
output reg [SIZE_FILTER_DATA-1:0]   	output_data);

import v2_parameter::*;

reg signed    [SIZE_ADC_DATA*2+2:0]                         delay [DELAY:0];
reg signed    [SIZE_ADC_DATA*2+2:0]                         vD1;
reg signed    [SIZE_ADC_DATA*2+2:0]                         vD2;
reg signed    [SIZE_ADC_DATA*2+2:0]                         vL;
reg signed    [SIZE_ADC_DATA*2+2:0]                         vMD;
reg signed    [SIZE_ADC_DATA*2+2:0]                         vp;
reg signed    [SIZE_ADC_DATA*2+2:0]                         vr;
reg signed    [SIZE_ADC_DATA*2+2:0]                         vs;

//filter 3					
always @ (posedge clk or negedge reset)
	begin
		if (!reset)
		begin
			vD1                                           	<= 0;
			vD2                                           	<= 0;
			vL                                            	<= 0;
			vMD                                           	<= 0;
			vp                                              <= 0;
			vr                                              <= 0;
			vs                                              <= 0;	
//cycle
			for (integer i = 0; i<=DELAY; i++)
			begin
			delay[i]         		<= 0;
			end
			output_data             <= 0;
		end
		else
		begin
			delay[0]         		<= input_data;
			for (integer i = 1; i<=DELAY; i++)
			begin
			delay[i]         		<= delay[i-1];
			end
			vD1                   	<= delay[0] - delay[Vk];
			vD2						<= delay[Vl] - delay[Vk+Vl];
			vL						<= vD1-vD2;
			vp                      <= vp + vL;
			vMD  					<= vL * VM;
			vr						<= vp+vMD;
			vs						<= vs+vr;
			output_data             <= vs >>> 7;
		end
	end	
endmodule
	
	