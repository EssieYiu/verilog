`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/13 15:54:02
// Design Name: 
// Module Name: mux_A
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


module mux_A(
    input [31:0] ADROut,
    input [4:0]sa,
    input ALUSrcA,//0:data1 1:sa
    output [31:0] A
    );
    assign A = (ALUSrcA == 0)?ADROut:{6'h000000,3'b000,sa};
endmodule
