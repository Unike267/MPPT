library ieee;
context ieee.ieee_std_context;

entity cnt_iter is
  port (
    clk    : in  std_logic;
    rst    : in  std_logic;
    rst_ci : in  std_logic;
    c_i    : out std_logic_vector(13 downto 0)
  );
end entity;

architecture arch of cnt_iter is

  signal cnt, cnt_n : unsigned(13 downto 0);

begin

  cnt <= cnt_n when rising_edge(clk);
  cnt_n <= (others=>'0') when rst or rst_ci else cnt + 1;

  c_i <= std_logic_vector(cnt);

end;
