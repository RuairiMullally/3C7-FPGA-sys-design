// Listing 4.2
module d_ff_reset// d type flip flop
   (
    input wire clk, reset,
    input wire d,
    output reg q
   );

   // body
   always @(negedge clk)//, posedge reset) remove reset from sensitivity list to make it synchronous
      if (reset)
         q <= 1'b0;
      else
         q <= d;

endmodule