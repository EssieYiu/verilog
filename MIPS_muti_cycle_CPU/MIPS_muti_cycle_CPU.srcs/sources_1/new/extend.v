`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 15:48:38
// Design Name: 
// Module Name: extend
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


module extend(
    input ExtSel,//0 0À©Õ¹ 1·ûºÅÀ©Õ¹
    input [15:0] immediate,
    output reg [31:0] extension
    );
   // assign extension = (ExtSel && extension[15]==1'b1)? { 16'hffff, extension}: {16'b0, extension};
   always@(ExtSel or immediate) begin
    if(ExtSel == 1)begin
        extension = {{16{immediate[15]}},immediate};
    end
    else begin
        extension = {{16{0}},immediate};
    end
   end
endmodule
