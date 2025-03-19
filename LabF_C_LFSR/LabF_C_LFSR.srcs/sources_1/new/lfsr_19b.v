`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi Mullally
// 
// Create Date: 19.03.2025 22:20:30
// Design Name: 
// Module Name: lfsr_19b
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


module lfsr_19b
    #(
    parameter seed = 19'h2 ~^ 19'h38 // last 3 digits of sn (002) XNOR with board num (56)
    )
    (
    input clk, shift_enable, reset,
    output [18:0] Q_out,
    output reg max_tick_reg
    ); 
    
    localparam[18:0] SEED = seed; // local instance of seed
    reg [18:0] Q_state;
    wire [18:0] Q_ns;
    
    always @ (posedge clk, posedge reset) begin
        if (reset)begin
            Q_state <= SEED;
        end
        else if (shift_enable)begin
            Q_state <= Q_ns;
            max_tick_reg <= (Q_ns == SEED);
        end
    end
    
    
    //feedback bit composed of latches 1, 2, 6, 19, which are bits 0, 1, 5, 18
    assign Q_fb = ~(Q_state[18] ^ Q_state[5] ^ Q_state[1] ^ Q_state[0]);
    //feedback bit is concatenated to LSB of next state
    assign Q_ns = {Q_state[17:0],Q_fb};
    //output is the entire shift register
    assign Q_out = Q_state;
endmodule
