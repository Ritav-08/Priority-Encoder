`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2026 12:19:03
// Design Name: 
// Module Name: tb_pEncoder
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


module tb_pEncoder();
reg a_i;
reg b_i;
reg c_i;
reg d_i;
wire x_o;
wire y_o;

//instantiation
pEncoder UUT(.a_i(a_i), 
    .b_i(b_i), 
    .c_i(c_i), 
    .d_i(d_i), 
    .x_o(x_o), 
    .y_o(y_o));

//feeding
initial begin 
a_i = 1'b0; 
b_i = 1'b0; 
c_i = 1'b0; 
d_i = 1'b0; //all 0s
$display("Data line: All 0s");
#5 a_i = 1'b1; 
   b_i = 1'b0; 
   c_i = 1'b0; 
   d_i = 1'b0; //A
$display("Data line: A");
#5 a_i = 1'b0; 
   b_i = 1'b1; 
   c_i = 1'b0; 
   d_i = 1'b0; //B
$display("Data line: B");
#5 a_i = 1'b0; 
   b_i = 1'b0; 
   c_i = 1'b1; 
   d_i = 1'b0; //C
$display("Data line: C");
#5 a_i = 1'b0; 
   b_i = 1'b0; 
   c_i = 1'b0; 
   d_i = 1'b1; //D
$display("Data line: D");
#5 a_i = 1'bx; 
   b_i = 1'b1; 
   c_i = 1'b0; 
   d_i = 1'b0; //Priority is X, remaining data lines include 1
$display("Data line: X100");
#5 a_i = 1'b1; 
   b_i = 1'bx; 
   c_i = 1'b0; 
   d_i = 1'b0; //Priority is 1, remaining data lines include X
$display("Data line: 1X00");
#5 a_i = 1'b0; 
   b_i = 1'bx; 
   c_i = 1'b0; 
   d_i = 1'b0; //one data line X, rest 0
$display("Data line: one X, rest 0");
#5 a_i = 1'bx; 
   b_i = 1'bx; 
   c_i = 1'bx; 
   d_i = 1'bx; //all X
$display("Data line: All X");
#5 a_i = 1'b1; 
   b_i = 1'b1; 
   c_i = 1'b1; 
   d_i = 1'b1; //all 1s
$display("Data line: All 1s");
end

//capture
initial begin
$monitor("Time: %0t | A: %b, B: %b, C: %b, D: %b | X: %b, Y: %b", $time, a_i, b_i, c_i, d_i, x_o, y_o);
$dumpfile("pEncoder.vcd");
$dumpvars(0, tb_pEncoder);
end

endmodule
