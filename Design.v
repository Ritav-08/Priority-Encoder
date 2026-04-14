`timescale 1ns / 1ps

module pEncoder(
    input a_i, 
    input b_i, 
    input c_i, 
    input d_i, 
    output reg x_o, 
    output reg y_o
);

always@(*)
//if(a_i === 1'bx || b_i === 1'bx || c_i === 1'bx || d_i === 1'bx) begin //don't care handling
//   x_o = 1'bx;
//   y_o = 1'bx;
//end
//in real hardware, x does not exist-- simulation only design
if((a_i | b_i | c_i | d_i) == 0) begin //all 0 handling
   x_o = 1'b0;
   y_o = 1'b0;
end
else if(a_i) begin //Data line A
   x_o = 1'b0;
   y_o = 1'b0;
end
else if(b_i) begin //Data line B
   x_o = 1'b0;
   y_o = 1'b1;
end
else if(c_i) begin //Data line C
   x_o = 1'b1;
   y_o = 1'b0;
end
else begin //Data line D
   x_o = 1'b1;
   y_o = 1'b1;
end

endmodule
