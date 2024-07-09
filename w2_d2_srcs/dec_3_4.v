`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2024 12:33:08
// Design Name: 
// Module Name: dec_3_4
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


module dec_3_4(input [2:0]di,output reg [3:0]do);
always@(di)
begin
case(di)
3'b000:do<=4'b0001;
3'b001:do<=4'b0100;
3'b01x:do<=4'b1000;
3'b1xx:do<=4'b0010;
endcase
end
endmodule
