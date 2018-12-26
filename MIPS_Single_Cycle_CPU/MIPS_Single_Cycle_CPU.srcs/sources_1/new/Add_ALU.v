`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 16:41:23
// Design Name: 
// Module Name: Add_ALU
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


module Add_ALU(
    input PCAdder_result,
    input Shift_result,
    output [31:0] Add_ALU_result
    );
    always @(1)begin
    Add_ALU_result = PCAdder_result + Shift_result;
    end
endmodule
