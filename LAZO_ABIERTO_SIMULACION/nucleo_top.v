`timescale 1ns/10ps

module nucleo_top;

reg clk;
reg rst;

initial begin
        clk = 0;
        forever begin
                #500 // A 1 MHz
                clk = ~clk;        
        end
end

initial begin
        rst = 1;
        #750
        rst = 0;
end

initial begin
        $dumpvars(0);
        #8000000000 // Duración de la simulación 8s
        $finish;
end

wire [13:0] c_i;
wire [1:0]  flag_i; 

// Combinacional que según el estado del contador de iteraciones (c_i) activa una de las dos flags

flags dut0
(
    .c_i      (c_i[13:0]),
    .flag_i   (flag_i[1:0])
);

wire [2:0] state;
wire [1:0] flag_o;
wire [2:0] nstate; // nstate -> NextSTATE; es decir estado siguiente
wire [3:0] en;     //enables; 4 enables para los cuatro estados de operaciones
wire       rst_ci;

// Combinacional encargado de decodificar el estado siguiente, los enables y el reset del contador de iteraciones (c_i)

decoder dut1
(
    .state  (state[2:0]),
    .flag_o (flag_o[1:0]),
    .nstate (nstate[2:0]),
    .en     (en[3:0]),
    .rst_ci (rst_ci)
);

// Registros asociados al núcleo

registros_nucleo dut2
(
    .clk    (clk),
    .rst    (rst),
    .nstate (nstate[2:0]),
    .flag_i (flag_i[1:0]),    
    .state  (state[2:0]),
    .flag_o (flag_o[1:0])
);

wire [5:0] v_i;
wire [5:0] i_i;

// Se insertan datos de entrada a través de un txt

read_input dut3
(
    .v_i    (v_i[5:0]),
    .i_i    (i_i[5:0])
);

wire [5:0] V;
wire [5:0] I;

// Registro del puerto de entrada susceptible al enable 0; el cual guarda la tensión y la corriente entrante

port_in dut4
(
    .clk    (clk),
    .rst    (rst),
    .v_i    (v_i[5:0]),
    .i_i    (i_i[5:0]),
    .en     (en[3:0]),
    .V      (V[5:0]),
    .I      (I[5:0])  
);

wire [11:0] P;

// Combinacional de diseño propio que realiza la multiplicación, obteniendo la potencia

mult_logic dut5
(
    .V      (V[5:0]),
    .I      (I[5:0]),
    .P      (P[11:0])
);

wire [11:0] pot_act;
wire [11:0] pot_ant;

// Registro de potencias, susceptible al enable 1.

pot_reg dut6
(
    .clk        (clk),
    .rst        (rst),
    .P          (P[11:0]),
    .en         (en[3:0]),
    .pot_act    (pot_act[11:0]),
    .pot_ant    (pot_ant[11:0])
);

wire cri_i; // Salida del combinacional cri
wire cri;   // Salida del registro cri

// Combinacional que realiza el criterio segun las potencias

cri_logic dut7
(
    .pot_act    (pot_act[11:0]),
    .pot_ant    (pot_ant[11:0]),
    .cri        (cri),
    .cri_i      (cri_i)
);

// Registro criterio

cri_reg dut8
(
    .clk        (clk),
    .rst        (rst),
    .en         (en[3:0]),
    .cri        (cri),
    .cri_i      (cri_i)
);

wire [5:0] cnt;

// UP/DOWN counter

u_d_counter dut9
(
    .clk        (clk),
    .rst        (rst),
    .en         (en[3:0]),
    .cri        (cri),
    .cnt        (cnt[5:0])
);

wire [8:0] KN;

// Combinacional que realiza la transformación del número de salida del UP/DOWN cnt al nº fin de cuenta

KtoN_logic dut10
(
    .cnt        (cnt[5:0]),
    .KN         (KN[8:0])
);

wire E;
wire [8:0] TE;
wire [8:0] cnt_pwm;

// Secuenciales para generar la PWM

pwm_regs dut11
(
    .clk        (clk),
    .rst        (rst),
    .rst_ci     (rst_ci),
    .KN         (KN[8:0]),
    .c_i        (c_i[13:0]),
    .E          (E),
    .TE         (TE[8:0]),
    .cnt_pwm    (cnt_pwm[8:0])
);

wire out_i; // Salida del combinacional out
wire out;   // Salida del registro port out

// Combinacional que realiza la salida PWM

out_logic dut12
(
    .E          (E),
    .TE         (TE[8:0]),
    .cnt_pwm    (cnt_pwm[8:0]),
    .out        (out),
    .out_i      (out_i)
);

// Registro del puerto de salida

port_out dut13

(
    .clk        (clk),
    .rst        (rst),
    .out_i      (out_i),
    .out        (out)

);


endmodule
