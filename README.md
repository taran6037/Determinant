# Single Cycle RISC-V Processor

This repository contains a hardware implementation of a single-cycle RISC-V processor, designed using Verilog/SystemVerilog HDL.

## Overview

The processor follows the classic RISC-V RV32I instruction set architecture and is implemented as a single-cycle design, meaning all operations (instruction fetch, decode, execute, memory access, and writeback) are completed in a single clock cycle.

The current implementation is optimized for educational purposes, demonstrating the fundamentals of processor architecture and RISC-V instruction execution.

## Architecture

The processor consists of the following key components:

- **Program Counter (PC)**: Stores the address of the current instruction
- **Instruction Memory**: Stores the program instructions
- **Register File**: 32 x 32-bit general-purpose registers
- **ALU (Arithmetic Logic Unit)**: Performs arithmetic and logical operations
- **Data Memory**: Stores data during program execution
- **Control Unit**: Generates control signals based on instruction opcode
- **Immediate Generator**: Generates immediate values from instructions

## Directory Structure

```
Single_Cycle_RISCV_Processor/
│
├── RTL/                                             # Register Transfer Level designs
│   ├── single_cycle_top.v                           # Top-level module integrating all components
│       ├── single_cycle_core.v                      # Core processor implementation
│           ├── Control_Unit_Top.v                   # Top-level control unit
│               ├── Control_Unit.v                   # Main control unit
│               ├── ALU_Control.v                    # ALU control logic
│           ├── Core_Datapath.v                      # Datapath implementation
│               ├── ALU_unit.v                       # ALU implementation
│               ├── Reg_File.v                       # Register file implementation
│               ├── ImmGen.v                         # Immediate value generator
│               ├── pc.v                             # Program counter
│               ├── pc_plus_4.v                      # PC increment logic
│               └── various MUXes and other utility modules
│       ├── Instruction_memory.v                     # Instruction memory
│       ├── Data_Memory.v                            # Data memory
│
├── TB/                     # Testbench
│   └── tb.v                # Main testbench file
│
├── MemFiles/               # Memory initialization files
│   ├── data_mem_init.mem   # Initial data memory values
│   └── determinant.mem     # Program to calculate matrix determinant
│
└── README.md               # This file
```

## Features

- Complete implementation of a single-cycle RISC-V processor
- Support for RV32I instruction set
- Parameterized design for easy modification
- Testing environment with pre-loaded programs
- Matrix determinant calculation demonstration program

## Sample Program

The processor comes with a pre-loaded program in the `MemFiles/determinant.mem` file that calculates the determinant of a 3x3 matrix. The matrix values are stored in data memory.

## Testing

The testbench (`TB/tb.v`) provides a simulation environment to verify the processor's functionality. It sets up the processor with the determinant calculation program and runs until completion.

To run the simulation:
1. Load the design in your HDL simulator (e.g., Vivado, ModelSim)
2. Compile all files
3. Run the simulation with the testbench as the top module
4. The calculated determinant will be displayed in the console output

## Implementation Details

The processor implements the following pipeline stages in a single clock cycle:

1. **Instruction Fetch**: PC provides the address to instruction memory
2. **Instruction Decode**: Control unit decodes the instruction and sets control signals
3. **Execute**: ALU performs the required operation
4. **Memory Access**: Data memory is accessed if needed
5. **Write Back**: Results are written back to the register file

## License

This project is provided for educational purposes.

## Author

Computer Organization Course Project
