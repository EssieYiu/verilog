`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/21 15:03:25
// Design Name: 
// Module Name: Single_Cycle_CPU
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


module Single_Cycle_CPU(
    input clk,
    input reset,
    output zero,
    output Extsel,
    output PCWre,
    output InsMemRW,
    output RegDst,
    output RegWre,
    output ALUSrcB,
    output PCSrc,
    output RD,
    output WR,
    output ALUOp,
    output DBDataSrc

    );
    wire new_PC,PC_result,PC_Adder_result,DB;
    wire [5:0] opcode;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] rs;
    wire [15:0] num;
    wire [31:0] Read_data1;
    wire [31:0] Read_data2;
    wire [4:0] Write_Reg; 
    wire [31:0] Extend_result;
    wire [31:0] Mux_Reg_result;
    wire [31:0] ALU_result;
    wire [31:0] Add_ALU_result;
    wire [31:0] Shift_result;
    wire [31:0] Data_Mem_result;
    wire [31:0] Ins_Mem_result;
    wire [31:0] Ins_text [0:31];
    assign opcode = Ins_Mem_result[31:26];
    assign rs = Ins_Mem_result[25:21];
    assign rt = Ins_Mem_result[20:16];
    assign rd = Ins_Mem_result[15:14];
    assign num = Ins_Mem_result[15:0];
    //$readmemb("text.txt",Ins_text);
    PC U0(
        .new_PC(new_PC),
        .clk(clk),
        .reset(reset),
        .PCWre(PCWre)
     );
     PC_adder U1(
        .PC_result(PC_result),
        .PC_Adder_result(PC_Adder_result)
     );
     Instruction_Mem U2(
        .cur_PC(PC_result),
        .InsMemRW(InsMemRW),
        //.rs(rs),
        //.rt(rt),
        //.rd(rd),
        //.num(num),
        //.opcode(opcode)
        .Ins_Mem_result(Ins_Mem_result)
     );
     Mux_Ins U3(
        .rt(rt),
        .rd(rd),
        .Reg_Dst(RegDst),
        .Write_Reg(Write_Reg)
     );
     Control_Unit U4(
        .opcode(opcode),
        .zero(zero),
        .Extsel(Extsel),
        .PCWre(PCWre),
        .InsMemRW(InsMemRW),
        .RegDst(RegDst),
        .RegWre(RegWre),
        .ALUOp(ALUOp),
        .PCSrc(PCSrc),
        .ALUSrcB(ALUSrcB),
        .RD(RD),
        .WR(WR),
        .DBDataSrc(DBDataSrc)
     );
     Register U5(
        .clk(clk),
        .rs(rs),
        .rt(rt),
        .Write_Reg(Write_Reg),
        .DB(DB),
        .Read_data1(Read_data1),
        .Read_data2(Read_data2)
     );
     Sign_Extend U6(
        .num(num),
        .ExtSel(Extsel),
        .Extend_result(Extend_result)
    );
    Mux_Reg U7(
        .Extend_result(Extend_result),
        .Read_data2(Read_data2),
        .ALUSrcB(ALUSrcB),
        .Mux_Reg_result(Mux_Reg_result)
    );
    ALU U8(
        .Read_data1(Read_data1),
        .Mux_Reg_result(Mux_Reg_result),
        .ALUOp(ALUOp),
        .zero(zero),
        .ALU_result(ALU_result)
   );
   Shift_Left U9(
        .Extend_result(Extend_result),
        .Shift_result(Shift_result)
   );        
   Add_ALU U10(
        .PC_Adder_result(PC_Adder_result),
        .Shift_result(Shift_result),
        .ADD_ALU_result(ADD_ALU_result)
   );
   Mux_Add U11(
        .Add_ALU_result(Add_ALU_result),
        .PC_Adder_result(PC_Adder_result),
        .new_PC(new_PC)
   );
   Data_Mem U12(
        .clk(clk),
        .ALU_result(ALU_result),
        .Read_data2(Read_data2),
        .RD(RD),
        .WR(WR),
        .Data_Mem_result(Data_Mem_result)
   );
   Mux_Data U13(
        .DBDataSrc(DBDataSrc),
        .ALU_result(ALU_result),
        .Data_Mem_result(Data_Mem_result),
        .DB(DB)
   );
endmodule
