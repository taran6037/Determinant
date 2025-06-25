`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2025 19:55:47
// Design Name: 
// Module Name: pc
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


module pc(clk, reset, PC_in, PC_out);

input clk, reset;
input      [31:0] PC_in;
output reg [31:0] PC_out;

always @(posedge clk or posedge reset)
begin
if(reset)
    PC_out <= 32'b0;
else
    PC_out <= PC_in;    
end

endmodule
