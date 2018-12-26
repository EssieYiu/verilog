`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 16:36:59
// Design Name: 
// Module Name: Instruction_Mem
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


module Instruction_Mem(
    input [31:0] cur_PC,
    input InsMemRW,
    input [31:0] Ins_text [0:31],
    //output [5:0] opcode,
    //output [4:0] rs,
    //output [4:0] rt,
    //output [4:0] rd,
    //output [15:0] num
    output reg [31:0] Ins_Mem_result
    );
    //reg [31:0] Ins_Mem_result;
    always @(cur_PC or InsMemRW) begin
        
    end
endmodule
