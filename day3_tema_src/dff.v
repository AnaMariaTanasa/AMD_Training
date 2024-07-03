`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2024 18:46:52
// Design Name: 
// Module Name: dff
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


module reg_pipo(clk,reset,pl,di,do);
input clk,reset,pl;
input [3:0] di;
output [3:0] do;
dff dff_1(clk,reset,pl,di[3],do[3]);
dff dff_2(clk,reset,pl,di[2],do[2]);
dff dff_3(clk,reset,pl,di[1],do[1]);
dff dff_4(clk,reset,pl,di[0],do[0]);
endmodule

module tb_reg_pipo;
reg clkt,resett,plt;
reg [3:0] dit;
wire [3:0] dot;
reg_pipo reg_pipo_inst(clkt,resett,plt,dit,dot);
initial
begin
#0 clkt=1'b0;
forever #5 clkt=~clkt;
end

initial
begin
#0 resett=1'b1;
#10 resett=1'b0;
#10 plt=1'b1;dit=4'b1001;
#10 plt=1'b0;
#40 $finish;
end
endmodule