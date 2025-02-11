`timescale 1ns / 1ps

module gteq8_testbench;
    reg [7:0] a, b;
    wire agteqb;

    // Instantiate the 8-bit >= comparator
    gteq8 uut (
        .a(a),
        .b(b),
        .agteqb(agteqb)  // Fixed: Correct output port name
    );

    initial 
    begin
        $display("time test_in0 test_in1 test_out ") ;
          $monitor("%d %b %b %b" , 
                   $time, a , b , agteqb);
        // Test case 1: a == b
        a = 8'b10101010; 
        b = 8'b10101010;
        #200;

        // Test case 2: a > b
        a = 8'b11001100; 
        b = 8'b10111100;
        #200;

        // Test case 3: a < b
        a = 8'b00001100; 
        b = 8'b00001101;
        #200;

        // Test case 4: MSB equal, lower bits decide
        a = 8'b01010111; 
        b = 8'b01010110;
        #200;

        // Test case 5: LSB comparison matters
        a = 8'b00000011; 
        b = 8'b00000100;
        #200;

        // Test case 6: Max value vs Min value
        a = 8'b11111111; 
        b = 8'b00000000;
        #200;

        // Test case 7: Min value vs Max value
        a = 8'b00000000; 
        b = 8'b11111111;
        #200;


        // Test case 8: Random values
        a = 8'b01101001; 
        b = 8'b01101000;
        #200;

        // End simulation
        $stop;
    end
endmodule
