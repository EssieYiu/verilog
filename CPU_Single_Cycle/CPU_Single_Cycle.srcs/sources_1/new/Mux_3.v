`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 11:52:47
// Design Name: 
// Module Name: Mux_3
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

//PC+4 or PC+4+shift
module Mux_3(
    input PCSrc,
    //跳转的地址
    input [31:0] PC_jump,
    //顺序执行的地址
    input [31:0] PC_sequence,
    output reg [31:0] new_PC
    );
    always@(PCSrc or PC_jump or PC_sequence) begin
    case(PCSrc)
        1'b0: new_PC <= PC_sequence;
        1'b1: new_PC <= PC_jump;
        1'bz: new_PC <= 0;//初始化操作
     endcase
     end
endmodule
