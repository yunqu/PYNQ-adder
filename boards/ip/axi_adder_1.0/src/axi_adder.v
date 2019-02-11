`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Rock
// 
// Create Date: 02/02/2019 08:51:54 PM
// Design Name: 
// Module Name: axi_adder
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


module axi_adder #(parameter WIDTH = 4)(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    output [WIDTH:0] c
    );

assign c = a + b;

endmodule
