
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use IEEE.NUMERIC_STD.ALL;

entity register_file_tb is
    constant N,M            : integer :=3;

end entity;

architecture behave of register_file_tb is 

component register_file is 

Generic (N,M: integer);
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
end component;

signal  WD              :  std_logic_vector (N-1 downto 0) ;
signal  WAddr           :  std_logic_vector (M-1 downto 0) ;
signal  write_sig       :  std_logic;
signal  RA              :  std_logic_vector(M-1 downto 0);
signal  RB              :  std_logic_vector(M-1 downto 0);
signal  RA_sig          :  std_logic;
signal  RB_sig          :  std_logic;
signal  rst,clk         :  std_logic := '0';
signal  QA,QB           :  std_logic_vector(N-1 downto 0);
begin

    DUT : register_file
   generic map (N,M)
    port map(WD  , WAddr, write_sig, RA,RB, RA_sig, RB_sig, rst, clk, QA, QB);
    clk <= not clk after 2 ns;

process
    begin
        write_sig <= '1';
        for i in 3 downto 0 loop
            WAddr <= conv_std_logic_vector(i,4);
            WD    <= conv_std_logic_vector(i,4);
            wait for 5 ns;
        end loop;
        RA_sig <= '1' ;
        RB_sig <= '1' ;
        for i in 3 downto 1 loop
            RA     <= conv_std_logic_vector(i,4);
            RB     <= conv_std_logic_vector(i,4);
            wait for 1 ns;
        end loop;
        write_sig <= '0';
        rst    <= '1' ;
        wait for 2 ns;
        rst <= '0';
        for i in 3 downto 0 loop
            RA     <= conv_std_logic_vector(i,4);
            RB     <= conv_std_logic_vector(i,4);
            wait for 1 ns;
        end loop;
end process;

end behave;

