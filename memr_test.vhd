
library ieee;
use ieee.std_logic_1164.all;
library modelsim_lib;
use modelsim_lib.util.all;


entity memr_test is 
begin
end memr_test;

architecture behave of memr_test is
    type program is array (natural range <>) of std_logic_vector(15 downto 0);

    component memory IS
    PORT
    (
        address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        clock		: IN STD_LOGIC  := '1';
        data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        wren		: IN STD_LOGIC ;
        q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
    END component;

signal    address	:  STD_LOGIC_VECTOR (7 DOWNTO 0);
signal    clock		:  STD_LOGIC  := '1';
signal    data		:  STD_LOGIC_VECTOR (15 DOWNTO 0);
signal    wren		:  STD_LOGIC ;
signal    q		    :  STD_LOGIC_VECTOR (15 DOWNTO 0);
signal    t_ram     :  program (0 to 255);
begin
    dut: memory port map
    (
        address,
        clock,
        data,
        wren,
        q
    );
process
begin
    init_signal_spy("/memr_test/dut/RAM","/t_ram",1);

wait for 50 ns;

end process;


end behave;

