`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 17:13:47
// Design Name: 
// Module Name: mux_WReg
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


module mux_WReg(
    input [4:0]rt,rd,
    input [1:0] RegDst,//
    output reg [4:0] WriteReg
    );
    always@(rt or rd or RegDst) begin
        case(RegDst)
        2'b00:
        begin
        WriteReg = 31;
        end
        2'b01://rt
        begin
        WriteReg = rt;
        end
        2'b10://rd
        begin
        WriteReg = rd;
        end
        2'b11:
        begin
        WriteReg = 5'bxxxxx;
        end
    endcase
    end
endmodule
