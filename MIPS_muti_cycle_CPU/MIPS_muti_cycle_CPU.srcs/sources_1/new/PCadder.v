`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 15:21:04
// Design Name: 
// Module Name: PCadder
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


module PCadder(
    input [31:0] cur_PC,
    output reg [31:0] PC4
    );
    always @(cur_PC) begin
        PC4 = cur_PC + 4;
    end
endmodule
