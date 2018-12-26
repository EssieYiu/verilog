`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 16:43:25
// Design Name: 
// Module Name: Mux_Ins
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


module Mux_Ins(
    input [4:0] rt,
    input [4:0] rd,
    input RegDst,
    output reg [4:0] Write_reg
    );
    always @ (rt or rd) begin
        if(RegDst == 1)
            Write_reg = rd;
        else begin
            Write_reg = rt;
        end
    end
endmodule
