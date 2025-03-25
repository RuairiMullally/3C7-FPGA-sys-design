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


module lfsr_23b_clkdiv(
    input reset,
    input CCLK,
    output [14:0] Q_out,//limited to 14b to show on LEDs
    output max_tick_reg
    );
    wire shift_enable = 1'b1;
    wire clk;
    
    clock hz1clock(.CCLK(CCLK), .clkscale(50000000), .clk(clk));
    lfsr_23b lfsr(.clk(clk), .reset(reset), .shift_enable(shift_enable), .Q_out(Q_out), .max_tick_reg(max_tick_reg));
endmodule
