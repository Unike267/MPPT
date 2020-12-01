module decoder

(
        input   [2:0]   state,
        input   [1:0]   flag_o,
        output          rst_ci,
        output  [2:0]   nstate,
        output  [3:0]   en
);

assign nstate[2] = ~state[2] & state[1] & state[0] | state[2] & ~state[1] & ~state[0] | state[2] & ~state[1] & ~flag_o[1];
assign nstate[1] = ~state[2] & ~state[1] & state[0] | ~state[2] & state[1] & ~state[0];
assign nstate[0] = ~state[1] & ~state[0] & flag_o[0] | ~state[2] & state[1] & ~state[0] | state[2] & ~ state[1];
assign en[3] = state[2] & ~state[1] & ~state[0];
assign en[2] = ~state[2] & state[1] & state[0];
assign en[1] = ~state[2] & state[1] & ~state[0];
assign en[0] = ~state[2] & ~state[1] & state[0];
assign rst_ci = ~state[2] & ~state[1] & ~state[0] & flag_o[0] | state[2] & ~state[1] & state[0] & flag_o[1];

endmodule
