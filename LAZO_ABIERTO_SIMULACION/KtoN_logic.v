module KtoN_logic

(
    input      [5:0] cnt,
    output     [8:0] KN
);

assign KN[8] = cnt[5] & cnt[3] & cnt[2] & cnt[0] | cnt[5] & cnt[3] & cnt[2] & cnt[1] | cnt[5] & cnt[4];
assign KN[7] = ~cnt[5] & cnt[3] & cnt[2] & cnt[0] | ~cnt[5] & cnt[3] & cnt[2] & cnt[1] | ~cnt[5] & cnt[4] | cnt[5] & ~cnt[4] & ~cnt[3] | cnt[5] & ~cnt[4] & ~cnt[2] |  cnt[5] & ~cnt[4] & ~cnt[1] & ~cnt[0];
assign KN[6] = ~cnt[4] & ~cnt[3] |  ~cnt[4] & ~cnt[2] | ~cnt[4] & ~cnt[1] & ~cnt[0] | cnt[4] & cnt[3] & cnt[2] & cnt[0] | cnt[4] & cnt[3] & cnt[2] & cnt[1];
assign KN[5] = ~cnt[3] & cnt[2] & cnt[0] | ~cnt[3] & cnt[2] & cnt[1] | cnt[3] & ~cnt[2] | cnt[3] & ~cnt[1] & ~cnt[0];
assign KN[4] = ~cnt[2] & cnt[0] | ~cnt[2] & cnt[1] | cnt[2] & ~cnt[1] & ~cnt[0];
assign KN[3] = ~cnt[1] & ~cnt[0] | cnt[1] & cnt[0];
assign KN[2] = ~cnt[0];
assign KN[1] = 0;
assign KN[0] = 0;


endmodule
