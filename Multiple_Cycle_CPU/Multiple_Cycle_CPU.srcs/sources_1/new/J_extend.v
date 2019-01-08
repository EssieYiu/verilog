`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 14:38:58
// Design Name: 
// Module Name: J_extend
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


module J_extend(
    input[25:0]addr,
    input[31:0]pc4,
    output reg[31:0]pc_jump
    );
    always@(addr or pc4)begin
        pc_jump = {pc4[31:28],addr[25:0],1'b0,1'b0};
    end
endmodule
