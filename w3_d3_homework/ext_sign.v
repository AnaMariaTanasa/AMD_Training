`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 12:43:11
// Design Name: 
// Module Name: ext_sign
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


module ext_sign(input [15:0] di,input extop,output [31:0] do);
assign do=(extop==1)?{{16{di[15]}},di}:{16'b0,di};
endmodule