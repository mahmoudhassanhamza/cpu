
library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_arith.all; DONOT USE THEM AGAIN 
-- use ieee.std_logic_signed.all;DONOT USE THEM AGAIN 
use IEEE.NUMERIC_STD.ALL;

entity register_file is 
Generic (N : integer ;
M : integer);

port(
    WD              : in std_logic_vector (N-1 downto 0) ;
    WAddr           : in std_logic_vector (M-1 downto 0) ;
    write_sig       : in std_logic;
    RA              : in std_logic_vector(M-1 downto 0);
    RB              : in std_logic_vector(M-1 downto 0);
    RA_sig          : in std_logic;
    RB_sig          : in std_logic;
    rst,clk         : in std_logic;
    QA,QB           : out std_logic_vector(N-1 downto 0)
);
end register_file;

architecture behave of register_file is 

type memory_type is array(0 to 2**M-1) of std_logic_vector(N-1 downto 0 );
signal rf_mem  : memory_type;
begin 
    process (RA,RB,RA_sig,RB_sig,rf_mem)
    begin

        if(RA_sig = '1' ) then   
             QA <= rf_mem(to_integer(UNSIGNED (RA)));
        end if;
        if(RB_sig = '1') then
            QB <= rf_mem(to_integer(UNSIGNED (RB)));
        end if;

    end process;
------------------------- test writing to a memory cell that you are reading currenlty
    process (clk,rst)
    begin

        if (rst = '1') then
            rf_mem <= (others => (others => '0') );
        elsif  rising_edge(clk) then
            if (write_sig = '1') then
                rf_mem (to_integer(UNSIGNED (WAddr))) <= WD;
            end if;

        end if;
    end process;


end behave;