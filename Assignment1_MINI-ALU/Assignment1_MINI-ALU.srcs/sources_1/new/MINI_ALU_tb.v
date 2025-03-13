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
   
   MINI_ALU uut
    (.A(test_in0), .B(test_in1), .X(test_out), .fxn(fxn));
    
    initial
   begin
      $display("time  test_in0  test_in1  fxn  test_out");
      $monitor("%d  %b  %b  %b  %b", 
               $time, test_in0, test_in1, fxn, test_out);
      // test vector 1
      test_in0 = 6'b000011;
      test_in1 = 6'b000001;
      fxn = 3'b100;
      
      # 200;
      // test vector 2
      test_in0 = 6'b000001;
      test_in1 = 6'b000011;
      fxn = 3'b100;
      # 200;
      
      // test vector 3
      test_in0 = 6'b000000;
      test_in1 = 6'b000000;
      fxn = 3'b101;
      # 200;
      $stop;
      end
      
endmodule