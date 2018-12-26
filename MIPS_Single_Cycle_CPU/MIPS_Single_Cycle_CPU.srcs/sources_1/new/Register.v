`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 16:37:33
// Design Name: 
// Module Name: Register
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


module Register(
    input clk,
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] Write_reg,
    input [32:0]DB,
    input RegWre,
    output reg [31:0] Read_data1,
    output reg [31:0] Read_data2 
    );
    always @ (clk) begin
        if(RegWre) begin
            
        else begin
        end
    end
endmodule
