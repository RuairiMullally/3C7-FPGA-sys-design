// Listing 4.19
module stop_watch_test
   (
    input wire clk,
    input wire go, clr, up,
    output wire [3:0] an,
    output wire [7:0] sseg
   );

   // signal declaration
   wire [3:0]  d3, d2, d1, d0; //added wire d3

   // instantiate 7-seg LED display module
   disp_hex_mux disp_unit
      (.clk(clk), .reset(1'b0), .hex3(d3),
        .hex2(d2), .hex1(d1), .hex0(d0),
       .dp_in(4'b0101), .an(an), .sseg(sseg)); //added connection hex3 -> d3 and dp _ in

   // instantiate stopwatch
   stop_watch_if counter_unit
      (.clk(clk), .go(go), .up(up), .clr(clr), .d3(d3),
       .d2(d2), .d1(d1), .d0(d0) );
       
   //disable the unused display by setting it to 1
   //assign an = an | 4'b1000; // removed anode disable

endmodule
