module flags

(
    input  [13:0] c_i,
    output [1:0]  flag_i
);

// Suponiendo la freccuencia de c_i 3Khz

assign flag_i[1] = c_i == 14'b00000011000110 ? 1 : 0; // Delay marcha: 198 *1/3000 = 66ms
assign flag_i[0] = c_i == 14'b11101010010000 ? 1 : 0; // Delay arranque: 14992 * 1/3000 = 5s

endmodule
