module pot_reg

(
    input             clk,
    input             rst,
    input      [11:0] P,
    input      [3:0]  en,
    output reg [11:0] pot_act,
    output reg [11:0] pot_ant   
);

reg [11:0] pot_inter; //Valor intermedio, para rellenar pot_ant con el dato de potencia anterior

always @(posedge clk)
    begin
        if(rst)
        pot_act <= 0;
        else if (en[1])
        pot_act <= P;
        else
        pot_act <= pot_act;
    end

always @(posedge clk)
    begin
        if(rst)
        pot_inter <= 0;
        else if (~en[1])
        pot_inter <= pot_act;
        else
        pot_inter <= pot_inter;
    end

always @(posedge clk)
    begin
        if(rst)
        pot_ant <= 0;
        else if (en[1])
        pot_ant <= pot_inter;
        else
        pot_ant <= pot_ant;
    end

endmodule
