`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi Mullally
// 
// Create Date: 12.03.2025 19:57:00
// Design Name: Mini ALU testbench
// Module Name: MINI_ALU_tb
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MINI_ALU_tb(


    );
    
   reg  [5:0] test_in0, test_in1;
   reg [2:0] fxn;
   wire  [5:0] test_out;
   reg [5:0] expected_out;
   
   integer pass_count = 0, total_tests = 0; //count the test pass rate
   
   MINI_ALU uut //make uut -> MINI_ALU 
    (.A(test_in0), .B(test_in1), .X(test_out), .fxn(fxn));
    
    
    task check_test_case;
    begin
        total_tests = total_tests + 1;
        
        if (test_out == expected_out)
            begin
            pass_count = pass_count + 1;
            $display("%d | PASS:   |   %b |   %b | %b |   %b |       %b |",
                  $time, test_in0, test_in1, fxn, test_out, expected_out
            );
            end
        else    
            begin
            $display("%d | FAIL:   |   %b |   %b | %b |   %b |       %b |",
                  $time, test_in0, test_in1, fxn, test_out, expected_out
            );
            end
        
    end
   endtask
    
    
    initial
    begin
    $display("Time                 | Status  | test_in0 | test_in1 | fxn | test_out | expected_out |");

      // test vector 1
      test_in0 = 6'b111000;//board number is 56
      test_in1 = 6'b111000;
      fxn = 3'b000;
      expected_out = 6'b111000;
      #100;
      check_test_case();
      #100;
      
      // test vector 2
      test_in0 = 6'b000101;
      test_in1 = 6'b001111;
      fxn = 3'b000;
      expected_out = 6'b000101;
      #100;
      check_test_case();
      #100;
      
      // test vector 3
      test_in0 = 6'b100101;
      test_in1 = 6'b101111;
      fxn = 3'b000;
      expected_out = 6'b100101;
      #100;
      check_test_case();
      #100;
      
      // test vector 4
      test_in0 = 6'b010101;
      test_in1 = 6'b101111;
      fxn = 3'b000;
      expected_out = 6'b010101;
      #100;
      check_test_case();
      #100;
      
      // test vector 5
      test_in0 = 6'b110101;
      test_in1 = 6'b001111;
      fxn = 3'b000;
      expected_out = 6'b110101;
      #100;
      check_test_case();
      #100;
      
      // test vector 6
      test_in0 = 6'b000000;
      test_in1 = 6'b000000;
      fxn = 3'b000;
      expected_out = 6'b000000;
      #100;
      check_test_case();
      #100;
      
      // test vector 7
      test_in0 = 6'b111111;
      test_in1 = 6'b111111;
      fxn = 3'b000;
      expected_out = 6'b111111;
      #100;
      check_test_case();
      #100;
      
      
      //////////////////////////////////////////////////////////
      $display("fxn: %b", fxn);
      //////////////////////////////////////////////////////////
      
      // test vector 1
      test_in0 = 6'b111000;
      test_in1 = 6'b111000;
      fxn = 3'b001;
      expected_out = test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 2
      test_in0 = 6'b000101;
      test_in1 = 6'b001111;
      fxn = 3'b001;
      expected_out = test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 3
      test_in0 = 6'b100101;
      test_in1 = 6'b101111;
      fxn = 3'b001;
      expected_out = test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 4
      test_in0 = 6'b010101;
      test_in1 = 6'b101111;
      fxn = 3'b001;
      expected_out = test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 5
      test_in0 = 6'b110101;
      test_in1 = 6'b001111;
      fxn = 3'b001;
      expected_out = test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 6
      test_in0 = 6'b000000;
      test_in1 = 6'b000000;
      fxn = 3'b001;
      expected_out = test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 7
      test_in0 = 6'b111111;
      test_in1 = 6'b111111;
      fxn = 3'b001;
      expected_out = test_in1;
      #100;
      check_test_case();
      #100;
      
      //////////////////////////////////////////////////////////
      $display("fxn: %b", fxn);
      //////////////////////////////////////////////////////////
      

      // test vector 1
      test_in0 = 6'b111000;
      test_in1 = 6'b111000;
      fxn = 3'b010;
      expected_out = ~test_in0 + 1'b1;
      #100;
      check_test_case();
      #100;
      
      // test vector 2
      test_in0 = 6'b000101;
      test_in1 = 6'b001111;
      fxn = 3'b010;
      expected_out = ~test_in0 + 1'b1;
      #100;
      check_test_case();
      #100;
      
      // test vector 3
      test_in0 = 6'b100101;
      test_in1 = 6'b101111;
      fxn = 3'b010;
      expected_out = ~test_in0 + 1'b1;
      #100;
      check_test_case();
      #100;
      
      // test vector 4
      test_in0 = 6'b010101;
      test_in1 = 6'b101111;
      fxn = 3'b010;
      expected_out = ~test_in0 + 1'b1;
      #100;
      check_test_case();
      #100;
      
      // test vector 5
      test_in0 = 6'b110101;
      test_in1 = 6'b001111;
      fxn = 3'b010;
      expected_out = ~test_in0 + 1'b1;
      #100;
      check_test_case();
      #100;
      
      // test vector 6
      test_in0 = 6'b000000;
      test_in1 = 6'b000000;
      fxn = 3'b010;
      expected_out = ~test_in0 + 1'b1;
      #100;
      check_test_case();
      #100;
      
      // test vector 7
      test_in0 = 6'b111111;
      test_in1 = 6'b111111;
      fxn = 3'b010;
      expected_out = ~test_in0 + 1'b1;
      #100;
      check_test_case();
      #100;
      
            //////////////////////////////////////////////////////////
          $display("fxn: %b", fxn);
          //////////////////////////////////////////////////////////
          
      // test vector 1
      test_in0 = 6'b111000;
      test_in1 = 6'b111000;
      fxn = 3'b011;
      expected_out = ~test_in1 + 1'b1;
      #100;
      check_test_case();
      #100;
      
      // test vector 2
      test_in0 = 6'b000101;
      test_in1 = 6'b001111;
      fxn = 3'b011;
      expected_out = ~test_in1 + 1'b1;
      #100;
      check_test_case();
      #100;
      
      // test vector 3
      test_in0 = 6'b100101;
      test_in1 = 6'b101111;
      fxn = 3'b011;
      expected_out = ~test_in1 + 1'b1;
      #100;
      check_test_case();
      #100;
      
      // test vector 4
      test_in0 = 6'b010101;
      test_in1 = 6'b101111;
      fxn = 3'b011;
      expected_out = ~test_in1 + 1'b1;
      #100;
      check_test_case();
      #100;
      
      // test vector 5
      test_in0 = 6'b110101;
      test_in1 = 6'b001111;
      fxn = 3'b011;
      expected_out = ~test_in1 + 1'b1;
      #100;
      check_test_case();
      #100;
      
      // test vector 6
      test_in0 = 6'b000000;
      test_in1 = 6'b000000;
      fxn = 3'b011;
      expected_out = ~test_in1 + 1'b1;
      #100;
      check_test_case();
      #100;
      
      // test vector 7
      test_in0 = 6'b111111;
      test_in1 = 6'b111111;
      fxn = 3'b011;
      expected_out = ~test_in1 + 1'b1;
      #100;
      check_test_case();
      #100;

      //////////////////////////////////////////////////////////
          $display("fxn: %b", fxn);
          //////////////////////////////////////////////////////////
    
      // test vector 1
      test_in0 = 6'b111000;
      test_in1 = 6'b111000;
      fxn = 3'b100;
      expected_out = ($signed(test_in0) < $signed(test_in1)) ? 6'b000001 : 6'b000000; // use $signed to denote the numbers are signed for comparison
      #100;
      check_test_case();
      #100;
      
      // test vector 2
      test_in0 = 6'b000101;
      test_in1 = 6'b001111;
      fxn = 3'b100;
      expected_out = ($signed(test_in0) < $signed(test_in1)) ? 6'b000001 : 6'b000000;
      #100;
      check_test_case();
      #100;
      
      // test vector 3
      test_in0 = 6'b100101;
      test_in1 = 6'b101111;
      fxn = 3'b100;
      expected_out = ($signed(test_in0) < $signed(test_in1)) ? 6'b000001 : 6'b000000;
      #100;
      check_test_case();
      #100;
      
      // test vector 4
      test_in0 = 6'b010101;
      test_in1 = 6'b101111;
      fxn = 3'b100;
      expected_out = ($signed(test_in0) < $signed(test_in1)) ? 6'b000001 : 6'b000000;
      #100;
      check_test_case();
      #100;
      
      // test vector 5
      test_in0 = 6'b110101;
      test_in1 = 6'b001111;
      fxn = 3'b100;
      expected_out = ($signed(test_in0) < $signed(test_in1)) ? 6'b000001 : 6'b000000;
      #100;
      check_test_case();
      #100;
      
      // test vector 6
      test_in0 = 6'b000000;
      test_in1 = 6'b000000;
      fxn = 3'b100;
      expected_out = ($signed(test_in0) < $signed(test_in1)) ? 6'b000001 : 6'b000000;
      #100;
      check_test_case();
      #100;
      
      // test vector 7
      test_in0 = 6'b111111;
      test_in1 = 6'b111111;
      fxn = 3'b100;
      expected_out = ($signed(test_in0) < $signed(test_in1)) ? 6'b000001 : 6'b000000;
      #100;
      check_test_case();
      #100;


      test_in0 = 6'b111000;
      test_in1 = 6'b111000;
      fxn = 3'b101;
      expected_out = ~(test_in0 ^ test_in1);
      #100;
      check_test_case();
      #100;
      
      // test vector 2
      test_in0 = 6'b000101;
      test_in1 = 6'b001111;
      fxn = 3'b101;
      expected_out = ~(test_in0 ^ test_in1);
      #100;
      check_test_case();
      #100;
      
      // test vector 3
      test_in0 = 6'b100101;
      test_in1 = 6'b101111;
      fxn = 3'b101;
      expected_out = ~(test_in0 ^ test_in1);
      #100;
      check_test_case();
      #100;
      
      // test vector 4
      test_in0 = 6'b010101;
      test_in1 = 6'b101111;
      fxn = 3'b101;
      expected_out = ~(test_in0 ^ test_in1);
      #100;
      check_test_case();
      #100;
      
      // test vector 5
      test_in0 = 6'b110101;
      test_in1 = 6'b001111;
      fxn = 3'b101;
      expected_out = ~(test_in0 ^ test_in1);
      #100;
      check_test_case();
      #100;
      
      // test vector 6
      test_in0 = 6'b000000;
      test_in1 = 6'b000000;
      fxn = 3'b101;
      expected_out = ~(test_in0 ^ test_in1);
      #100;
      check_test_case();
      #100;
      
      // test vector 7
      test_in0 = 6'b111111;
      test_in1 = 6'b111111;
      fxn = 3'b101;
      expected_out = ~(test_in0 ^ test_in1);
      #100;
      check_test_case();
      #100;
      
            //////////////////////////////////////////////////////////
          $display("fxn: %b", fxn);
          //////////////////////////////////////////////////////////
    
     // test vector 1
      test_in0 = 6'b111000;
      test_in1 = 6'b111000;
      fxn = 3'b110;
      expected_out = test_in0 + test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 2
      test_in0 = 6'b000101;
      test_in1 = 6'b001111;
      fxn = 3'b110;
      expected_out = test_in0 + test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 3
      test_in0 = 6'b100101;
      test_in1 = 6'b101111;
      fxn = 3'b110;
      expected_out = test_in0 + test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 4
      test_in0 = 6'b010101;
      test_in1 = 6'b101111;
      fxn = 3'b110;
      expected_out = test_in0 + test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 5
      test_in0 = 6'b110101;
      test_in1 = 6'b001111;
      fxn = 3'b110;
      expected_out = test_in0 + test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 5
      test_in0 = 6'b000000;
      test_in1 = 6'b000000;
      fxn = 3'b110;
      expected_out = test_in0 + test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 6
      test_in0 = 6'b111111;
      test_in1 = 6'b111111;
      fxn = 3'b110;
      expected_out = test_in0 + test_in1;
      #100;
      check_test_case();
      #100;

            //////////////////////////////////////////////////////////
          $display("fxn: %b", fxn);
          //////////////////////////////////////////////////////////
    
     // test vector 1
      test_in0 = 6'b111000;
      test_in1 = 6'b111000;
      fxn = 3'b111;
      expected_out = test_in0 - test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 2
      test_in0 = 6'b000101;
      test_in1 = 6'b001111;
      fxn = 3'b111;
      expected_out = test_in0 - test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 3
      test_in0 = 6'b100101;
      test_in1 = 6'b101111;
      fxn = 3'b111;
      expected_out = test_in0 - test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 4
      test_in0 = 6'b010101;
      test_in1 = 6'b101111;
      fxn = 3'b111;
      expected_out = test_in0 - test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 5
      test_in0 = 6'b110101;
      test_in1 = 6'b001111;
      fxn = 3'b111;
      expected_out = test_in0 - test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 6
      test_in0 = 6'b000000;
      test_in1 = 6'b000000;
      fxn = 3'b111;
      expected_out = test_in0 - test_in1;
      #100;
      check_test_case();
      #100;
      
      // test vector 7
      test_in0 = 6'b111111;
      test_in1 = 6'b111111;
      fxn = 3'b111;
      expected_out = test_in0 - test_in1;
      #100;
      check_test_case();
      #100;


      
      $stop;
      end
      
endmodule





