`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2025 23:53:30
// Design Name: 
// Module Name: Instruction_memory
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

module Instruction_Mem(read_address, instruction_out);

    input [31:0] read_address;
    output [31:0] instruction_out;

    reg [31:0] I_Mem[1023:0];

    initial begin
        $readmemh("determinant.mem", I_Mem);  // Load from .mem file
    end

    assign instruction_out = I_Mem[read_address[11:2]];
    
endmodule


