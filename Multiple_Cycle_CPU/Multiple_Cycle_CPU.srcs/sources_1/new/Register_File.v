`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/09 17:17:07
// Design Name: 
// Module Name: Register_File
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


module Register_File(
    input CLK,RegWre,
    input[4:0]ReadReg1,
    input[4:0]ReadReg2,
    input[4:0]WriteReg,
    input[31:0]WriteData,
    output[31:0]ReadData1,
    output[31:0]ReadData2
    );
    reg[31:0] regf[1:31];
    integer i;
    initial begin
        for(i=0;i<=31;i=i+1)
            regf[i]=0;
    end
    //¶Á
    assign ReadData1 = (ReadReg1==0)? 0:regf[ReadReg1];
    assign ReadData2 = (ReadReg2==0)? 0:regf[ReadReg2];
    //Ð´
    always@(posedge CLK)begin
        if(RegWre==1'b1 && WriteReg!=0)begin
            regf[WriteReg] <= WriteData;
        end
    end
    
endmodule
