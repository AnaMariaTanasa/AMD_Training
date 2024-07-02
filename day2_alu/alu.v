`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2024 11:39:30
// Design Name: 
// Module Name: alu
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


module alu(dia,dib,op,dout,err,zero,of);
parameter n_alu=4;
input [n_alu-1:0] dia,dib;
input [3:0] op;
output reg err,of,zero;
output reg [n_alu-1:0] dout;
always@* //(dia or dib or op)
begin
    err=0;// blocking assignments for flags
    of=0;
    zero=0;
    case(op)
    4'b0000: {of,dout}=dia+dib;
    4'b0001:{of,dout}=dia-dib;
    4'b0010:dout=dia<<dib;
    4'b0011:dout=dia>>dib;
    4'b0100:{zero,dout}={(dia==dib),{n_alu{1'bx}}};
    4'b0101:{zero,dout}={(dia>dib),{n_alu{1'bx}}};
    4'b0110:{zero,dout}={(dia<dib),{n_alu{1'bx}}};
    default: {err,dout}=5'b11111;
    endcase    
end
endmodule


module tb_alu;
reg [3:0] diat,dibt,opt;
wire errt,oft,zerot;
wire [3:0] doutt;
alu #(4) alu_inst(diat,dibt,opt,doutt,errt,zerot,oft);
initial
begin
#0 diat=4'b0010;dibt=4'b0010;opt=4'b0100; //testing logical operations, zero flag should be set accordingly, output data bus indifferent
#10 opt=4'b0101;//testing > and zero flag
#10 opt=4'b0110;// testing <
#10 opt=4'b1000;//testing err flag
#10 diat=4'b0100;dibt=4'b0101;opt=4'b0000;//testing sum without of
#10 diat=4'b1110;dibt=4'b0011;//testing of
#10 diat=4'b0100;dibt=4'b0101; opt=4'b0001;//testing diff with of
#10 dibt=4'b0001;//testing diff without of
#10 diat=4'b0010;dibt=4'b0001;opt=4'b0010;//testing shift << then >>
#10 opt=4'b0011;
#100 $finish;
end
endmodule