`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi Mullally
// 
// Create Date: 12.03.2025 14:55:35
// Design Name: Mini ALU
// Module Name: MINI_ALU
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MINI_ALU(
    input wire[5:0] A,B,
    input wire[2:0] fxn,
    output wire[5:0] X 
    );
    
    wire [5:0] invertedA, invertedB, AplusB, AminusB;
    //modules for inverting A or B using the ripple adder
    b6_ripple_adder invertA(.x(6'b000000), .y(A), .sel(1'b1), .sum(invertedA));
    b6_ripple_adder invertB(.x(6'b000000), .y(B), .sel(1'b1), .sum(invertedB));
    b6_ripple_adder AaddB(.x(A), .y(B), .sel(1'b0), .sum(AplusB));
    b6_ripple_adder AsubB(.x(A), .y(B), .sel(1'b1), .sum(AminusB));
    
    wire AgteqB, AltB;
    //modules fort getting A < B
    // Get A gteq B, then invert the output using a full adder
    gteq8 agteqb(.a({A, 2'b00}), .b({B, 2'b00}), .agteqb(AgteqB));
    FullAdder altb(.a(AgteqB), .b(1'b1), .cin(1'b0), .s(AltB));
    
    //module to get A XNOR B
    wire [5:0] AxnorB;
    b6xnor axnorb(.A(A), .B(B), .out(AxnorB));
    
    //MUX module to select output
    wire [5:0] muxout;
    mux8x1 MUX8x1(.fxn(fxn), .X(muxout), .in0(A), .in1(B), .in2(invertedA), .in3(invertedB), .in4({5'b00000, AltB}), .in5(AxnorB), .in6(AplusB), .in7(AminusB));
    assign X = muxout;
endmodule
