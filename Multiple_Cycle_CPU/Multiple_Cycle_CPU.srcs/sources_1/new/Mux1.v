`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/10 19:33:30
// Design Name: 
// Module Name: Mux1
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


module Mux1(
    input[4:0]rt,
    input[4:0]rd,
    output reg[4:0]WriteReg,
    input[1:0]RegDst
    );
    always@(RegDst or rt or rd)begin
        case(RegDst)
            2'b00:
                WriteReg = 5'b11111;//$31 ”√”⁄jal÷∏¡Ó
            2'b01:
                WriteReg = rt;
            2'b10:
                WriteReg = rd;
            2'b11:
                WriteReg = 5'b00000;
        endcase
    end
endmodule
