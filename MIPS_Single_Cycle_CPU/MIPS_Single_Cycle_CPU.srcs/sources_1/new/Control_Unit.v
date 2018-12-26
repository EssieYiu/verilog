`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 16:33:18
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input [5:0] opcode,
    input zero,
    output reg ExtSel,
    output reg PCWre,
    output reg InsMemRW,
    output reg RegDst,
    output reg RegWre,
    output reg [2:0] ALUOp,
    output reg PCSrc,
    output reg ALUSrcB,
    output reg RD,
    output reg WR,
    output reg DBDataSrc
    );
    always @(opcode or zero) begin
        case(opcode)
        6'b000000:
        begin
            ExtSel = x;
            PCWre = 1;
            InstMemRW = 1;
            RegDst = 1;
            RegWre = 1;
            ALUSrcB = 0;
            PCSrc = 0;
            RD = 1;
            WR = 1;
            ALUOp = 3'b000;
            DBDataSrc = 0;
        end
        //addiu
        6'b000001:
        begin
            Extsel = 1;
            PCWre = 1;
            InsMemRW = 1;
            RegDst = 0;
            RegWre = 1;
            ALUSrcB = 1;
            PCSrc = 0;
            RD = 1;
            WR = 1;
            ALUOp = 3'b000;
            DBDataSrc = 0;       
        end
        //subu
        6'b000010:
        begin
            ExtSel = x;
            PCWre = 1;
            InsMemRW = 1;
            RegDst = 1;
            RegWre = 1;
            ALUSrcB = 0;
            PCSrc = 0;
            RD = 1;
            WR = 1;
            ALUOp = 3'b001;
            DBDataSrc = 0;       
        end
        //ori
        6'b010000:
        begin
            ExtSel = 0;
            PCWre = 1;
            InsMemRW = 1;
            RegDst = 0;
            RegWre = 1;
            ALUSrcB = 1;
            PCSrc = 0;
            RD = 0;
            WR = 0;
            ALUOp = 3'b011;
            DBDataSrc = 0;       
        end
        //and
        6'b010001:
        begin
            ExtSel = x;
            PCWre = 1;
            InsMemRW = 1;
            RegDst = 1;
            RegWre = 1;
            ALUSrcB = 0;
            PCSrc = 0;
            RD = 1;
            WR = 1;
            ALUOp = 3'b010;
            DBDataSrc = 0;       
        end
        //or
        6'b010010:
        begin
            ExtSel = x;
            PCWre = 1;
            InsMemRW = 1;
            RegDst = 1;
            RegWre = 1;
            ALUSrcB = 0;
            PCSrc = 0;
            RD = 1;
            WR = 1;
            ALUOp = 3'b011;
            DBDataSrc = 0;      
        end
        //sw
        6'b100110:
        begin
            ExtSel = 1;
            PCWre = 1;
            InsMemRW = 1;
            RegDst = x;
            RegWre = 0;
            ALUSrcB = 1;
            PCSrc = 0;
            RD = 1;
            WR = 0;
            ALUOp = 3'b000;
            DBDataSrc = x;       
        end
        //lw
        6'b100111:
        begin
            ExtSel = 1;
            PCWre = 1;
            InsMemRW = 1;
            RegDst = 0;
            RegWre = 1;
            ALUSrcB = 1;
            PCSrc = 0;
            RD = 0;
            WR = 1;
            ALUOp = 3'b000;
            DBDataSrc = 1;       
        end
        //bne
        6'b110000:
        begin
            if(zero == 0) begin
               PCSrc = 1;
            
            end else begin
               PCSrc = 0;
            end
            ExtSel = 1;
            PCWre = 1;
            InsMemRW = 1;
            RegDst = x;
            RegWre = 0;
            ALUSrcB = 0;
            RD = 1;
            WR = 1;
            ALUOp = 3'b001;
            DBDataSrc = x;       
        end
        //halt
        6'b111111:
        begin
            ExtSel = x;
            PCWre = 0;
            InsMemRW = 1;
            RegDst = x;
            RegWre = 0;
            ALUSrcB = x;
            PCSrc = x;
            RD = 1;
            WR = 1;
            ALUOp = 3'bxxx;
            DBDataSrc = x;   
        end
     endcase
      end
endmodule
