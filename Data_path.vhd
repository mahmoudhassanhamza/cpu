library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use IEEE.NUMERIC_STD.ALL;

entity Data_path is 
begin 

Generic (N : integer := 3;
M : integer:= 3);
port(
    WD              : in std_logic_vector (N-1 downto 0) ;
    WAddr           : in std_logic_vector (M-1 downto 0) ;
    write_sig       : in std_logic;
    RA              : in std_logic_vector(M-1 downto 0);
    RB              : in std_logic_vector(M-1 downto 0);
    RA_sig          : in std_logic;
    RB_sig          : in std_logic;
    rst,clk         : in std_logic;
    Doutput         : out std_logic_vector(N-1 downto 0);
    z_f,n_f,o_f     : out std_logic
);
end Data_path;



architecture behave of Data_path is 

component alu is 
    
  port
  (
    a, b        : in  std_logic_vector( 2 downto 0);
    opcomponent          : in  std_logic_vector( 2 downto 0);
    y           : out std_logic_vector( 2 downto 0);
    z_f,n_f,o_f : out std_logic;
    clk,en,reset: in std_logic
  );
  
end component; 
component register_file is 
Generic (N : integer := 3;
M : integer:= 3);

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
begin






end behave;