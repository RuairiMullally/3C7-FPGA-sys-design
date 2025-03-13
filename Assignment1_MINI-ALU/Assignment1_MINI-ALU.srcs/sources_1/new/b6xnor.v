`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCD
// Engineer: Ruairi Mullally
// 
// Create Date: 12.03.2025 22:59:15
// Design Name: 
// Module Name: b6xnor
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


module b6xnor(
    input wire[5:0] A, B,
    output wire[5:0] out

    );
    
    
    assign out = (A ~^ B);
endmodule
