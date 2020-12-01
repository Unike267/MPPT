module port_out

(
    input       clk,
    input       rst,
    input       out_i,
    output reg  out
);

always @(negedge clk)
    begin
        if(rst)
        out <= 0;
        else
        out <= out_i;
    end
endmodule
