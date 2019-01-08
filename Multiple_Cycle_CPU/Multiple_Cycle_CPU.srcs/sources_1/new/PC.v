`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/09 17:15:17
// Design Name: 
// Module Name: PC
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


module PC(
    input CLK,RST,PCWre,
    input[31:0] new_pc,
    output reg[31:0] cur_pc
    );
    always@(posedge CLK)begin
        if(RST==1'b0)
            cur_pc<=0;
        else begin
        if(PCWre==1'b1)
            cur_pc<=new_pc;
        end
    end
endmodule
