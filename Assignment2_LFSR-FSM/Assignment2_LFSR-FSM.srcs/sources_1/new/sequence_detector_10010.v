`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi Mullally
// 
// Create Date: 03.04.2025 19:27:30
// Design Name: 
// Module Name: sequence_detector_10010
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Moore FSM that detects sequence 10010
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sequence_detector_10010(
    input bit_in, clk, reset, sh_en,
    output reg detected
    );
    
    // Grey code state encodings, only 1 bit change between states
    parameter s0 = 3'b000; //initial state
    parameter s1 = 3'b001; //detect 1
    parameter s2 = 3'b011; //detect 10
    parameter s3 = 3'b010; //detect 100
    parameter s4 = 3'b110; //detect 1001
    parameter s5 = 3'b111; //dectected state
    
    // stage registers cs, ns
    reg [2:0] current_state, next_state;
    
    // Moore machine needs synchronous updates -> not in between states
    //update state 
    always @(posedge clk) begin
        if (reset) begin
            //reset current state to start and set output to 0
            current_state <= s0;
            detected <= 1'b0;
        end else begin
            //maintain current state when shift_en is off
            if (sh_en) begin
                current_state <= next_state;
            end
            // output logic for moore machine
            // sequence detected when we go from s4 to s2
            //meaning 100110 has been detected
            detected <= (current_state == s5);
        end
    end
    
    // combinational logic for determining the next state
    always @(*) begin
        // only go to next state if shifting is enabled
        if (sh_en)begin
            case (current_state)
                s0: begin
                    if (bit_in == 1'b1)
                        next_state = s1;
                    else
                        next_state = s0; //remain in current state
                end
                
                s1: begin //1
                    if (bit_in == 1'b0)
                        next_state = s2;
                    else
                        next_state = s1; //still at s1 (multiple 1s)
                end
                
                s2: begin //10
                    if( bit_in == 1'b0)
                        next_state = s3; //100
                    else
                        next_state = s1; //101 -> start of new sequence 
                end
                
                s3: begin //100
                    if( bit_in == 1'b1)
                        next_state = s4; //1001
                    else
                        next_state = s0; //100|0| -> back to wait
                end
                
                s4: begin //1001
                    if( bit_in == 1'b0)
                        next_state = s5; //10010 -> sequence completed, go to detected state
                    else
                        next_state = s1; //1001|1| -> back to new seq @ s1
                end
                
                s5: begin // 10010
                //effect of detect state is that it is counter one clock cycle later
                    if (bit_in == 1'b0)
                        next_state = s3; // 100100-> sequence completed, also check for overlap of new seq.
                    else
                        next_state = s1; //10010|1| -> back to new seq @ s1
                
                end
                
                default:begin
                    //default: unused state, return to s0
                    next_state = s0;
                end
                
            endcase  
        end
    end
    
    
    
    
endmodule
