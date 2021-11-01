library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity OneChip_tb is 
end entity; 

architecture behave of OneChip_tb is
    component OneChip is 
    generic(N:integer;M:integer);
    port(clk,rst : in std_logic);
end component;
    signal clk,rst    : std_logic := '0'; 
    constant N:integer:=16;
    constant M:integer:=3;
begin
clk <= not clk after 5 ns;
rst <= '1', '0' after 3 ns;
DUT : OneChip Generic map (N => N , M => M)
Port map (
clk,rst
);
end behave ; -- behave
