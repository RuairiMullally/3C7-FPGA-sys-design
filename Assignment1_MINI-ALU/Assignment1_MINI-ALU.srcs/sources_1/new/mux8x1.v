`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi
// 
// Create Date: 13.03.2025 14:04:06
// Design Name: 
// Module Name: mux8x1
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


module mux8x1(
    input wire[5:0] in0,in1,in2,in3,in4,in5,in6,in7, 
    input wire[2:0] fxn,
    output reg[5:0] X
    );
    
    always @ (*) //sensitive to all
    begin
        case (fxn)
            3'b000: X = in0; //return A
            3'b001: X = in1; // return B
            3'b010: X = in2; 
            3'b011: X = in3;
            3'b100: X = in4;// return A < B
            3'b101: X = in5;//XNOR
            3'b110: X = in6;
            3'b111: X = in7;
        endcase
    
    end
endmodule
