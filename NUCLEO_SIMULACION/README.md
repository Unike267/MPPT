### SIMULACIÓN DEL NÚCLEO

Para visualizar la simulación del núcleo, el cual se encarga de habilitar los registros de operaciones que efectúan el algoritmo MPPT así como de apuntar al estado siguiente y activar el rst_ci, se ha de ejecutar los siguientes comandos desde la terminal:

UbicaciónDeLosArchivos$ iverilog nucleo_top.v cnt_iter.v  flag.v regi.v dec.v -o nucleo_demo

UbicaciónDeLosArchivos$ vvp nucleo_demo -lxt2

UbicaciónDeLosArchivos$ gtkwave dump.lx2





