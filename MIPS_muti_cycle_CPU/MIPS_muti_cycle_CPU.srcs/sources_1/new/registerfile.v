`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 15:43:12
// Design Name: 
// Module Name: registerfile
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


module registerfile(
    input clk,
    input [4:0] ReadReg1,ReadReg2,WriteReg,
    input [31:0] WriteData,
    input RegWre,//0ÎÞÐ´¼Ä´æÆ÷×éÖ¸Áî£¬1ÓÐÐ´¼Ä´æÆ÷×éÖ¸Áî
    output reg [31:0] ReadData1,ReadData2
    );
    reg [31:0] register [0:31];
    integer i;
    initial begin
        for(i = 0; i < 32; i = i+ 1)
            register[i] = 0;
    end
    always @ (posedge clk) begin
        if(RegWre == 1) begin//Ð´¼Ä´æÆ÷
            register[WriteReg] = WriteData;
        end
     end
     always @(negedge clk)begin
           ReadData1 = register[ReadReg1];
           ReadData2 = register[ReadReg2];
     end
endmodule
