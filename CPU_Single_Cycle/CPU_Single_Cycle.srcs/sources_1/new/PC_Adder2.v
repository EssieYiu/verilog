`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 21:50:15
// Design Name: 
// Module Name: PC_Adder2
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

//执行 PC+4+偏移量
module PC_Adder2(
    //输入：PC+4的结果
    input [31:0] PCadd4,
    //输入：偏移量
    input [31:0] Shift,
    //输出：要跳转到的PC
    output reg [31:0] PC_jump
    );
    //临时保存值
    reg [31:0] tmp;
    always@(PCadd4 or Shift)begin//组合逻辑
        tmp = Shift<<2;
        PC_jump = PCadd4+tmp;//阻塞赋值，保证tmp的值已经是左移两位后的值
     end
endmodule
