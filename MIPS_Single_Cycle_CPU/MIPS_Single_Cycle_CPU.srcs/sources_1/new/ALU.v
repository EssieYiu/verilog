`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 16:38:24
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] Read_data1,
    input [31:0] Mux_Reg_result,
    input [2:0] ALUOp,
    output reg zero,
    output reg [31:0] ALU_result
    );
    always @(Read_data1 or Mux_Reg_result) begin
        case(ALUOp) 
        3'b000:
        begin
        ALU_result = Read_data1+Mux_Reg_result;
        end
        3'b001:
        begin
        ALU_result = Read_data1 - Mux_Reg_result;
        end
        3'b010:
        begin
        ALU_result = Read_data1 & Mux_Reg_result;
        end
        3'b011:
        begin
        ALU_result = Read_data1 | Mux_Reg_result;
        end
        endcase
        if(ALU_result == 0)
            zero = 1;
        else 
            zero = 0;
    end
endmodule
