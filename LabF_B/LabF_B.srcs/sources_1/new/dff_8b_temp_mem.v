`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi Mullally
// 
// Create Date: 19.03.2025 14:19:36
// Design Name: 
// Module Name: dff_8b_temp_mem
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


module dff_8b_temp_mem(
    input wire clk, reset,
    input wire[4:0] button_input,
    output wire[3:0] anode_sel,
    output wire[6:0] led_out
    

    );
    
    wire[4:0] buttons;
    //debouncer module instance
    //takes button input from physical board and debounces
    //returns to buttons
    debouncer DB1(.clk(clk), .reset(reset), .button_in(button_input), .button_out(buttons));
    
    //Q_next is the next value that will be stored in 8bit reg
    //compute Q_next based off Q and debounced button input
    reg[7:0] Q_next;
    wire[7:0] Q;//for accessing saved data
    always @(*)begin
        if(buttons[0] | buttons[3])begin
            Q_next <= Q + 1;
        end
        else if(buttons[2] | buttons[1]) begin
            Q_next <= Q - 1;
        end
        else if(buttons[4]) begin
            Q_next <= 8'h16;
        end
        else begin
            Q_next <= Q;
        end
    end 
    
    //instantiate 8 dffs to create an 8 bit vector to save temp data between 0 - 127
    d_ff_reset DFF0(.clk(clk), .reset(reset), .d(Q_next[0]), .q(Q[0]));
    d_ff_reset DFF1(.clk(clk), .reset(reset), .d(Q_next[1]), .q(Q[1]));
    d_ff_reset DFF2(.clk(clk), .reset(reset), .d(Q_next[2]), .q(Q[2]));
    d_ff_reset DFF3(.clk(clk), .reset(reset), .d(Q_next[3]), .q(Q[3]));
    d_ff_reset DFF4(.clk(clk), .reset(reset), .d(Q_next[4]), .q(Q[4]));
    d_ff_reset DFF5(.clk(clk), .reset(reset), .d(Q_next[5]), .q(Q[5]));
    d_ff_reset DFF6(.clk(clk), .reset(reset), .d(Q_next[6]), .q(Q[6]));
    d_ff_reset DFF7(.clk(clk), .reset(reset), .d(Q_next[7]), .q(Q[7]));
    
    //7seg controller instance
    //pass in the 8bit temperature value, returns anode_select: which LED module is on
    //LED_out: the cathode pattern for the LED 7 seg
    seven_segment_controller seven_seg(.clk(clk), .reset(reset), .temp(Q), .anode_select(anode_sel), .LED_out(led_out));
    
    
    
    
    
    
endmodule
