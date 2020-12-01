module out_logic

(
    input            E,
    input      [8:0] TE,
    input      [8:0] cnt_pwm,
    input            out,
    output           out_i
);

/*
    SI E=1 -> OUT=1, SI cnt_pwm[8:0] (PROVENIENTE DEL PWM REGS) = TE[8:0] COMP=1 
    Y E=0 -> OUT=0 Y SI E=0 Y COMP=0 OUT=OUT_ANT
*/

wire COMP;
wire NEGOR;

assign COMP = TE == cnt_pwm ? 1 : 0;
assign NEGOR = COMP ~| E;

assign out_i = E | NEGOR & out;

endmodule
