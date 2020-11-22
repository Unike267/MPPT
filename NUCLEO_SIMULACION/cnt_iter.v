module cnt_iter

(
    input               clk,
    input               rst,
    input               rst_ci,
    output reg [13:0]   c_i          
);

always @(posedge clk)
    begin   
        if(rst)
        c_i <= 0;
        else if (rst_ci)
        c_i <= 0;
        else
        c_i <= c_i + 1;
    end

endmodule
