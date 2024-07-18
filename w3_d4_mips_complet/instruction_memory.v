`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 11:48:40
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(input [31:0] address,output reg [31:0]out);
reg[7:0] mem[0:1023];

initial
begin
$readmemb("im_content.mem",mem);
end

always@(address)
begin
   out<={mem[address],mem[address+1],mem[address+2],mem[address+3]};
end

endmodule