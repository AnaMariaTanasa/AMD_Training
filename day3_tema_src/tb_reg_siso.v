`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2024 18:57:33
// Design Name: 
// Module Name: tb_reg_siso
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
module dff(clk,reset,pl,di,do);
input clk,reset,pl,di;
output reg do;
always@(posedge clk)
begin
if(reset)
    do<=0;
 else
    if(pl)
        do<=di;
end
endmodule

module reg_siso(clk,reset,pl,di,do,di_dff2,di_dff3,di_dff4);
input  clk,reset,pl,di;
output do;
output  di_dff2,di_dff3,di_dff4;
dff dff_1(clk,reset,pl,di,di_dff2);
dff dff_2(clk,reset,pl,di_dff2,di_dff3);
dff dff_3(clk,reset,pl,di_dff3,di_dff4);
dff dff_4(clk,reset,pl,di_dff4,do);
endmodule
module tb_reg_siso;
reg clkt,resett,plt,dit;
wire dot;
wire di_dff2t,di_dff3t,di_dff4t;

reg_siso reg_siso_inst(clkt,resett,plt,dit,dot,di_dff2t,di_dff3t,di_dff4t);
initial 
begin
#0 clkt=1'b0;
forever #5 clkt=~clkt;
end

initial
begin
#0 resett=1'b1;
#10 resett=1'b0;
#20 plt=1'b1;dit=1;
#100 $finish;
end
endmodule
