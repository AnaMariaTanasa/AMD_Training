`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2024 22:44:13
// Design Name: 
// Module Name: mux_struct
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
module not_gate(di,do);
parameter gate_size=4;
input [gate_size-1:0] di;
output [gate_size-1:0] do;
assign di=~do;
endmodule

module and_gate(dia,dib,do);
parameter gate_size=4;
input [gate_size-1:0] dia,dib;
output [gate_size-1:0] do;
assign do=dia & dib;
endmodule

module or_gate(dia,dib,do);
parameter gate_size=4;
input [gate_size-1:0] dia,dib;
output [gate_size-1:0] do;
assign do= dia | dib;

module mux_struct(dia,dib,sel,diout);
parameter data_size=4;
input [data_size-1:0] dia,dib;
output [data_size-1:0] diout;
input sel;
wire _sel;
wire [data_size-1:0] a,b;
not_gate #(1) not1(sel,_sel);
and_gate #(data_size) and1(dia,_sel,a);
and_gate #(data_size)and2(dib,sel,b);
or_gate #(date_size)or1(a,b,diout);
endmodule

module tb_mux_struct;
reg [3:0] diat,dibt;
reg selt;
wire [3:0] diout;
mux_struct #(4) mux1(diat,dibt,selt,dioutt);

initial 
begin
#0 diat=4'b0000;dibt=4'b1111;selt=1'b0;
#10 selt=1'b1;
#30 $finish;
end

endmodule

