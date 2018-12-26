`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/19 14:45:30
// Design Name: 
// Module Name: cpu_sim
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


module cpu_sim(
    );
    reg reset;
    reg clock;
    CPU_Single_Cycle CPU_Single_Cycle(.clk(clock), .Reset(reset));
    initial begin
    clock = 1;
    reset = 1'b0;
    #5;
    reset = 1'b1;
    #5;
    end
    always #5 clock=~clock;
endmodule
