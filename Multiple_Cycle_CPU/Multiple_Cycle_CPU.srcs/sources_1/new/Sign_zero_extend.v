`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/09 17:18:06
// Design Name: 
// Module Name: Sign_zero_extend
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


module Sign_zero_extend(
    input [15:0] imm_16,
    input ExtSel,
    output [31:0] imm_32
    );
    assign imm_32=(ExtSel==1'b1 && imm_16[15]==1'b1)?{16'hffff,imm_16}:{16'b0,imm_16};
endmodule
