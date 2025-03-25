`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 11:34:07
// Design Name: 
// Module Name: d_ff_reset_TB
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


module d_ff_reset_TB(

    );
    //write a 20ns clock for testing
    reg clk;
    initial begin
        clk = 1'b1;
        forever #10 clk = ~clk; //invert the clock value every 10ns forever (20ns period)
    end
    
    //create artificial reset signal
    reg reset;
    initial begin
        reset = 1'b1;
        #35;//38 ns until first drop
        reset = ~reset;
        #80;
        reset = ~reset;
        #30;
        reset = ~reset;
    end
    
    //create artificial data signal
    reg d;
    initial begin
        d = 1'b0;
        #20;
        d = ~d;
        #25;
        d = ~d;
        #30;
        d = ~d;
        #100;
        d = ~d;
    end
    
    wire q; //monitor flip-flop state
    d_ff_reset uut(.clk(clk), .reset(reset), .d(d), .q(q));
    
    initial begin
        $monitor("%d %b %b %b %b" , 
                   $time, clk , reset , d, q);
        #240;
        $stop;
    end
endmodule
