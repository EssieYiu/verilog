`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/13 15:54:18
// Design Name: 
// Module Name: mux_B
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


module mux_B(
    input [31:0] DataIn,extension,
    input ALUSrcB,
    output [31:0] B
    );
    assign B = (ALUSrcB==0)?DataIn:extension;
    
endmodule
