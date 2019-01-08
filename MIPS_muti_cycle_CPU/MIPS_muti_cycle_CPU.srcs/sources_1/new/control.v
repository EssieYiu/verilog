`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 17:12:42
// Design Name: 
// Module Name: control
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

module control(
    input clk,rst,zero,
    input [5:0] opcode,
    output reg ExtSel,PCWre,InsMemRW,IRWre,WrRegData,RegWre,ALUSrcA,ALUSrcB,WR,RD,DBDataSrc,
    output reg [2:0] ALUOp,stateOut,
    output reg [1:0] RegDst,PCSrc
    );
    reg [2:0] state,nextstate;
    parameter [5:0] insAdd = 6'b000000,
                      insSub = 6'b000001,
                      insAddi = 6'b000010,
                      insOr = 6'b010000,
                      insAnd = 6'b010001,
                      insOri = 6'b010010,
                      insSll = 6'b011000,
                      insSlt = 6'b100110,
                      insSltu = 6'b100111,
                      insSw = 6'b110000,
                      insLw = 6'b110001,
                      insBeq = 6'b110100,
                      insBne = 6'b110101,
                      insJ = 6'b111000,
                      insJr = 6'b111001,
                      insJal = 6'b111010,
                      insHalt = 6'b111111;
    initial begin
        ExtSel = 1'bx;
        PCWre = 0;
        ALUSrcA = 1'bx;
        ALUSrcB = 1'bx;
        InsMemRW = 1'bx;
        WrRegData = 1'bx;
        RegWre = 1'bx;
        IRWre = 0;
        RegDst = 2'bxx;
        PCSrc = 2'bxx;
        RD = 1;
        WR = 1;
        ALUOp = 3'bxxx;
        state = 3'b000;
        stateOut = state;
        nextstate = 3'b001;
    end
    always @(posedge clk) begin
        if(rst == 0)
            state <= 3'b000;
        else
            state <= nextstate;
         stateOut = state;
    end
    always@(state or opcode) begin
        case(state)
            3'b000:begin
                nextstate <= 3'b001;
            end
            3'b001:begin
                if((opcode == insBeq )||(opcode == insBne))
                    nextstate = 3'b101;
                else if(opcode == insSw || opcode == insLw)
                    nextstate = 3'b010;
                else if(opcode == insJ || opcode == insJal ||opcode == insJr || opcode == insHalt)
                    nextstate = 3'b000;
                else if(opcode == insAdd || opcode == insSub || opcode == insAddi || opcode == insOr||opcode == insAnd||opcode== insOri||opcode == insSlt||opcode==insSltu||opcode == insSll)
                    nextstate = 3'b110;
            end
            3'b110:begin
                nextstate = 3'b111;
            end
            3'b101:begin
                nextstate = 3'b000;
            end
            3'b010:begin
                nextstate = 3'b011;
            end
            3'b011:begin
                if(opcode == insLw)
                    nextstate = 3'b100;
                else if(opcode == insSw)
                    nextstate = 3'b000;
            end
            3'b111:begin
                nextstate = 3'b000;
            end
            3'b100:begin
                nextstate = 3'b000;
            end
        endcase 
        end
        
    always@(state) begin
        //IRWre
        if(state == 3'b001) IRWre = 1;
        else IRWre = 0;
        //PCWre
        if(state == 3'b000 && opcode != insHalt)
            PCWre = 1;
        else
            PCWre = 0;
        //InsMemRW
        InsMemRW = 1;
        //ExtSel
        if(opcode == insAddi || opcode == insBeq || opcode == insBne || opcode == insSw || opcode == insLw) ExtSel = 1;
        else if(opcode == insOri) ExtSel = 0;
        //ALUSrcA
        //if(state == 3'b110 || state == 3'b101)begin
            if(opcode == insSll) ALUSrcA = 1'b1;
            else ALUSrcA = 1'b0;
        //end
       //ALUSrcB
        if(opcode == insAddi || opcode == insOri || opcode == insSw || opcode == insLw)
            ALUSrcB = 1'b1;
        else ALUSrcB = 1'b0;
        //WrRegData
        if(opcode == insJal) WrRegData = 0;
        else WrRegData = 1;   
        // RegWre
        if(stateOut == 3'b111 || stateOut == 3'b100 ||(opcode == insJal))
            RegWre = 1;
        else RegWre = 1'b0;
        //RegDst

        if(opcode == insJal && stateOut == 3'b001) RegDst = 2'b00;
        else if(opcode == insAdd || opcode == insSub || opcode == insOr || opcode == insAnd || opcode == insSlt || opcode == insSltu || opcode == insSll)
                RegDst = 2'b10;
        else if(opcode == insAddi || opcode == insOri || opcode == insLw) RegDst = 2'b01;
        else RegDst = 2'b11;

        //PCSrc
        case(opcode)
        insJ:PCSrc = 2'b11;
        insJal:PCSrc = 2'b11;
        insJr:PCSrc = 2'b10;
        insAdd:PCSrc = 2'b00;
        insSub:PCSrc = 2'b00;
        insAddi:PCSrc = 2'b00;
        insOr:PCSrc = 2'b00;
        insAnd:PCSrc = 2'b00;
        insOri:PCSrc = 2'b00;
        insSlt:PCSrc = 2'b00;
        insSltu:PCSrc = 2'b00;
        insSll:PCSrc = 2'b00;
        insBeq:begin
        if(zero == 0) begin PCSrc = 2'b00; end
        else if(zero == 1) begin PCSrc = 2'b01; end
        end
        insBne:begin
        if(zero == 0) begin PCSrc = 2'b01;end
        else if(zero == 1) begin PCSrc = 2'b00;end
        end
        insSw:PCSrc = 2'b00;
        insLw:PCSrc = 2'b00;
        endcase
        //RD
        if(stateOut == 3'b011 && opcode == insLw) RD = 0;
        else RD = 1;
        //WR
        if(stateOut == 3'b011 && opcode == insSw) WR = 0;
        else WR = 1;
        //ALUOp
        case(opcode)
            insAdd: ALUOp = 3'b000;
            insSub: ALUOp = 3'b001;
            insAddi: ALUOp = 3'b000;
            insOr: ALUOp = 3'b101;
            insAnd: ALUOp = 3'b110;
            insOri: ALUOp = 3'b101;
            insSlt: ALUOp = 3'b011;
            insSltu: ALUOp = 3'b010;
            insSll: ALUOp = 3'b100;
            insBne: ALUOp = 3'b001;
            insBeq: ALUOp = 3'b001;
            default:ALUOp =3'b000;
        endcase
        //DBDataSrc
        if(state == 3'b111) DBDataSrc = 0;
        else if(state == 3'b100) DBDataSrc = 1;
    end
endmodule
