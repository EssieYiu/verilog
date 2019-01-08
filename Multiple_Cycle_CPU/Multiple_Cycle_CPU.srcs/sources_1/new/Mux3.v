`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/09 17:22:43
// Design Name: 
// Module Name: Mux3
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


module Mux3(
    input[31:0] AfromReg,
    input[4:0] sa,
    input ALUSrcA,
    output[31:0]A
    );
    assign A = (ALUSrcA == 1'b0)? AfromReg:{27'b0,sa};
endmodule
