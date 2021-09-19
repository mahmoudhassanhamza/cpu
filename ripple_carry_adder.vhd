library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity ripple_carry_adder is 

  port(
    A , B    : in   std_logic_vector(2 downto 0);
    sum      : out  std_logic_vector(2 downto 0)
  );
  
end ripple_carry_adder;

architecture structure of ripple_carry_adder is 

component full_adder is
  port(
    a,b,cin   : in std_logic;
    cout,sum  : out std_logic
  );
  
end component;


signal carry_out : std_logic_vector(2 downto 0);
signal cin : std_logic := '0';
begin 
  
  
  G0: for i in A'range generate
    
  G1: if i = 0 generate
       F0: full_adder port map (a(i),b(i),cin,carry_out(i),sum(i));
      end generate; 
      
  G2:  if i > 0 generate 
        F0 : full_adder port map(a(i),b(i),carry_out(i-1),carry_out(i),sum(i));
      
      end generate;
    end generate;
  
end structure;




