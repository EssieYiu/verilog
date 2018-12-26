`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 16:34:43
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,
    input reset,
    input [31:0] new_PC,
    input PCWre,
    output reg [31:0] PC_result
    );
    always @(posedge clk) begin
        if(reset) begin
         PC_result = 0;         
        end else if(PCWre) begin
            PC_result = new_PC;
        end else if(!PCWre) begin
            PC_result = PC_result;
         end
      end
   
endmodule
