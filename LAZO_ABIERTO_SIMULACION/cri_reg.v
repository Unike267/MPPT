module cri_reg

(
    input       clk,
    input       rst,
    input       cri_i,
    input [3:0] en,
    output reg  cri  
);

always @(posedge clk)
    begin
        if(rst)
        cri <= 0;
        else if (en[2])
        cri <= cri_i;
        else
        cri <= cri;    
    end


endmodule
