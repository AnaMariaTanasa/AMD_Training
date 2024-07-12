`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 11:45:14
// Design Name: 
// Module Name: regn_pl
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


module regn_pl#(parameter n=32)(input clk,input pl,input [n-1:0] di,output reg [n-1:0] do);
always@(posedge clk)
begin
if(pl)
    do=di;
end
endmodule
