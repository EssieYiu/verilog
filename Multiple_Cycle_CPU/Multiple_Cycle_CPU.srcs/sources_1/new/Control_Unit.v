`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/10 19:34:04
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
    input CLK,RST,zero,
    input[5:0] ControlCode,
    output reg RD,reg WR,reg DBDataSrc,reg ALUSrcB,reg ALUSrcA,
    output reg[1:0] PCSrc,
    output reg[2:0] ALUOp,
    output reg RegWre,
    output reg[1:0]RegDst,
    output reg WrRegDSrc,reg IRWre,reg InsMemRW,reg PCWre,reg ExtSel
    );
    reg[2:0]state;//状态
    initial begin
        state=3'b000;
    end

    always@(negedge CLK)begin
        if(RST==1'b0)
            state<=3'b000;
        else if(state==3'b000)
            state<=3'b001;
        else begin
        case(ControlCode)
//-------------算术运算指令------------
        6'b000000://add
            begin
            case(state)
                3'b001:state<=3'b110;
                3'b110:state<=3'b111;
                3'b111:state<=3'b000;
            endcase
            end
         6'b000001://sub
           begin
           case(state)
               3'b001:state<=3'b110;
               3'b110:state<=3'b111;
               3'b111:state<=3'b000;
           endcase
           end
         6'b000010://addi
           begin
           case(state)
                 3'b001:state<=3'b110;
                 3'b110:state<=3'b111;
                 3'b111:state<=3'b000;
           endcase
           end      
//------------逻辑运算指令-------------
        6'b010000://or
          begin
          case(state)
               3'b001:state<=3'b110;
               3'b110:state<=3'b111;
               3'b111:state<=3'b000;
          endcase
          end
        6'b010001://and
          begin
          case(state)
               3'b001:state<=3'b110;
               3'b110:state<=3'b111;
               3'b111:state<=3'b000;
          endcase
          end
        6'b010010://ori
          begin
          case(state)
              3'b001:state<=3'b110;
              3'b110:state<=3'b111;
              3'b111:state<=3'b000;
          endcase
          end
//--------------移位指令--------------
        6'b011000://sll
          begin
          case(state)
              3'b001:state<=3'b110;
              3'b110:state<=3'b111;
              3'b111:state<=3'b000;
          endcase
          end
//-------------比较指令----------------
        6'b100110://slt
          begin
          case(state)
              3'b001:state<=3'b110;
              3'b110:state<=3'b111;
              3'b111:state<=3'b000;
          endcase
          end
        6'b100111://sltu
          begin
          case(state)
              3'b001:state<=3'b110;
              3'b110:state<=3'b111;
              3'b111:state<=3'b000;
          endcase
          end
 //----------比较指令--------------
        6'b110100://beq
            begin
            case(state)
                3'b001:state<=3'b101;
                3'b101:state<=3'b000;
            endcase
            end
            6'b110101://bne
                begin
                case(state)
                    3'b001:state<=3'b101;
                    3'b101:state<=3'b000;
                endcase
                end
            
//------------存储器读写---------------
         6'b110000://sw
         begin
         case(state)
             3'b001:state<=3'b010;
             3'b010:state<=3'b011;
             3'b011:state<=3'b000;
         endcase
         end
        6'b110001://lw
            begin
            case(state)
                3'b001:state<=3'b010;
                3'b010:state<=3'b011;
                3'b011:state<=3'b100;
                3'b100:state<=3'b000;
            endcase
            end
//----------------跳转指令---------------
        6'b111000://j
          begin
          case(state)
               3'b001:state<=3'b000;
          endcase
          end
         6'b111001://jr
            begin
            case(state)
                3'b001:state<=3'b000;
            endcase
            end
        6'b111010://jal
              begin
              case(state)
                   3'b001:state<=3'b000;
              endcase
              end
    endcase     
    end      
    end
//每一条指令根据不同状态设置控制信号
    always@(ControlCode or zero or state)begin
        InsMemRW<=1;
        if(state==3'b000)begin
            PCWre<=1;
            //InsMemRW<=1;
            IRWre<=1;
            RegWre<=0;
            RD<=1;
            WR<=1;
        end
        else begin
        case(ControlCode)
//------------算术运算指令-------------
          6'b000000:begin  
            RD<=1;
            WR<=1;
          case(state)
          3'b001:begin
              PCWre<=0;
              RegWre<=0;
              IRWre<=0;
              end
          3'b110:begin
              PCWre<=0;
              ALUSrcA<=0;
              ALUSrcB<=0;
              RegWre<=0;
              IRWre<=0;
              ALUOp<=3'b000;
              DBDataSrc<=0;
              end
          3'b111:begin
              PCWre<=0;
              RegWre<=1;
              WrRegDSrc<=1;
              IRWre<=0;
              PCSrc<=2'b00;
              RegDst<=2'b10;
              end
          endcase
      end    
          6'b000001:begin //sub
            RD<=1;
            WR<=1;
              case(state)
              3'b001:begin
                  PCWre<=0;
                  RegWre<=0;
                  IRWre<=0;
                  end
              3'b110:begin
                  PCWre<=0;
                  ALUSrcA<=0;
                  ALUSrcB<=0;
                  RegWre<=0;
                  IRWre<=0;
                  ALUOp<=3'b001;
                  DBDataSrc<=0;
                  end
              3'b111:begin
                  PCWre<=0;
                  RegWre<=1;
                  WrRegDSrc<=1;
                  IRWre<=0;
                  PCSrc<=2'b00;
                  RegDst<=2'b10;
                  end
              endcase
          end    
          6'b000010:begin //addi
           RD<=1;
           WR<=1;
              case(state)
              3'b001:begin
                  PCWre <= 0;
                  RegWre <= 0;
                  IRWre <= 0;
                  ExtSel <= 1;
                  end
              3'b110:begin
                  PCWre <= 0;
                  ALUSrcA <= 0;
                  ALUSrcB <= 1;
                  RegWre <= 0;
                  IRWre <= 0;
                  ALUOp <= 3'b000;
                  DBDataSrc <= 0;
                  end
              3'b111:begin
                  PCWre <= 0;
                  RegWre <= 1;
                  WrRegDSrc <= 1;
                  IRWre <= 0;
                  PCSrc <= 2'b00;
                  RegDst <= 2'b01;
                  end
              endcase
          end
//----------逻辑运算指令-----------
          6'b010001:begin //and
           RD<=1;
           WR<=1;
              case(state)
                  3'b001:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      end
                  3'b110:begin
                      PCWre <= 0;
                      ALUSrcA <= 0;
                      ALUSrcB <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      ALUOp <= 3'b110;
                      DBDataSrc<=0;
                      end
                  3'b111:begin
                      PCWre <= 0;
                      RegWre <= 1;
                      WrRegDSrc <= 1;
                      IRWre <= 0;
                      PCSrc <= 2'b00;
                      RegDst <= 2'b10;
                      end
                  endcase
          end
          6'b010010:begin //ori
           RD<=1;
           WR<=1;
              case(state)
                  3'b001:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      ExtSel <= 1;
                      end
                  3'b110:begin
                      PCWre <= 0;
                      ALUSrcA <= 0;
                      ALUSrcB <= 1;
                      RegWre <= 0;
                      IRWre <= 0;
                      ALUOp <= 3'b101;
                      DBDataSrc<=0;
                      end
                  3'b111:begin
                      PCWre <= 0;
                      RegWre <= 1;
                      WrRegDSrc <= 1;
                      IRWre <= 0;
                      PCSrc <= 2'b00;
                      RegDst <= 2'b01;
                      end
                  endcase
          end
           6'b010000:begin //or
            RD<=1;
            WR<=1;
               case(state)
                   3'b001:begin
                       PCWre <= 0;
                       RegWre <= 0;
                       IRWre <= 0;
                       ExtSel <= 0;
                       end
                   3'b110:begin
                       PCWre <= 0;
                       ALUSrcA <= 0;
                       ALUSrcB <= 0;
                       RegWre <= 0;
                       IRWre <= 0;
                       ALUOp <= 3'b101;
                       DBDataSrc<=0;
                       end
                   3'b111:begin
                       PCWre <= 0;
                       RegWre <= 1;
                       WrRegDSrc <= 1;
                       IRWre <= 0;
                       PCSrc <= 2'b00;
                       RegDst <= 2'b10;
                       end
                   endcase
                   end
//------------移位指令--------------
          6'b011000:begin //sll
           RD<=1;
           WR<=1;
              case(state)
                  3'b001:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      ExtSel <= 0;
                      end
                  3'b110:begin
                      PCWre <= 0;
                      ALUSrcA <= 1;
                      ALUSrcB <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      ALUOp <= 3'b100;
                      DBDataSrc<=0;
                      end
                  3'b111:begin
                      PCWre <= 0;
                      RegWre <= 1;
                      WrRegDSrc <= 1;
                      IRWre <= 0;
                      PCSrc <= 2'b00;
                      RegDst <= 2'b10;
                      end
                  endcase
          end
//--------------比较指令------------
          6'b100110:begin //slt
            RD<=1;
            WR<=1;
              case(state)
                  3'b001:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      end
                  3'b110:begin
                      PCWre <= 0;
                      ALUSrcA <= 0;
                      ALUSrcB <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      ALUOp <= 3'b011;
                      DBDataSrc<=0;
                      end
                  3'b111:begin
                      PCWre <= 0;
                      RegWre <= 1;
                      WrRegDSrc <= 1;
                      IRWre <= 0;
                      PCSrc <= 2'b00;
                      RegDst <= 2'b10;
                      end
                  endcase
          end
          6'b100111:begin //sltu
           RD<=1;
           WR<=1;
              case(state)
                  3'b001:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      end
                  3'b110:begin
                      PCWre <= 0;
                      ALUSrcA <= 0;
                      ALUSrcB <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      ALUOp <= 3'b010;
                      DBDataSrc<=0;
                      end
                  3'b111:begin
                      PCWre <= 0;
                      RegWre <= 1;
                      WrRegDSrc <= 1;
                      IRWre <= 0;
                      PCSrc <= 2'b00;
                      RegDst <= 2'b10;
                      end
                  endcase
          end
//------------分支指令-----------------
          6'b110100:begin //beq
            RD<=1;
            WR<=1;
              case(state)
                  3'b001:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      ExtSel <= 1;
                      end
                  3'b101:begin
                      PCWre <= 0;
                      ALUSrcA <= 0;
                      ALUSrcB <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      if (zero == 0)
                          PCSrc <= 2'b00;
                      else
                          PCSrc <= 2'b01;
                      ALUOp <= 3'b001;
                      end
                  endcase
          end
          6'b110101:begin //bne
            RD<=1;
            WR<=1;
              case(state)
                  3'b001:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      ExtSel <= 1;
                      end
                  3'b101:begin
                      PCWre <= 0;
                      ALUSrcA <= 0;
                      ALUSrcB <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      if (zero == 0)
                          PCSrc <= 2'b01;
                      else
                          PCSrc <= 2'b00;
                      ALUOp <= 3'b001;
                      end
                  endcase
          end
//------------存储器读写指令-------------
          6'b110000:begin //sw
              case(state)
                  3'b001:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      ExtSel <= 1;
                      RD <= 1;
                      WR <= 1;
                      end
                  3'b010:begin
                      PCWre <= 0;
                      ALUSrcA <= 0;
                      ALUSrcB <= 1;
                      RegWre <= 0;
                      IRWre <= 0;
                      ALUOp <= 3'b000;
                      RD <= 1;
                      WR <= 1;
                      end
                  3'b011:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      RD <= 1;
                      WR <= 0;
                      IRWre <= 0;
                      PCSrc <= 2'b00;
                      end
                  endcase
          end
          6'b110001:begin //lw
              case(state)
                  3'b001:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      ExtSel <= 1;
                      RD <= 1;
                      WR <= 1;
                      end
                  3'b010:begin
                      PCWre <= 0;
                      ALUSrcA <= 0;
                      ALUSrcB <= 1;
                      RegWre <= 0;
                      IRWre <= 0;
                      ALUOp <= 3'b000;
                      end
                  3'b011:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      RD <= 0;
                      WR <= 1;
                      IRWre <= 0;
                      DBDataSrc <= 1;
                      end
                  3'b100:begin
                      PCWre <= 0;
                      RegWre <= 1;
                      WrRegDSrc <= 1;
                      IRWre <= 0;
                      RegDst <= 2'b01;
                      PCSrc <= 2'b00;
                      RD <= 1;
                      WR <= 1;
                      end
                  endcase
          end
//--------------跳转指令-----------
          6'b111000:begin //j
            RD<=1;
            WR<=1;
              case(state)
                  3'b001:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      PCSrc <= 2'b11;
                      end
                  endcase
          end
          6'b111010:begin //jal
             RD<=1;
             WR<=1;
              case(state)
                  3'b001:begin
                      PCWre <= 0;
                      RegWre <= 1;
                      WrRegDSrc <= 0;
                      IRWre <= 0;
                      RegDst <=2'b00;
                      PCSrc <= 2'b11;
                      end
                  endcase
          end
          6'b111001:begin //jr
             RD<=1;
             WR<=1;
              case(state)
                  3'b001:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      RegDst<=2'b11;
                      PCSrc <= 2'b10;
                      end
                  endcase
          end
          6'b111111:begin //halt
              case(state)
                  3'b001:begin
                      PCWre <= 0;
                      RegWre <= 0;
                      IRWre <= 0;
                      end
                  endcase
          end
                  endcase
              end
          end                                                                                                                                                                                
endmodule


