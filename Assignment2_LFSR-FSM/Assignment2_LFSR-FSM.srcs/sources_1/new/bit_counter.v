`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi Mullally
// 
// Create Date: 20.03.2025 13:33:25
// Design Name: 
// Module Name: bit_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Changed to be 18 bits wide
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bit_counter
    #(
    parameter N = 18 //big enough to hold full cycle
    )
    (
    input bit_in, max_tick, clk, reset,sh_en,
    output reg[N:0] zero_count, one_count
    );
    
    //full cycle len = 2^23 -1
    localparam full_cycle = (1 << N) - 1;
    reg cycle_done;
    
    always @(posedge clk)begin
        if(reset)begin //reset params to 0
            zero_count <= 1'b0;
            one_count <= 1'b0;
            cycle_done <= 1'b0;
        end
        else if((!max_tick) & sh_en)begin //if not reached max_tick
        
            if(bit_in)begin //count 1s
                one_count <= one_count + 1;
            end
            else if(!bit_in) begin //count 0s
                zero_count <= zero_count + 1;
            end
        
        end
        else if(max_tick) begin //otherwise have reached max_tick and reset
            zero_count <= 1'b0;
            one_count <= 1'b0;
            cycle_done <= 1'b0;
        end
        
        
    end
endmodule
