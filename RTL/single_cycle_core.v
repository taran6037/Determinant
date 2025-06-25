`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2025 12:11:10
// Design Name: 
// Module Name: single_cycle_core
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


module single_cycle_core(
    input  wire        clk, reset,
    input  wire [31:0] Instr,
    input  wire [31:0] ReadData,
    output wire [31:0] PC,
    output wire        MemWrite,MemRead,
    output wire [31:0] ALUResult, WriteData
);

    wire branch_top, MemtoReg_top, ALUSrc_top, RegWrite_top;
    wire [3:0] control_top;

    // Control Unit
    Control_Unit_Top control_unit_top(
        .instruction_top(Instr),
        .branch_top(branch_top),
        .MemRead_top(MemRead),
        .MemtoReg_top(MemtoReg_top),
        .MemWrite_top(MemWrite),
        .ALUSrc_top(ALUSrc_top),
        .RegWrite_top(RegWrite_top),
        .control_top(control_top)
    );

    // Datapath
    Core_Datapath core_datapath(
        .clk(clk),
        .reset(reset),
        .branch_top(branch_top),
        .RegWrite_top(RegWrite_top),
        .ALUSrc_top(ALUSrc_top),
        .MemtoReg_top(MemtoReg_top),
        .Memdata_top(ReadData),
        .control_top(control_top),
        .instruction_top(Instr),
        .PC_top(PC),
        .address_top(ALUResult),
        .Rd2_top(WriteData)
    );

endmodule

