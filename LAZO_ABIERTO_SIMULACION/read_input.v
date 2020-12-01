module read_input

(
    output reg [5:0] v_i,
    output reg [5:0] i_i
);

reg [11:0] v_i_memory [3:0]; // 4 filas de datos de 12bits cada dato, siendo los 6 primeros la tensión y los 6 últimos la corriente
integer i;
reg j;

initial begin
        $readmemb("v_i_input.txt",v_i_memory);
        // De momento solo se realiza una lectura
        forever begin 
                for (i=0; i<4; i=i+1)   
                begin
                {v_i,i_i} = v_i_memory[i]; // Se asignan los 6 primeros bits al reg de salida v_i y los 6 últimos al i_i
                #100000000; // nuevo dato cada 100ms
                j = i == 3 ? 1 : 0;
                end
                if(j)
                    begin
                    i = 0;
                    end
        end
end

endmodule
