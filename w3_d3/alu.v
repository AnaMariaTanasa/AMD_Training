`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2024 12:15:09
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
