`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 17:29:09
// Design Name: 
// Module Name: ALU
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


module ALU(
    //输入
    input[31:0] A,B,
    //opcode
    input[2:0] ALUOp,
    //结果
    output reg [31:0] result,
    //零信号
    output zero
    );
    assign zero = (result==0) ? 1:0;
    always@(ALUOp or A or B) begin
    case(ALUOp)
        3'b000: result = A + B;
        3'b001: result = A - B;
        3'b010: result = A & B;
        3'b011: result = A | B;
     endcase
     end
endmodule
