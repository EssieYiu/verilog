`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/09 17:17:27
// Design Name: 
// Module Name: Instruction_Register
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


module Instruction_Register(
    input CLK,IRWre,
    input[31:0]InsIn,
    output reg[31:0]InsOut
    );
    always@(negedge CLK)begin
        if(IRWre==1'b1)
            InsOut<=InsIn;
    end
endmodule
