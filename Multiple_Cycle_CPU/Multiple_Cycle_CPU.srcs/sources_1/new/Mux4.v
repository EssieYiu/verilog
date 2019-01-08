`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/09 17:22:43
// Design Name: 
// Module Name: Mux4
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


module Mux4(
   input[31:0] BfromReg,
   input[31:0] imm_32,
   input ALUSrcB,
   output[31:0]B
   );
   assign B = (ALUSrcB == 1'b0)? BfromReg:imm_32;
endmodule
