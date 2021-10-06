library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_arith.all;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;

entity Clock_Divider is 
port(   
        clk_in  : in  std_logic;
        clk_out : out std_logic := '0'
);
end entity;


architecture behave of Clock_Divider is
signal reg      : std_logic_vector(26 downto 0 ) := (others => '0');

begin 
process (clk_in)
begin 
    clk_out <= reg(0); 
    if rising_edge(clk_in)  then
        reg <= reg + 1;
    end if;
end process;

end behave;
