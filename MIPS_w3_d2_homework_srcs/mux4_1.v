`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2024 13:50:43
// Design Name: 
// Module Name: mux4_1
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


module mux4_1 #(parameter n=32)( input [n-1:0] di1,input [n-1:0] di2,input [n-1:0] di3,input [n-1:0] di4, input [1:0] sel,output reg [n-1:0] do);
always@(di1 or di2 or di3 or di4)
begin
case(sel)
2'b00:do=di1;
2'b01:do=di2;
2'b10:do=di3;
2'b11:do=di4;
//default:do=di1;
endcase
end
endmodule