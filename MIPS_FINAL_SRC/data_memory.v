`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 12:39:17
// Design Name: 
// Module Name: data_memory
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


module data_memory(input clk,input [31:0] address,input [31:0] write_data,input mem_write,output  [31:0] read_data,input [11:0] in_debug,output [11:0] out_debug);
reg [31:0] mem[0:256];
initial
    begin
        $readmemb("ram_content.mem",mem);
    end

assign read_data=mem[address];
assign out_debug=(address>=239 && address<240)?mem[address][11:0]:0;

always@(posedge clk)
begin
    if(mem_write)
        begin
            if(address>=255 && address<256)
                mem[address]={20'b0,in_debug};
            else
                mem[address]=write_data;
            
        end
end
endmodule