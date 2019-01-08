`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/09 17:18:26
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
    input[2:0] ALUOp,
    input[31:0] A,B,
    output zero,
    output reg[31:0]result
    );
    assign zero=(result==0)?1:0;
    always@(ALUOp or A or B)begin
       case(ALUOp)
        3'b000:result = A+B;
        3'b001:result = A-B;
        //A<B?
        3'b010:result = (A<B)?1:0;
        //比较A、B带符号
        3'b011:begin
            if(A<B && ((A[31]==0 && B[31]==0)||(A[31]==1&&B[31]==1)))
                result=1;
            else if(A[31]==0 && B[31]==1)
                result=0;
            else if(A[31]==1 && B[31]==0)
                result=1;
            else
                result=0;
       end     
       //B左移A位
        3'b100:result = B<<A;
        3'b101:result = A|B;
        3'b110:result = A&B;
        //A异或B
        3'b111:result = A^B;
        endcase
     end
endmodule
