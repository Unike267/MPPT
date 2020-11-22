# ARQUITECTURA EMBEBIDA PARA EJECUTAR UN ALGORITMO MPPT

Se procede a diseñar, simular e implementar una arquitectura embebida en verilog que ejecute un algoritmo MPPT para aprovechar al máximo la potencia generada por una placa solar.

### DISEÑO

El procedimiento del diseño está al margen de este repositorio. Es consecuencia de bastante tiempo de investigación sobre asuntos de electrónica digital. El resultado se verá reflejado en el proceso de simulación e implementación del diseño final adoptado.

### SIMULACIÓN

Para realizar la simulación del diseño se describirá la arquitectura dividida en tres módulos: NÚCLEO, OPERACIONES y PWM_MODULE.
Una vez comprobado el funcionamiento de cada uno de los módulos por separado, se realizará el conjunto y se comprobará en simulación.
Para comprobar en simulación el correcto funcionamiento de los códigos en verilog elaborados se utilizará el visualizador GTKWAVE.

### IMPLEMENTACIÓN

La implementación se abordará desde el programa ice-studio y la FPGA donde se trasladará la arquitectura final sera la ICE40 de Lattice.
