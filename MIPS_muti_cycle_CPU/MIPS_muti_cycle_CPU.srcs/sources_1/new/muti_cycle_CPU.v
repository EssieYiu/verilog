`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/19 14:30:27
// Design Name: 
// Module Name: muti_cycle_CPU
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


module muti_cycle_CPU(
    input clk,reset
    );
    wire [31:0] cur_PC,newPC,PC4,addr,instruction,ins;//ins means IRout
    wire [31:0] WriteData, ReadData1,ReadData2 ,A,B,ALUresult,DAddr;
    wire [31:0] extension,shift2,DataIn,DataOut,DB,reg31,addResult,ADROut,DBbefore;
    wire [15:0] immediate;
    wire [4:0] ReadReg1,ReadReg2,WriteReg,rs,rt,rd,sa;
    wire [25:0] in_addr;
    wire zero,ExtSel,PCWre,ALUSrcA,ALUSrcB,InsMemRW,WrRegData,RegWre,IRWre,RD,WR,DBDataSrc;
    wire [1:0] RegDst,PCSrc;
    wire [2:0] ALUOp,stateOut;
    wire [5:0] opcode;
    assign opcode = instruction[31:26];
    assign rs = ins[25:21];
    assign rt = ins[20:16];
    assign rd = ins[15:11];
    assign sa = ins[10:6];
    assign immediate = ins[15:0];
    assign ReadReg1 = rs;
    assign ReadReg2 = rt;
    assign in_addr = ins[25:0];
    PC PC(.clk(clk),.reset(reset),.PCWre(PCWre),.newPC(newPC),.cur_PC(cur_PC));
    PCadder PCadder(.cur_PC(cur_PC),.PC4(PC4));
    PCAddr PCaddress(.PC4(PC4),.in_addr(in_addr),.addr(addr));
    Instruction_Mem Instrcution_Mem(.cur_PC(cur_PC),.InsMemRW(InsMemRW),.instruction(instruction));
    IR IR(.instruction(instruction),.IRWre(IRWre),.clk(clk),.ins(ins));
    registerfile RegisterFile(.clk(clk),.ReadReg1(ReadReg1),.ReadReg2(ReadReg2),.WriteData(WriteData),.RegWre(RegWre),.ReadData1(ReadData1),.ReadData2(ReadData2),.WriteReg(WriteReg));
    ALU ALU(.A(A),.B(B),.ALUOp(ALUOp),.ALUresult(ALUresult),.zero(zero));
    AluAdder AluAdder(.operator1(PC4),.operator2(shift2),.addResult(addResult));
    Data_Mem Data_Mem(.DataIn(DataIn),.Daddr(DAddr),.RD(RD),.WR(WR),.DataOut(DataOut));
    extend extend(.ExtSel(ExtSel),.immediate(immediate),.extension(extension));
    shift shift(.extension(extension),.shift2(shift2));
    mux_WriteData mux_WData(.PC4(PC4),.DB(DB),.WriteData(WriteData),.WrRegData(WrRegData)); 
    mux_WReg mux_WReg(.rt(rt),.rd(rd),.RegDst(RegDst),.WriteReg(WriteReg));
    mux_A mux_A(.ADROut(ADROut),.sa(sa),.ALUSrcA(ALUSrcA),.A(A));
    mux_B mux_B(.DataIn(DataIn),.extension(extension),.ALUSrcB(ALUSrcB),.B(B));
    mux_PC mux_PC(.PC4(PC4),.adderResult(addResult),.ReadData1(ReadData1),.addr(addr),.PCSrc(PCSrc),.newPC(newPC));
    mux_DB mux_DB(.ALUresult(ALUresult),.DBDataSrc(DBDataSrc),.DataOut(DataOut),.DB(DBbefore));
    Data_late ADR(.clk(clk),.indata(ReadData1),.outdata(ADROut));
    Data_late BDR(.clk(clk),.indata(ReadData2),.outdata(DataIn));
    Data_late ALUoutDR(.clk(clk),.indata(ALUresult),.outdata(DAddr));
    Data_late DBDR(.clk(clk),.indata(DBbefore),.outdata(DB));
    control control(.clk(clk),.rst(reset),.zero(zero),.opcode(opcode),.ExtSel(ExtSel),
    .PCWre(PCWre),.InsMemRW(InsMemRW),.IRWre(IRWre),.WrRegData(WrRegData),.RegWre(RegWre),
    .ALUSrcA(ALUSrcA),.ALUSrcB(ALUSrcB),.WR(WR),.RD(RD),.DBDataSrc(DBDataSrc),
    .ALUOp(ALUOp),.stateOut(stateOut),.RegDst(RegDst),.PCSrc(PCSrc));
endmodule
