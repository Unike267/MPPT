library ieee;
context ieee.ieee_std_context;

entity tb is
end entity;

architecture test of tb is

  signal clk, rst, rst_ci : std_logic := '0';
  signal flag_i, flag_o : std_logic_vector(1 downto 0);
  signal state, nstate : std_logic_vector(2 downto 0); --nstate significa nextstate o estado siguiente
  signal en : std_logic_vector(3 downto 0);
  signal c_i : std_logic_vector(13 downto 0);

begin

  clk <= not clk after 20 ns; -- 50 MHz

  process
  begin
    report "Start simulation";
    rst <= '1';
    wait for 50 ns;
    rst <= '0';
    wait for 1 ms;
    report "End simulation";
    std.env.stop(0);
  end process;

  dut0: entity work.cnt_iter
  port map (
    clk    => clk,
    rst    => rst,
    rst_ci => rst_ci,
    c_i    => c_i
  );

  dut1: entity work.flag
  port map (
    c_i    => c_i,
    flag_i => flag_i
  );

  dut2: entity work.regi
  port map (
      clk    => clk,
      rst    => rst,
      nstate => nstate,
      flag_i => flag_i,
      state  => state,
      flag_o => flag_o
  );

  dut3: entity work.dec
  port map (
      state  => state,
      flag_o => flag_o,
      nstate => nstate,
      en     => en,
      rst_ci => rst_ci
  );

end;
