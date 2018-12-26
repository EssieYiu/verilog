`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 16:44:44
// Design Name: 
// Module Name: Mux_Add
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


module Mux_Add(
    input Add_ALU_result,
    input PC_Adder_result,
    input PCSrc,
    output reg [31:0] new_PC
    );
    always @(1) begin
        if(PCSrc == 1)
        new_PC =  
    end
endmodule
