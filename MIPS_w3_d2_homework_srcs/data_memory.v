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


module data_memory(input clk,input [31:0] address,input [31:0] write_data,input mem_write,output reg [31:0] read_data);
reg [31:0] mem[0:99];
initial
begin
$readmemb("ram_content.mem",mem);
end

always@(address)
begin
 read_data=mem[address];
end

always@(posedge clk)
begin
    if(mem_write)//read
        begin
            mem[address]=write_data;
            read_data=0;
        end
end
endmodule