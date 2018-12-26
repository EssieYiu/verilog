`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 16:44:23
// Design Name: 
// Module Name: Mux_Reg
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


module Mux_Reg(
    input [31:0] Extend_result,
    input [31:0] Read_data2,
    input ALUSrcB,
    output reg [31:0] Mux_Reg_result
    );
    always @(Read_data2 or Extend_result) begin
        if(ALUSrcB == 1) begin
            Mux_Reg_result = Extend_result;
        end else begin
            Mux_Reg_result = Read_data2;
         end
    end
endmodule
