`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2024 11:45:14
// Design Name: 
// Module Name: cnt
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


module cnt(clk,do);
input clk;
output reg [1:0] do;
always@(posedge clk)
begin
    if(do<=2'b11)
        do<=do+1;
    else
        do<=2'b00;
end
endmodule

/*module tb_cnt;
reg clkt;
wire [1:0] dot;
cnt cnt_inst(clkt,dot);
initial 
begin
#0 clkt=1'b0;
forever #5 clkt=~clkt;
end

initial
begin
#50 $finish;
end
endmodule
*/