`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/09 17:22:43
// Design Name: 
// Module Name: Mux5
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


module Mux5(
    input[31:0] PCadd4,PCbranch,PCjump,PCjr,
    input[1:0] PCSrc,
    output reg[31:0] PCnext
    );
    initial begin
    PCnext<=32'b0;
    end
    always@(PCSrc or PCadd4 or PCbranch or PCjump or PCjr)begin
        case(PCSrc)
            2'b00:
                PCnext <= PCadd4;
            2'b01:
                PCnext <= PCbranch;
            2'b10:
                PCnext <= PCjr;
            2'b11:
                PCnext <= PCjump;
        endcase
     end
endmodule
