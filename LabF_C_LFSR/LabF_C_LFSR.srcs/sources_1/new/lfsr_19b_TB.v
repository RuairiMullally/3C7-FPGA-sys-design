`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi Mullally
// 
// Create Date: 19.03.2025 23:12:05
// Design Name: 
// Module Name: lfsr_19b_TB
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


module lfsr_19b_TB(

    );
    
    reg clk;
    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk; //invert the clock value every 5ns forever (10ns period)
    end
    
    reg reset;
    reg shift_enable;
    initial begin
        reset = 1'b1;
        shift_enable = 1'b0;
        #100;//hold reset for first 10 cycles
        reset = 1'b0;
        shift_enable = 1'b1;
    end
    
    
    wire[18:0] Q_out;
    wire max_tick;
    lfsr_19b uut(.clk(clk), .reset(reset), .shift_enable(shift_enable), .Q_out(Q_out), .max_tick_reg(max_tick)); 
    
    initial begin
        $monitor("%d %b %b %b %b" , 
                   $time, clk , reset , max_tick, Q_out);
        #10485780;
        $stop;
    end
endmodule
