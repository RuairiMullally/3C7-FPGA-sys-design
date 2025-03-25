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


module lfsr_23b_TB(

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
    
    
    wire[22:0] Q_out;
    wire max_tick;
    lfsr_23b uut(.clk(clk), .reset(reset), .shift_enable(shift_enable), .Q_out(Q_out), .max_tick_reg(max_tick)); 
    wire[23:0] zero_count, one_count;
    bit_counter bit_count(.clk(clk), .reset(reset), .max_tick(max_tick), .sh_en(shift_enable), .bit_in(Q_out[18]), .zero_count(zero_count), .one_count(one_count));
    
    initial begin
        $monitor("%d %b %b %b %b %b %b" , 
                   $time, clk , reset , max_tick, Q_out, zero_count, one_count);
                   
                   
                   
        // at 200ns, check enable functionality
        #200 shift_enable = 1'b0;
        // Hold freeze for 50ns
        #50 shift_enable = 1'b1;
        
        // check reset mid-cycle
        #150 reset = 1'b1;
        #20  reset = 1'b0;
        
        #83887000; //time to hit one reset
        $stop;
    end
endmodule
