library ieee;
use ieee.std_logic_1164.all;
entity Clock_Divider_tb is 
end entity;


architecture behave of Clock_Divider_tb is

component Clock_Divider is 
    port(   
            clk_in  : in  std_logic;
            clk_out : out std_logic
        );
    end component;
    signal clk_in, clk_out : std_logic := '0';
    
    
    begin 
    DUT: Clock_Divider port map (clk_in,clk_out) ;
    clk_in <= not clk_in after 5  ns;

    end behave;