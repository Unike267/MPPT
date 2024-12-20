library ieee;
context ieee.ieee_std_context;

entity dec is
  port (
    state  : in  std_logic_vector(2 downto 0);
    flag_o : in  std_logic_vector(1 downto 0);
    nstate : out std_logic_vector(2 downto 0);
    en     : out std_logic_vector(3 downto 0);
    rst_ci : out std_logic
  );
end entity;

architecture arch of dec is

begin

  nstate(2) <= state ?= "011" or
               state ?= "100" or
               (state ?= "10-" and not flag_o(1));
  nstate(1) <= state ?= "001" or
               state ?= "010";
  nstate(0) <= (state ?= "-00" and flag_o(0)) or
               state ?= "010" or
               state ?= "10-";

  en(3) <= state ?= "100";
  en(2) <= state ?= "011";
  en(1) <= state ?= "010";
  en(0) <= state ?= "001";

  rst_ci <= (state ?= "000" and flag_o(0)) or
            (state ?= "101" and flag_o(1));

end;
