`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/10 19:33:47
// Design Name: 
// Module Name: Mux2
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


module Mux2(
    input WrRegDSrc,
    input[31:0] PCadd4,
    input[31:0] DBData,
    output[31:0] WriteData
    );
    assign WriteData = (WrRegDSrc==1'b0)? PCadd4:DBData;
endmodule
