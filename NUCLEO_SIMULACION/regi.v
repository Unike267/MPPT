module regi

(
    input            clk,
    input            rst,
    input      [2:0] nstate,
    input      [1:0] flag_i,
    output reg [2:0] state,
    output reg [1:0] flag_o          
);

always @(negedge clk)
    begin
        if(rst)
        state <= 0;
        else
        state <= nstate;
    end

always @(negedge clk)
    begin
        if(rst)
        flag_o <= 0;
        else
        flag_o <= flag_i;
    end
        
endmodule
