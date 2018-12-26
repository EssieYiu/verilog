`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/18 17:17:46
// Design Name: 
// Module Name: CPU_Single_Cycle
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


module CPU_Single_Cycle(
    input clk,
    input Reset
    );
    wire [31:0] PCaddress, PC_cur, PC4, PCC, add_address,instruction;
    wire [31:0] data_back, read_data1, read_data2, extend_data;
    wire [31:0] ALU_A, ALU_B, ALU_result;
    wire [31:0] data_out;
    wire [15:0] imm_16;
    wire [5:0] control_code;
    wire [4:0] rs,rt,rd,WriteR;
    wire [2:0] ALU_op;
    wire InsMemRW,PCWre, ExtSel, RD, WR, DBDataSrc, ALUSrcB, PCSrc, RegDst,RegWre, zero;
 
    assign control_code = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign imm_16 = instruction[15:0];
    assign InsMemRW= 1'b1;//只涉及到读指令的操作
    assign PCC = (Reset==1'b0)? 32'b0:PCaddress;
    
    PC pc( .clk(clk), .PCWre(PCWre), .new_PC(PCC), .cur_PC(PC_cur));
    PC_Adder adder( .cur_PC(PC_cur), .PC_sequence(PC4));
    PC_Adder2 adder2( .PCadd4(PC4), .Shift(extend_data), .PC_jump(add_address));
    Register regfile( .RST(Reset), .clk(clk), .RegWre(RegWre), .ReadReg1(rs), .ReadReg2(rt), .WriteReg(WriteR), .WriteData(data_back),.ReadData1(ALU_A),.ReadData2(read_data2));
    Sign_Zero_Extend extend( .imm_in(imm_16) , .imm_out(extend_data), .ExtSel(ExtSel));
    ALU alu( .A(ALU_A), .B(ALU_B), .result(ALU_result), .ALUOp(ALU_op), .zero(zero));
    Mux_1 mux1( .RegDst(RegDst), .rt(rt), .rd(rd), .WriteReg(WriteR));
    Mux_2 mux2( .ReadData2(read_data2), .DataExtend(extend_data), .ALUSrcB(ALUSrcB), .B(ALU_B));
    Mux_3 mux3( .PCSrc(PCSrc), .PC_jump(add_address), .PC_sequence(PC4), .new_PC(PCaddress));
    Mux_4 mux4( .DataOut(data_out), .ALUResult(ALU_result), .DBDataSrc(DBDataSrc), .DB(data_back));
    Data_Memory dataMem( .clk(clk), .RD(RD), .WR(WR), .DAddr(ALU_result), .DataIn(read_data2), .DataOut(data_out));
    Instruction_Memory insMem( .RW(InsMemRW), .IAddr(PC_cur), .IDataOut(instruction));
    Control_Unit control( .ControlCode(control_code), .zero(zero), .Reset(Reset), .ExtSel(ExtSel), .PCWre(PCWre), .InsMemRW(InsMemRW), .RegDst(RegDst), .RegWre(RegWre), .ALUSrcB(ALUSrcB), .PCSrc(PCSrc), .RD(RD), .WR(WR), .DBDataSrc(DBDataSrc), .ALUOp(ALU_op));
endmodule
