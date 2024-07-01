`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AMD
// Engineer: Tanasa Ana-Maria
// 
// Create Date: 01.07.2024 11:36:18
// Design Name: Project Day 1
// Module Name: top
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

module adder_1(A,B,OUT,CY);
input A,B;
output OUT,CY;
assign OUT=A^B;
assign CY=A & B;
endmodule

module top(A,B,OUT,CY);
input A,B;
output OUT,CY;
adder_1 adder_inst(A,B,OUT,CY);
endmodule


module tb;
reg diat,dibt;
wire outt,cyt;
top top_inst(diat,dibt,outt,cyt);


initial
begin
#0 diat=1'b0;dibt=1'b0;
#10 diat=1'b0;dibt=1'b1;
#10 diat=1'b1;dibt=1'b0;
#10 diat=1'b1;dibt='b1;
#60 $finish;
end
endmodule
