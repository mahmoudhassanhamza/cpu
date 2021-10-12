
library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;
use work.code.all;

entity MROM_tb is 

end MROM_tb; 

architecture behave of MROM_tb is 
component micro_assembly_code_ROM is 
port (
    A_6_3        : in std_logic_vector (6 downto 3 );
    A_2          : in std_logic;
    A_1_0        : in std_logic_vector (1 downto 0 );
    M_instr      : out Minstruction
);
end component;
signal    A_6_3        : std_logic_vector (6 downto 3 );
signal    A_2          : std_logic;
signal    A_1_0        : std_logic_vector (1 downto 0 );
signal    M_instr      : Minstruction;

begin
DUT : micro_assembly_code_ROM
port map(
    A_6_3     ,  
    A_2       ,   
    A_1_0     ,   
    M_instr      
);
process
begin
    A_6_3 <= "1010";
    A_2   <= '0';
    A_1_0 <= "00";
    wait for 2 ns;
    A_1_0 <= "01";
    wait for 2 ns;
    A_1_0 <= "10";
    wait for 2 ns;
    A_1_0 <= "11";

end process;

end behave; 
