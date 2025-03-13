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
    output reg[5:0] X 
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
    gteq8 agteqb(.a({2'b00, A}), .b({2'b00, B}), .agteqb(AgteqB));
    FullAdder altb(.a(AgteqB), .b(1'b1), .cin(1'b0), .s(AltB));
    
    wire [5:0] AxnorB;
    b6xnor axnorb(.A(A), .B(B), .out(AxnorB));
    
    always @ (*) //sensitive to all
    begin
        case (fxn)
            3'b000: X = A; //return A
            3'b001: X = B; // return B
            3'b010: X = invertedA; 
            3'b011: X = invertedB;
            3'b100: X = AltB;// return A < B
            3'b101: X = AxnorB;//XNOR
            3'b110: X = AplusB;
            3'b111: X = AminusB;
        endcase
    
    end
endmodule
