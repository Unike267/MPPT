module flag

(
    input  [13:0] c_i,
    output [1:0]  flag_i
);

assign flag_i[1] = c_i == 14'b00000011000110 ? 1 : 0; 
assign flag_i[0] = c_i == 14'b11101010010000 ? 1 : 0;

endmodule
