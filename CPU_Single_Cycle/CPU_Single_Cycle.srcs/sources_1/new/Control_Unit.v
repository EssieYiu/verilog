`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 17:30:13
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
    input [5:0] ControlCode,
    input zero,Reset,
    output reg ExtSel,reg PCWre, reg InsMemRW, reg RegDst,reg RegWre,
    output reg ALUSrcB,reg PCSrc, reg RD,reg WR,reg DBDataSrc,
    output reg [2:0] ALUOp
    );
    always@(ControlCode or zero or Reset) begin
    if(Reset==1'b0)begin
    ExtSel<=1'bx;
    PCWre<=1'b1;
    InsMemRW<=1'b1;
    RegDst<=1'bx;
    RegWre<=1'b0;
    ALUSrcB<=1'bx;
    PCSrc<=1'bz;//
    RD<=1'b1;
    WR<=1'b1;
    ALUOp<=3'bxxx;
    DBDataSrc<=1'bx;
    end
    
    else begin
    case(ControlCode)
    //ËãÊõÔËËã
    6'b000000://addu
    begin
    ExtSel<=1'bx;
    PCWre<=1'b1;
    InsMemRW<=1'b1;
    RegDst<=1'b1;
    RegWre<=1'b1;
    ALUSrcB<=1'b0;
    PCSrc<=1'b0;
    RD<=1'b1;
    WR<=1'b1;
    ALUOp<=3'b000;
    DBDataSrc<=1'b0;
    end
    
    6'b000001://addiu
        begin
        ExtSel<=1'b0;
        PCWre<=1'b1;
        InsMemRW<=1'b1;
        RegDst<=1'b0;
        RegWre<=1'b1;
        ALUSrcB<=1'b1;
        PCSrc<=1'b0;
        RD<=1'b1;
        WR<=1'b1;
        ALUOp<=3'b000;
        DBDataSrc<=1'b0;
        end
    
     6'b000010://subu
        begin
        ExtSel<=1'bx;
        PCWre<=1'b1;
        InsMemRW<=1'b1;
        RegDst<=1'b1;
        RegWre<=1'b1;
        ALUSrcB<=1'b0;
        PCSrc<=1'b0;
        RD<=1'b1;
        WR<=1'b1;
        ALUOp<=3'b001;
        DBDataSrc<=1'b0;
        end
        //Âß¼­ÔËËã
        6'b010000://ori
           begin
           ExtSel<=1'b0;
           PCWre<=1'b1;
           InsMemRW<=1'b1;
           RegDst<=1'b0;
           RegWre<=1'b1;
           ALUSrcB<=1'b1;
           PCSrc<=1'b0;
           RD<=1'b1;
           WR<=1'b1;
           ALUOp<=3'b011;
           DBDataSrc<=1'b0;
           end
       6'b010001://and
          begin
          ExtSel<=1'bx;
          PCWre<=1'b1;
          InsMemRW<=1'b1;
          RegDst<=1'b1;
          RegWre<=1'b1;
          ALUSrcB<=1'b0;
          PCSrc<=1'b0;
          RD<=1'b1;
          WR<=1'b1;
          ALUOp<=3'b010;
          DBDataSrc<=1'b0;
          end
       6'b010010://or
          begin
          ExtSel<=1'bx;
          PCWre<=1'b1;
          InsMemRW<=1'b1;
          RegDst<=1'b1;
          RegWre<=1'b1;
          ALUSrcB<=1'b0;
          PCSrc<=1'b0;
          RD<=1'b1;
          WR<=1'b1;
          ALUOp<=3'b011;
          DBDataSrc<=1'b0;
          end  
      //´æ´¢Æ÷¶Á/Ð´ 
      6'b100110://sw
         begin
         ExtSel<=1'b1;
         PCWre<=1'b1;
         InsMemRW<=1'b1;
         RegDst<=1'b0;
         RegWre<=1'b0;
         ALUSrcB<=1'b1;
         PCSrc<=1'b0;
         RD<=1'b1;
         WR<=1'b0;
         ALUOp<=3'b000;//?xxx
         DBDataSrc<=1'b0;
         end   
      6'b100111://lw
         begin
         ExtSel<=1'b1;
         PCWre<=1'b1;
         InsMemRW<=1'b1;
         RegDst<=1'b0;
         RegWre<=1'b1;
         ALUSrcB<=1'b1;
         PCSrc<=1'b0;
         RD<=1'b0;
         WR<=1'b1;
         ALUOp<=3'b000;//?xxx
         DBDataSrc<=1'b1;
         end 
      //·ÖÖ§Ö¸Áî
      6'b110000://bne
        begin
        ExtSel<=1'b1;
        PCWre<=1'b1;
        InsMemRW<=1'b1;
        RegDst<=1'b0;
        RegWre<=1'b0;
        ALUSrcB<=1'b0;
        RD<=1'b1;
        WR<=1'b1;
        ALUOp<=3'b001;
        DBDataSrc<=1'b0;
        if(zero==1'b1)
           PCSrc<=1'b0;
        else
           PCSrc<=1'b1;
        end
     //Í£»úÖ¸Áî
     6'b111111:
        begin
        ExtSel<=1'bx;
        PCWre<=1'b0;
        InsMemRW<=1'b1;
        RegDst<=1'bx;
        RegWre<=1'b0;
        ALUSrcB<=1'bx;
        PCSrc<=1'bx;
        RD<=1'b1;
        WR<=1'b1;
        ALUOp<=3'bxxx;
        DBDataSrc<=1'bx;
        end
    endcase
    end
    end
endmodule
