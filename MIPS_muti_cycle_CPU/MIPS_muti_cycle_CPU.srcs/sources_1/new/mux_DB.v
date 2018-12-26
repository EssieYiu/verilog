`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/19 15:33:31
// Design Name: 
// Module Name: mux_DB
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


module mux_DB(
    input [31:0] ALUresult,DataOut,
    input DBDataSrc,
    output [31:0] DB
    );
    assign DB = (DBDataSrc == 1)?DataOut:ALUresult;
endmodule
