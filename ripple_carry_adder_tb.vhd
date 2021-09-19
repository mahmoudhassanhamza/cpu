library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;


entity ripple_carry_adder_tb is 
end  ripple_carry_adder_tb;


architecture test of ripple_carry_adder_tb is 


component ripple_carry_adder is 
  --Generic(N : integer := 3);
  port(
    A , B    : in   std_logic_vector(2 downto 0);
    sum      : out  std_logic_vector(2 downto 0)
  );
  
end component;
signal A , B, sum : std_logic_vector ( 2 downto 0  ) ;
type int_array is array(integer range<>) of integer;
constant values : int_array := (0,-1,2,3,8);

begin
DUT : ripple_carry_adder port map ( a,b,sum);

--b <= (others => '0');
process 
  begin
for i in values'range loop
for j in values'range loop
a <= conv_std_logic_vector(values(i),3);
b <= conv_std_logic_vector(values(j),3);
wait for 1 ns;

assert( a + b = sum)
report "result doesnt match " severity warning;

wait for 9 ns;
end loop; 

end loop;
end process;

end test;

