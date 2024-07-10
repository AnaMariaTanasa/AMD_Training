`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2024 12:45:53
// Design Name: 
// Module Name: rom
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


module rom(input clk,
           input en,
           output reg [31:0]out,
           output reg [7:0] cnt
           );
reg[31:0] mem[0:99];
always@(posedge clk)
begin
if(en)
begin
    if(cnt>=99)
       cnt=0;
     else
        cnt=cnt+1;
     out=mem[cnt];
end
end
endmodule


module tb_rom;
wire clkt;
wire ent;
wire [31:0]outt;
wire [31:0] memt[0:99];
wire[7:0] cntt;
rom rom_inst(.clk(clkt),.en(ent),.out(outt),.cnt(cntt));

endmodule;
