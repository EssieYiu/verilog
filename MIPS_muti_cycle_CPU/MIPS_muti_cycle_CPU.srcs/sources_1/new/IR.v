`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 15:32:50
// Design Name: 
// Module Name: IR
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


module IR(
    input [31:0] instruction,
    input IRWre,
    input clk,
    output reg [31:0] ins
    );
    always @ (negedge clk) begin
    if(IRWre == 1)
        ins = instruction;
    end
        
endmodule
