module cri_logic

(    
    input      [11:0] pot_act,
    input      [11:0] pot_ant,
    input             cri,
    output            cri_i
);

/*
    SI pot_act > pot_ant MY=1, SI pot_act == pot_ant IG=1, SI pot_act < pot_ant MN=1
    DADO EL CARACTER DE LA OPERACIÓN UNO DE LOS 3 CABLES SERÁ 1 Y EN CONSECUENCIA
    SE PROCEDE A CALCULAR EL CRITERIO SEGÚN EL CRITERIO ANTERIOR
*/

wire MY;
wire IG;
wire MN;

assign MY = pot_act > pot_ant ? 1 : 0;
assign IG = pot_act == pot_ant ? 1 : 0;
assign MN = pot_act < pot_ant ? 1 : 0;

assign cri_i = MY & cri | IG & cri | MN & ~cri;

endmodule
