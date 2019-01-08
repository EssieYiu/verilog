`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/10 19:34:26
// Design Name: 
// Module Name: Mux6
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


module Mux6(
    input DBDataSrc,
    input[31:0] ALU_result,
    input[31:0] Data,
    output[31:0] DataBack
    );
    assign DataBack = (DBDataSrc== 1'b0)? ALU_result:Data;
endmodule
