library ieee;
context ieee.ieee_std_context;

entity flag is
  port (
    c_i    : in  std_logic_vector(13 downto 0);
    flag_i : out std_logic_vector(1 downto 0)
  );
end entity;

architecture arch of flag is

begin

  flag_i(1) <= c_i ?= "00000011000110";
  flag_i(0) <= c_i ?= "11101010010000";

end;
