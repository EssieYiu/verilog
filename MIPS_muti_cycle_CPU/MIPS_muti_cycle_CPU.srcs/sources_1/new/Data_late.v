`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 16:56:16
// Design Name: 
// Module Name: Data_late
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


module Data_late(
    input clk,
    input [31:0] indata,
    output reg [31:0] outdata
    );
    always @(posedge clk) begin
        outdata <= indata;
    end
endmodule
