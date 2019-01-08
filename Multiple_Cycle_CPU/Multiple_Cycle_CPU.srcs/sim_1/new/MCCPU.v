`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 15:05:43
// Design Name: 
// Module Name: MCCPU
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


module MCCPU(
    );
    reg clk,Reset;
    Multiple_Cycle_CPU CPU(.clk(clk),.Reset(Reset));
    initial begin
    clk=0;
    Reset=0;
    #10;
    Reset=1;
    end
    always #5 clk=~clk;//10ns
endmodule
