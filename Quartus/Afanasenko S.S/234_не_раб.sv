import V1_parameter::S;

module verilog 
// #(parameter S=8)
(
//----task2
  input wire                        a,
  input wire                        b,
//------------------------------------
  output wire                       c,

//----task3
  input wire                        d,
  input wire                      clk,
  input wire                    reset,
//------------------------------------
  output reg                      out,

//----task4
  input wire   [S-1:0]              A,
  input wire   [S-1:0]              B,
  input wire   [S-1:0]              C,
//------------------------------------
  output reg   [(S*2)-1:0]      DATA_OUT);
//------------------------------------
  reg          [(S*2)-1:0]              m;
  reg          [(S*2)-1:0]              n;
  reg          [(S*2)-1:0]              k;
  
//task2
  assign c =                       a * b;
//------------------------------------  

//task3
always @(negedge reset or posedge clk) 
begin: task3
 if (!reset)
  out                             <=0;
 else
  out                             <=d;
end
//------------------------------------

//task4
always @(negedge reset or posedge clk)
begin: task4
  if (!reset)
    begin
  DATA_OUT <=                       0;
  m <=                             0;
  n <=                              0;
  k <=                              0;
    end
 else
    begin
  m <=                            A*B;
  n <=                              C;
  k <=                              n; 
  DATA_OUT <=                     m+k;
    end 
end       
//------------------------------------
endmodule
 