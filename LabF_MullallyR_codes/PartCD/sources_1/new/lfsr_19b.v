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


module lfsr_23b
    #(
    parameter seed = 23'h2 ~^ 23'h38 // last 3 digits of sn (002) XNOR with board num (56)
    //parameter seed = 23'b11111111111111111111111 // forbidden seed
    )
    (
    input clk, shift_enable, reset,
    output [22:0] Q_out,
    output reg max_tick_reg
    ); 
    
    localparam[22:0] SEED = seed; // local instance of seed
    reg [22:0] Q_state;
    wire [22:0] Q_ns;
    
    always @ (posedge clk, posedge reset) begin
        if (reset)begin
            Q_state <= SEED;
        end
        else if (shift_enable)begin
            Q_state <= Q_ns;
            max_tick_reg <= (Q_ns == SEED);
        end
    end
    
    
    //feedback bit composed of latches 18, 23, which are bits 17, 22
    assign Q_fb = ~(Q_state[22] ^ Q_state[17]);
    //feedback bit is concatenated to LSB of next state
    assign Q_ns = {Q_state[21:0],Q_fb};
    //output is the entire shift register
    assign Q_out = Q_state;
endmodule
