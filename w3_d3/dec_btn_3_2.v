`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2024 12:27:17
// Design Name: 
// Module Name: dec_btn_3_2
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


module dec_btn_3_2(input bt0,input bt1,input bt2,output reg out1,output reg out0);
always@(bt0 or bt1 or bt2)
begin
case({bt0,bt1,bt2})
3'b000:{out1,out0}=2'b00;
3'b100:{out1,out0}=2'b01;
3'b010:{out1,out0}=2'b10;
3'b001:{out1,out0}=2'b11;
endcase
end
endmodule
