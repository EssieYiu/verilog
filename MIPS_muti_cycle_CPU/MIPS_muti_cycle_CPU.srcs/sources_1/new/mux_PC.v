`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 17:40:36
// Design Name: 
// Module Name: mux_PC
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


module mux_PC(
    input [31:0] PC4,adderResult,ReadData1,
    input [31:0] addr,
    input [1:0] PCSrc,
    output reg [31:0] newPC
    );
    always@(PC4 or adderResult or ReadData1 or addr or PCSrc) begin
    case(PCSrc)
    2'b00:begin//pc+4
    newPC = PC4;
    end
    2'b01:begin//pc+4+immediate
    newPC =adderResult;
    end
    2'b10:begin//rs
    newPC = ReadData1;
    end
    2'b11:begin//pc[31,28]addr[27,2]
    newPC = addr;
    end
    endcase
    end
endmodule
