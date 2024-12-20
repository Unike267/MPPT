`timescale 1ns/10ps
module tb;

reg clk;
reg rst;

initial begin
        clk=0;
        forever begin
            #10
            clk = ~clk; //clk a 1/20x10^⁻9 = 50MHz
        end
end

initial begin
        rst = 1;
        #15
        rst = 0;
end

initial begin
        $dumpvars(0);
        #800000
        $finish;
end

wire [13:0] c_i;
wire rst_ci;

cnt_iter dut0
(
    .clk    (clk),
    .rst    (rst),
    .rst_ci (rst_ci),
    .c_i    (c_i[13:0])
);

wire [1:0] flag_i;

flag dut1
(
    .c_i    (c_i[13:0]),
    .flag_i   (flag_i[1:0])
);

wire [2:0] state;
wire [1:0] flag_o;
wire [2:0] nstate; //nstate significa nextstate o estado siguiente

regi dut2
(
    .clk    (clk),
    .rst    (rst),
    .nstate (nstate[2:0]),
    .flag_i (flag_i[1:0]),
    .state  (state[2:0]),
    .flag_o (flag_o[1:0])
);

wire [3:0] en;

dec dut3
(
    .state  (state[2:0]),
    .flag_o (flag_o[1:0]),
    .nstate (nstate[2:0]),
    .en     (en[3:0]),
    .rst_ci (rst_ci)
);

endmodule
