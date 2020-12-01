module u_d_counter

(
    input            clk,
    input            rst,
    input            cri,
    input      [3:0] en,
    output reg [5:0] cnt 
);

// UP/DOWN COUNTER TRAS RST se inicia A 23 QUE EQUIVALE A DC = 0,5

always @(posedge clk)
begin
    if(rst)
    cnt <= 6'b010111;
    else if (en[3])
        begin
            if(cri)
            cnt <= cnt + 1;
            else
            cnt <= cnt - 1;
        end
    else
    cnt <= cnt;
end

endmodule
