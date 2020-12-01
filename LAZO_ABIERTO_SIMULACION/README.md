### SIMULACIÓN DEL DISEÑO COMPLETO EN LAZO ABIERTO

La simulación en lazo abierto consiste en introducir los datos de tensión y corriente mediante un txt llamado "v_i_input.txt" y comprobar el correcto funcionamiento del diseño. Las diferentes entradas se repetirán en bucle mientras transcurre la simulación y la PWM de salida NO se realimentará ni provocará una cambio en la entrada tal y como ocurre en la simulación en lazo cerrado.

Para visualizar la simulación del diseño completo en lazo abierto se han de ejecutar los siguientes comandos desde la terminal:

UbicaciónDeLosArchivos$ iverilog nucleo_top.v cri_logic.v cri_reg.v decoder.v flags.v KtoN_logic.v mult_logic.v out_logic.v port_in.v port_out.v pot_reg.v pwm_regs.v read_input.v registros_nucleo.v u_d_counter.v -o arqui_demo

UbicaciónDeLosArchivos$ vvp arqui_demo -lxt2

UbicaciónDeLosArchivos$ gtkwave dump.lx2

