`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi Mullally
// 
// Create Date: 18.02.2025 11:39:13
// Design Name: 
// Module Name: b6_ripple_adder_tb
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


module b6_ripple_adder_tb;

    // signal declaration
   reg  [5:0] test_in0, test_in1;
   reg test_sel;
   
   wire [5:0] test_out;
   wire test_c_out, test_overflow;
   
   reg [5:0] expected_out;
   reg expected_c_out, expected_overflow;
   
   integer pass_count = 0, total_tests = 0;
   
   //initialize DUT -> ripple adder
   b6_ripple_adder uut(
   .x(test_in0), .y(test_in1), .sel(test_sel), .c_out(test_c_out), .overflow(test_overflow), .sum(test_out));
   
   task check_test_case;
    begin
        total_tests = total_tests + 1;
        
        if (test_out == expected_out && test_c_out == expected_c_out && test_overflow == expected_overflow)
            begin
            pass_count = pass_count + 1;
            $display("%d | PASS:   |   %b |   %b |        %b |   %b |          %b |             %b |       %b |              %b |                 %b |",
                  $time, test_in0, test_in1, test_sel, test_out, test_c_out, test_overflow, expected_out, expected_c_out, expected_overflow
            );
            end
        else    
            begin
            $display("%d | FAIL:   |   %b |   %b |        %b |   %b |          %b |             %b |       %b |              %b |                 %b |",
                  $time, test_in0, test_in1, test_sel, test_out, test_c_out, test_overflow, expected_out, expected_c_out, expected_overflow
            );
            end
        
    end
   endtask
   
   
   
   initial
   begin
        $display("Time                 | Status  | test_in0 | test_in1 | test_sel | test_out | test_c_out | test_overflow | expected_out | expected_c_out | expected_overflow |");
      
        //test vectors
      
        // V1: Simple addition, no overflow, no carry
        test_in0 = 6'b000010;
        test_in1 = 6'b000011;
        test_sel = 1'b0;
        
        expected_out = 6'b000101;
        expected_c_out = 1'b0;
        expected_overflow = 1'b0;
        #100;
        check_test_case();
        #100;
        
        // V2: Simple subtraction, no overflow, no borrow
        test_in0 = 6'b000101;
        test_in1 = 6'b000011;
        test_sel = 1'b1;
        
        expected_out = 6'b000010;
        expected_c_out = 1'b1;
        expected_overflow = 1'b0;
        #100;
        check_test_case();
        #100;
        
        // V3: Addition with carry-out
        test_in0 = 6'b111111;
        test_in1 = 6'b000001;
        test_sel = 1'b0;
        
        expected_out = 6'b000000;
        expected_c_out = 1'b1;
        expected_overflow = 1'b0;
        #100;
        check_test_case();
        #100;
        
        // V4: Subtraction with borrow (0 - 1)
        test_in0 = 6'b000000;
        test_in1 = 6'b000001;
        test_sel = 1'b1;
        
        expected_out = 6'b111111; // -1 in two's complement
        expected_c_out = 1'b0;
        expected_overflow = 1'b0;
        #100;
        check_test_case();
        #100;
        
        
        // V5: Addition overflow (large positive + large positive)
        test_in0 = 6'b010000;
        test_in1 = 6'b010000;
        test_sel = 1'b0;
        
        expected_out = 6'b100000;
        expected_c_out = 1'b0;
        expected_overflow = 1'b1;
        #100;
        check_test_case();
        #100;
        
        // V6: Subtraction overflow (large negative - small positive)
        test_in0 = 6'b100000;
        test_in1 = 6'b000001;
        test_sel = 1'b1;
        
        expected_out = 6'b011111;  // Incorrect negative representation (overflow)
        expected_c_out = 1'b1;
        expected_overflow = 1'b1;
        #100;
        check_test_case();
        #100;
        
        // V7: Zero case
        test_in0 = 6'b000000;
        test_in1 = 6'b000000;
        test_sel = 1'b1;
        
        expected_out = 6'b000000;
        expected_c_out = 1'b1;
        expected_overflow = 1'b0;
        #100;
        check_test_case();
        #100;
        
        // V8: -32 - 1 (Underflow)
        test_in0 = 6'b100000;
        test_in1 = 6'b000001;
        test_sel = 1'b1;
        
        expected_out = 6'b011111;
        expected_c_out = 1'b1;
        expected_overflow = 1'b1;
        #100;
        check_test_case();
        #100;
        
        // V9: Adding -1 and -1 (two’s complement)
        test_in0 = 6'b111111;
        test_in1 = 6'b111111;
        test_sel = 1'b0;
        
        expected_out = 6'b111110; // -2 in two's complement
        expected_c_out = 1'b1;
        expected_overflow = 1'b0;
        #100;
        check_test_case();
        #100;

      
      $display("\nTotal Tests: %d, Passed: %d, Failed: %d", total_tests, pass_count, total_tests - pass_count);
      $display("Test Pass Percentage: %0.2f%%", (pass_count * 100.0) / total_tests);
      $stop;
      
   end
   
endmodule
