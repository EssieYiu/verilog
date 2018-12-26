`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 18:52:00
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
    input [31:0]A,B,
    input [2:0] ALUOp,
    output reg [31:0]ALUresult,
    output zero
    );
    initial begin
        ALUresult = 0;
    end
    always @(ALUOp or A or B) begin
    case(ALUOp)
    3'b000:ALUresult = A+B;
    3'b001:ALUresult = A-B;
    3'b010:ALUresult = (A<B)?1:0;
    3'b011://±È½Ïa b´ø·ûºÅ
    begin
        if((A<B && A[31] == 0 && B[31] == 0)||(A[31] == 1 && B[31] == 1))
            ALUresult = 1;
        else if(A[31] == 0 && B[31] == 1)
            ALUresult = 0;
        else if(A[31] == 1 && B[31] == 0)
            ALUresult = 1;
        else
            ALUresult = 0;
    end
    //b shift left a
    3'b100:ALUresult = B<<A;
    //or
    3'b101:ALUresult = A|B;
    //and
    3'b110:ALUresult = A&B;
    3'b111:ALUresult = A^B;
    endcase
    end
   assign zero = (ALUresult == 0)?1:0;
endmodule
