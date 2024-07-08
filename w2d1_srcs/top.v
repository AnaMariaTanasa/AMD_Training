`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2024 11:11:31
// Design Name: 
// Module Name: dig_decoder
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


module dig_decoder(di,a,b,c,d,e,f,g);
input  [3:0] di;
output reg a,b,c,d,e,f,g;
always@(di)
begin
case(di)
    4'b0000:{a,b,c,d,e,f,g}=7'b1111110;
    4'b0001:{a,b,c,d,e,f,g}=7'b0110000;
    4'b0010:{a,b,c,d,e,f,g}=7'b1101101;
    4'b0011:{a,b,c,d,e,f,g}=7'b1111001;
    4'b0100:{a,b,c,d,e,f,g}=7'b0110011;
    4'b0101:{a,b,c,d,e,f,g}=7'b1011011;
    4'b0110:{a,b,c,d,e,f,g}=7'b0011111;
    4'b0111:{a,b,c,d,e,f,g}=7'b1110000;
    4'b1000:{a,b,c,d,e,f,g}=7'b1111111;
    4'b1001:{a,b,c,d,e,f,g}=7'b1110011;
    4'b1010:{a,b,c,d,e,f,g}=7'b1110111;
    4'b1011:{a,b,c,d,e,f,g}=7'b1111111;
    4'b1100:{a,b,c,d,e,f,g}=7'b1001110;
    4'b1101:{a,b,c,d,e,f,g}=7'b11110111;
    4'b1110:{a,b,c,d,e,f,g}=7'b1001111;
    4'b1111:{a,b,c,d,e,f,g}=7'b1000111;
    
endcase
{a,b,c,d,e,f,g}=~{a,b,c,d,e,f,g};
end
endmodule

module mux4_1(di1,di2,di3,di4,sel,do);
input [3:0] di1,di2,di3,di4;
input [1:0] sel;
output reg[3:0] do;
always@(di1 or di2 or di3 or di4 or sel)
begin
case(sel)
2'b00:do<=di1;
2'b01:do<=di2;
2'b10:do<=di3;
2'b11:do<=di4;
endcase
end
endmodule


module top(clk,di,a,b,c,d,e,f,g,A1,A2,A3,A4);
input clk;
input [15:0] di;
output  a,b,c,d,e,f,g,A1,A2,A3,A4;
wire [1:0] sel;
wire [3:0] dig_dec_di;
cnt cnt_inst(clk,sel);
//module mux4_1(di1,di2,di3,di4,sel,do);
mux4_1 mux_inst(di[15:12],di[11:8],di[7:4],di[3:0],sel,dig_dec_di);
//module dig_decoder(di,a,b,c,d,e,f,g);
dig_decoder dig_decoder_inst(dig_dec_di,a,b,c,d,e,f,g);
//module dec2_4(di,do);
dec2_4 dec2_4_inst(sel,{A1,A2,A3,A4});
endmodule



/*module tb_top;
reg clkt;
reg [15:0] dit;
wire  at,bt,ct,dt,et,ft,gt,A1t,A2t,A3t,A4t;
//module top(clk,di,a,b,c,d,e,f,g,A1,A2,A3,A4);
top top_inst(clkt,dit,at,bt,ct,dt,et,ft,gt,A1t,A2t,A3t,A4t);
initial 
begin
#0 clkt=1'b0;
forever #5 clkt=~clkt;
end

initial
begin
#0 dit=16'b1111000010101000;
#150 $finish;
end
endmodule

module tb_dec_dig;
reg [3:0] dit;
wire at,bt,ct,dt,et,ft,gt;
dig_decoder dec_inst(dit,at,bt,ct,dt,et,ft,gt);
initial
begin
#0 dit=4'b0000;
#10 dit=4'b0001;
#10 dit=4'b0010;
#10 dit=4'b0011;
#10 dit=4'b0100;
#10 dit=4'b0101;
#10 dit=4'b0110;
#10 dit=4'b0111;
#10 dit=4'b1000;
#10 dit=4'b1001;
#10 dit=4'b1010;
#10 dit=4'b1011;
#10 dit=4'b1100;
#10 dit=4'b1101;
#10 dit=4'b1110;
#10 dit=4'b1111;
#160 $finish;
end
endmodule
*/
