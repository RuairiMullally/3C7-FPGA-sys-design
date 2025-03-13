`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi Mullally
// 
// Create Date: 18.02.2025 11:13:37
// Design Name: 
// Module Name: 6bit_ripple_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// full_adder.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module b6_ripple_adder(
    input [5:0] x, y, 
    input sel, 
    output c_out, overflow,
    output [5:0] sum
    );
    
    wire [5:0] y_2C;
    assign y_2C = y ^ {6{sel}};
    //carryout from each full adder
    wire c1, c2, c3, c4, c5, c6;
    
    FullAdder fa0(x[0], y_2C[0], sel, sum[0], c1);
    FullAdder fa1(x[1], y_2C[1], c1, sum[1], c2);
    FullAdder fa2(x[2], y_2C[2], c2, sum[2], c3);
    FullAdder fa3(x[3], y_2C[3], c3, sum[3], c4);
    FullAdder fa4(x[4], y_2C[4], c4, sum[4], c5);
    FullAdder fa5(x[5], y_2C[5], c5, sum[5], c6);
    
    assign c_out = c6;
    assign overflow = c6 ^ c5;

endmodule
