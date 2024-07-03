`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2024 11:39:41
// Design Name: 
// Module Name: freq_div
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


module freq_div(clk,en,pl,di,do);
parameter n=16;
input clk,en,pl;
input [n-1:0] di;
output reg  do;
reg [n-1:0] cnt;
reg [n-1:0]reg_in;
//always@(en and (posedge clk))
always@(posedge clk or negedge clk)
begin
if(en)
begin
   if(pl)
        begin
        reg_in<=di;
        cnt<=1;
        do<=0;
        end
   else
         if(cnt>=reg_in)
            begin
                 do<=~do;
                 cnt<=1;
             end
          cnt=cnt+1;
end             
end
endmodule

module tb_div;
reg ent,clkt,plt;
reg [3:0] dit;
wire dot;
//module freq_div(clk,en,pl,di,do);
freq_div #(4)div(clkt,ent,plt,dit,dot);
initial 
begin
#0 clkt=1'b0;
forever #5 clkt=~clkt;
end
initial
begin
#0 dit=4'b0011;plt=1'b1;ent=1'b1;
#10 plt=1'b0;
#60 $finish;
end
endmodule;