`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2025 12:46:27
// Design Name: 
// Module Name: Core_Datapath
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

module Core_Datapath(
    input         clk,
    input         reset,
    input         branch_top,
    input         RegWrite_top,
    input         ALUSrc_top,
    input         MemtoReg_top,
    input  [31:0] Memdata_top,
    input  [3:0]  control_top,
    input  [31:0] instruction_top,
    output [31:0] PC_top,
    output [31:0] address_top,Rd2_top
);

    // Internal wires
    wire [31:0] PCin_top;
    wire [31:0] NexttoPC_top;
    wire [31:0] ImmExt_top;
    wire [31:0] Sum_out_top;
    wire sel1_top;
    wire [31:0] Rd1_top;
    wire [31:0] mux2_top;
    wire zero_top;
    wire [31:0] WriteBack_top;

   pc PC(.clk(clk), .reset(reset), .PC_in(PCin_top), .PC_out(PC_top));
   
   pc_plus_4 PC_Adder(.fromPC(PC_top), .NexttoPC(NexttoPC_top));

   Adder Adder(.in_1(PC_top), .in_2(ImmExt_top), .Sum_out(Sum_out_top));

   AND_logic AND(.branch(branch_top), .zero(zero_top), .and_out(sel1_top));
   
   PC_Mux PC_Mux(.sel1(sel1_top), .A1(NexttoPC_top), .B1(Sum_out_top), .Mux1_out(PCin_top));

   Reg_File Reg_File(.clk(clk), .reset(reset), .RegWrite(RegWrite_top), 
        .Rs1(instruction_top[19:15]), 
        .Rs2(instruction_top[24:20]), 
        .Rd(instruction_top[11:7]), 
        .Write_data(WriteBack_top), 
        .read_data1(Rd1_top), 
        .read_data2(Rd2_top));
        
   ImmGen ImmGen(.Opcode(instruction_top[6:0]), .instruction(instruction_top), .ImmExt(ImmExt_top));

   ALU_Mux ALU_mux(.sel2(ALUSrc_top), .A2(Rd2_top), .B2(ImmExt_top), .Mux2_out(mux2_top));
   
   ALU_unit ALU(.A(Rd1_top), .B(mux2_top), .Control_in(control_top), .ALU_Result(address_top), .zero(zero_top));
   
   Result_Mux Result_Mux(.sel3(MemtoReg_top), .A3(address_top), .B3(Memdata_top), .Mux3_out(WriteBack_top));
   
endmodule