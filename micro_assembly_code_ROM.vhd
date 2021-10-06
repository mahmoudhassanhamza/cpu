
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;
use work.code.all;

entity micro_assembly_code_ROM is 
port (
    A_6_3        : in std_logic_vector (6 downto 3 );
    A_2          : in std_logic;
    A_1_0        : in std_logic_vector (1 downto 0 );
    M_instr      : out Minstruction
);
end micro_assembly_code_ROM;

architecture behave of micro_assembly_code_ROM is
    -- 
    constant allinstr: instruction := (
    ('0','0', "000",'1','1','1','1','0','0','0','-' ),-- R1 = r2 + r3
    ('0','0', "111",'1','0','1','1','1','1','1','-' ),-- address = pc + 1 and read mem(address)
    ('0','0', "000",'0','0','0','0','0','1','0','-' )    --NOP?
    );
begin


    M_instr <= allinstr(to_integer(ieee.NUMERIC_STD.UNSIGNED(A_6_3 & A_2 & A_1_0)));

end behave;
