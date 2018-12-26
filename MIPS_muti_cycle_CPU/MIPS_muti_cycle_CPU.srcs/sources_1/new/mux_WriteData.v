`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/19 15:32:19
// Design Name: 
// Module Name: mux_WriteData
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


module mux_WriteData(
    input [31:0] PC4,DB,
    input WrRegData,
    output [31:0] WriteData
    );
    assign WriteData = (WrRegData == 0)?PC4:DB;
endmodule
