`timescale 1 ns/10 ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi Mullally
// 
// Create Date: 07.02.2025 13:03:24
// Design Name: 8 bit comparator
// Module Name: gteq8
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


module gteq8(
    input wire [7:0] a, b, //8 bit input nums for comparison
    output wire agteqb        //output of module, showing equality

    );
    
    wire eq0, eq1, eq2, eq3; // internal wiring, for output from 2 bit comparators
    wire gt0, gt1, gt2, gt3; // internal wiring, for output from 2 bit greater than
    
    //MSB 2BIT COMPARISONS OF EQUALITY AND GREATER THAN
    eq2 eq3_unit(.a(a[7:6]), .b(b[7:6]), .aeqb(eq3));
    agtb2 gt3_unit(.a(a[7:6]), .b(b[7:6]), .agtb(gt3));
    
    eq2 eq2_unit(.a(a[5:4]), .b(b[5:4]), .aeqb(eq2));
    agtb2 gt2_unit(.a(a[5:4]), .b(b[5:4]), .agtb(gt2));
    
    eq2 eq1_unit(.a(a[3:2]), .b(b[3:2]), .aeqb(eq1));
    agtb2 gt1_unit(.a(a[3:2]), .b(b[3:2]), .agtb(gt1));
    //LSB COMPARISONS
    eq2 eq0_unit(.a(a[1:0]), .b(b[1:0]), .aeqb(eq0));
    agtb2 gt0_unit(.a(a[1:0]), .b(b[1:0]), .agtb(gt0));
    
    //SOP outputs of 
    assign agteqb =
                    gt3 |
                    (eq3 & gt2) |
                    (eq3 & eq2 & gt1) |
                    (eq3 & eq2 & eq1 & gt0) |
                    (eq3 & eq2 & eq1 & eq0);
    
endmodule
