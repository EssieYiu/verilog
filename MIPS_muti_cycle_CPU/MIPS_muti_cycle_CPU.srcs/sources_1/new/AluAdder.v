`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 17:08:45
// Design Name: 
// Module Name: AluAdder
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


module AluAdder(
    input [31:0] operator1,operator2,
    output reg [31:0] addResult
    );
    always @(operator1 or operator2) begin
        addResult = operator1+operator2;
    end
endmodule
