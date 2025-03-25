`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi Mullally
// 
// Create Date: 20.03.2025 14:35:20
// Design Name: 
// Module Name: lfsr_19b_clkdiv
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

module clock(
    input CCLK,
    input [31:0] clkscale, 
    output reg clk
    );
    
    reg [31:0] clkq = 0;
    
    always @ (posedge CCLK)begin
        clkq = clkq + 1;
        if(clkq >= clkscale)begin //change clock if greater than scaling value
            clk <= ~clk; //output clock
            clkq <= 0; //reset clock register
        end
    end
    
    

endmodule