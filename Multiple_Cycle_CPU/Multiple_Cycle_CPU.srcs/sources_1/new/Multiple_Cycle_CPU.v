`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 13:10:09
// Design Name: 
// Module Name: Multiple_Cycle_CPU
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


module Multiple_Cycle_CPU(
    input clk,Reset
    );
    wire [1:0] PCSrc;
    wire [1:0] RegDst;
    wire [2:0] ALUOp;
    wire RD,WR,DBDataSrc,ALUSrcB,ALUSrcA,RegWre,WrRegDSrc,IRWre,InsMemRW,PCWre,ExtSel,zero;
    wire [31:0] PCin,PCout,PC4,j_address,branch_address,jr_address;
    wire [31:0] insm,instruct,imm_32,ALU_A,ALU_B,alu_result,DB,DataBack,DataOut,RD1,RD2,WData,AfReg,BfReg,ALU_out;
    wire [4:0] rs,rt,rd,sa,writeR;
    wire [15:0] imm_16;
    wire [25:0] imm_26;
    wire [5:0] ControlCode;
    
    assign ControlCode=instruct[31:26];
    assign rs=instruct[25:21];
    assign rt=instruct[20:16];
    assign rd=instruct[15:11];
    assign sa=instruct[10:6];//sll÷∏¡Ó
    assign imm_16=instruct[15:0];
    assign imm_26=instruct[25:0];
    
    PC pc( .CLK(clk), .RST(Reset),.PCWre(PCWre), .new_pc(PCin), .cur_pc(PCout));
    Adder1 add1(.pc_cur(PCout),.pc_sequence(PC4));
    Adder2 add2(.imm(imm_32),.pc4(PC4),.pc_branch(branch_address));
    Mux5 mux5(.PCadd4(PC4),.PCbranch(branch_address),.PCjump(j_address),.PCjr(jr_address),.PCSrc(PCSrc),.PCnext(PCin));
    Instruction_Memory IM(.IAddr(PCout), .RW(InsMemRW), .IDataOut(insm));
    Instruction_Register IR(.CLK(clk),.IRWre(IRWre), .InsIn(insm), .InsOut(instruct));
    Mux1 m1(.rt(rt), .rd(rd),.RegDst(RegDst), .WriteReg(writeR));
    Sign_zero_extend extend(.imm_16(imm_16),.imm_32(imm_32),.ExtSel(ExtSel));
    J_extend Jextend(.addr(imm_26),.pc4(PC4),.pc_jump(j_address));
    Mux2 m2(.WrRegDSrc(WrRegDSrc),.PCadd4(PC4),.DBData(DB),.WriteData(WData));
    Register_File RegF(.CLK(clk),.RegWre(RegWre),.ReadReg1(rs),.ReadReg2(rt),.WriteReg(writeR),.ReadData1(RD1),.ReadData1(jr_address),.ReadData2(RD2),.WriteData(WData));
    ALU_A_Register ADR(.clk(clk),.RegData(RD1),.AData(AfReg));
    ALU_B_Register BDR(.clk(clk),.RegData(RD2),.BData(BfReg));
    Mux3 m3(.AfromReg(AfReg),.sa(sa),.ALUSrcA(ALUSrcA),.A(ALU_A));
    Mux4 m4(.BfromReg(BfReg),.imm_32(imm_32),.ALUSrcB(ALUSrcB),.B(ALU_B));
    ALU a_lu(.ALUOp(ALUOp),.A(ALU_A),.B(ALU_B),.zero(zero),.result(alu_result));
    ALUout_Register ALUoutDR(.ALU_result(alu_result), .ALUout(ALU_out));
    Data_Memory Memory(.DAddr(ALU_out),.RD(RD),.WR(WR),.DataIn(BfReg),.DataOut(DataOut));
    DataBack_Register DBDR(.clk(clk),.DataIn(DataBack),.DataOut(DB));
    Mux6 m6(.DBDataSrc(DBDataSrc),.ALU_result(alu_result),.Data(DataOut),.DataBack(DataBack));
    Control_Unit CU(.CLK(clk),.RST(Reset),.zero(zero),.ControlCode(ControlCode),.RD(RD),.WR(WR),.DBDataSrc(DBDataSrc),.ALUSrcB(ALUSrcB),.ALUSrcA(ALUSrcA),.PCSrc(PCSrc),.ALUOp(ALUOp),.RegWre(RegWre),
    .RegDst(RegDst),.WrRegDSrc(WrRegDSrc),.IRWre(IRWre),.InsMemRW(InsMemRW),.PCWre(PCWre),.ExtSel(ExtSel));
endmodule
