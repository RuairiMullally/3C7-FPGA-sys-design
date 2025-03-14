`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2025 12:40:35
// Design Name: 
// Module Name: agtb2
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


module agtb2(
    input  wire[1:0] a, b,			// a and b are the two 2-bit numbers to compare
    output wire agtb				// single bit output. Should be high if a and b the same

    );
    wire and1, and2, and3;
    assign and1 = a[1] & ~b[1];
    assign and2 = a[0] & ~b[1] & ~b[0];
    assign and3 = a[1] & a[0] & ~b[0];
    
    assign agtb = and1 + and2 + and3;
endmodule

