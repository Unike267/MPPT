library ieee;
context ieee.ieee_std_context;

entity regi is
  port (
    clk    : in  std_logic;
    rst    : in  std_logic;
    nstate : in  std_logic_vector(2 downto 0);
    flag_i : in  std_logic_vector(1 downto 0);
    state  : out std_logic_vector(2 downto 0);
    flag_o : out std_logic_vector(1 downto 0)
  );
end entity;

architecture arch of regi is

  signal st_n : std_logic_vector(2 downto 0);
  signal flag_n : std_logic_vector(1 downto 0);

begin

  state <= st_n when falling_edge(clk);
  st_n <= (others=>'0') when rst else nstate;

  flag_o <= flag_n when falling_edge(clk);
  flag_n <= (others=>'0') when rst else flag_i;

end;
