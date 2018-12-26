`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/19 16:32:50
// Design Name: 
// Module Name: MutiCycleCPU
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


module MutiCycleCPU(
    );
    reg clk;
    reg reset;
    muti_cycle_CPU muti_cycle_CPU(.clk(clk),.reset(reset));
    always #10 clk = ~clk;
    initial begin
    reset = 0; 
    clk = 0;
    //clk = ~clk;
    #10;
    reset = 1;
    end

endmodule
