`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi Mullally
// 
// Create Date: 03.04.2025 19:27:30
// Design Name: 
// Module Name: sequence_detector_10010_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for Moore FSM that detects sequence 10010
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module sequence_detector_10010_tb();

    // Testbench signals
    reg clk;
    reg reset;
    reg bit_in;
    reg sh_en;
    wire detected;
    
    // Instantiate the Unit Under Test (UUT)
    sequence_detector_10010 uut (
        .bit_in(bit_in),
        .clk(clk),
        .reset(reset),
        .sh_en(sh_en),
        .detected(detected)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period (100MHz)
    end
    
    
 task check_result;
    input expected;
    input actual;
    input integer position;
    begin
        if (expected === actual) begin
            $display("CHECK PASSED at position %0d: Expected: %b, Got: %b", position, expected, actual);
        end else begin
            $display("CHECK FAILED at position %0d: Expected: %b, Got: %b", position, expected, actual);
        end
    end
    endtask
    // Test variables
    integer i;
    reg [0:15] test_vector = 16'b1001001010010011; // test sequence with overlapping patterns    
                               //10010|010|   |
    reg [0:15] expected_output_test1 = 16'b0000010010000100;
    // Main test sequence
    initial begin
        reset = 1;
        bit_in = 0;
        sh_en = 0;
        // reset
        #20;
        reset = 0;
        
        $display("\n=== Test 1: sh_en always on, basic functionality ===");
        sh_en = 1;
        
        for (i = 0; i < 16; i = i + 1) begin
            bit_in = test_vector[i];
            #10; // Wait for one clock cycle
            check_result(expected_output_test1[i], detected, i);
        end
        
        $display("\n=== Test 2: test sh_en ===");
        reset = 1;
        bit_in = 0;
        sh_en = 0;
        // reset
        #20;
        reset = 0;
        sh_en = 1;
        
        for (i = 0; i < 4; i = i + 1) begin
            bit_in = test_vector[i];
            #10; // Wait for one clock cycle
            check_result(1'b0, detected, i + 16);
        end
        sh_en = 1'b0;
        #30;
        sh_en = 1'b1;
        for (i = 4; i < 16; i = i + 1) begin
            bit_in = test_vector[i];
            #10; // Wait for one clock cycle
            if (i == 5 || i == 8 || i == 13) // Expected detection points
                check_result(1'b1, detected, i + 16);
            else
                check_result(1'b0, detected, i + 16);
        end
        
        
        $display("\n===Test 3: reset functionality ===");
        
        sh_en = 1;
        bit_in = 1; #10;
        bit_in = 0; #10;
        bit_in = 0; #10;
        
        // apply reset mid-sequence
        reset = 1; #10;
        check_result(1'b0, detected, 33);
        reset = 0; #10;
        check_result(1'b0, detected, 34);
        
        $finish;
    end
    
endmodule