`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2024 22:44:13
// Design Name: 
// Module Name: mux_struct
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module mux_behav(dia,dib,sel,do);
parameter n=4;
input [n-1:0] dia,dib;
input sel;
output reg [n-1:0] do;
always@(dia or dib or sel)
begin
    case(sel)
    1'b0 : do<=dia;
    1'b1: do<=dib;
    endcase
end
endmodule

module tb_mux_behav;
reg [3:0] diat,dibt;
reg selt;
wire [3:0] dioutt;
mux_behav #(4) mux1(diat,dibt,selt,dioutt);

initial 
begin
#0 diat=4'b0000;dibt=4'b1111;selt=1'b0;
#10 selt=1'b1;
#30 $finish;
end

endmodule