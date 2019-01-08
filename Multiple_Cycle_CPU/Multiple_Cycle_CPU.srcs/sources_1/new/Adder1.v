`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 14:31:47
// Design Name: 
// Module Name: Adder1
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


module Adder1(
    input[31:0] pc_cur,
    output reg[31:0] pc_sequence
    );
    always@(pc_cur)begin
        pc_sequence  <= pc_cur + 4;
     end
endmodule
