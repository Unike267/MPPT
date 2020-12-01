module port_in

(
    input            clk,
    input            rst,
    input      [5:0] v_i,
    input      [5:0] i_i,
    input      [3:0] en,
    output reg [5:0] V,
    output reg [5:0] I   
);

always @(posedge clk)
    begin
        if(rst)
        V <= 0;
        else if (en[0])
        V <= v_i;
        else
        V <= V;
    end

always @(posedge clk)
    begin
        if(rst)
        I <= 0;
        else if (en[0])
        I <= i_i;
        else
        I <= I;
    end

endmodule
