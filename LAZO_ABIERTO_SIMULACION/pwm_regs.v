module pwm_regs

(
    input             clk,
    input             rst,
    input             rst_ci,
    input      [8:0]  KN,
    output reg [13:0] c_i,
    output reg        E,
    output reg [8:0]  TE,
    output reg [8:0]  cnt_pwm  
);

always @(posedge clk)
    begin
        if (rst)
        cnt_pwm <= 0;
        else if (cnt_pwm == 9'b101001101)
        cnt_pwm <= 0; 
        else
        cnt_pwm <= cnt_pwm + 1;
    end

always @(posedge clk)
    begin
        if(rst)
        c_i <= 0;
        else if(rst_ci)
        c_i <= 0;        
        else if (cnt_pwm == 9'b101001101)
        c_i <= c_i + 1; // Ya que clk va a 1MHz contando hasta 333 c_i aumenta a frecuencia de 3KHz 
        else
        c_i <= c_i;
    end

always @(posedge clk)
    begin
        if(rst)
        E <= 0;
        else if (cnt_pwm == 9'b101001101)
        E <= 1;
        else
        E <= 0;
    end

always @(posedge clk)
    begin
        if(rst)
        TE <= 0;
        else
        TE <= KN;
    end

endmodule
