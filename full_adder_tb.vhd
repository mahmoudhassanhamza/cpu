
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity full_adder_tb is 
  --port()
end full_adder_tb;
  
architecture behave of  full_adder_tb is
component full_adder is
  port(
    a,b,cin   : in std_logic;
    cout,sum  : out std_logic
  );
  
end component;
signal a,b,cin    :    std_logic := '0';
signal cout, sum  :    std_logic := '0';
   
begin 
  DUT : full_adder 
  port map (a,b,cin,cout,sum);
    
  a <= not(a) after 5ns ;
  b <= not(b) after 10 ns;    
      
      
end behave; 
