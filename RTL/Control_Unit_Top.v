`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2025 12:31:03
// Design Name: 
// Module Name: Control_Unit_Top
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

module Control_Unit_Top(
    input  [31:0] instruction_top, // Full 32-bit instruction
    output        branch_top,
    output        MemRead_top,
    output        MemtoReg_top,
    output        MemWrite_top,
    output        ALUSrc_top,
    output        RegWrite_top,
    output [3:0]  control_top
);

    wire [1:0] ALUOp_top;

    // Instantiate Control Unit
    Control_Unit Control_Unit(
        .instruction(instruction_top[6:0]), 
        .Branch(branch_top), 
        .MemRead(MemRead_top), 
        .MemtoReg(MemtoReg_top),
        .MemWrite(MemWrite_top), 
        .ALUSrc(ALUSrc_top), 
        .RegWrite(RegWrite_top),
        .ALUOp(ALUOp_top)
    );

    // Instantiate ALU Control Unit
    ALU_Control ALU_Control(
        .fun7(instruction_top[31:25]), 
        .fun3(instruction_top[14:12]), 
        .ALUOp(ALUOp_top), 
        .Control_out(control_top)
    );

endmodule

