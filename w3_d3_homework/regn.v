`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 11:33:52
// Design Name: 
// Module Name: regn
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


module regn_npl#(parameter n=32)(input clk,input [n-1:0] di,output reg [n-1:0] do=0);

always@(posedge clk)
begin
do=di;
end
endmodule