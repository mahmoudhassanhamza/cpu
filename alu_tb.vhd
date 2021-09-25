
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use work.print.all;
entity alu_tb is 
end alu_tb;

architecture behave of alu_tb is 


component alu is 
  generic (N : integer := 3 ) ;
  port
  (
    a, b        : in  std_logic_vector( N-1 downto 0);
    op          : in  std_logic_vector( N-1 downto 0);
    y         : out std_logic_vector( N-1 downto 0);
    z_f,n_f,o_f : out std_logic;
    clk,en,reset: in std_logic

  );
  
end component; 
    constant N : integer := 3;
    signal a, b        :   std_logic_vector( N-1 downto 0);
    signal op          :   std_logic_vector( N-1 downto 0);
    signal sum         :   std_logic_vector( N-1 downto 0);
    signal z_f,n_f,o_f :   std_logic;
    signal clk,en,reset:   std_logic :='0';
    type int_array is array(integer range<>) of integer; 
    constant A_values : int_array := (-1,-2,-3,-4,-5,-6,-7,0,1,2,3,4,5,6,7);
    constant B_values : int_array := (-1,-2,-3,-4,-5,-6,-7,0,1,2,3,4,5,6,7);
    constant op_values : int_array := (-1,-2,-3,-4,-5,-6,-7,0,1,2,3,4,5,6,7);

begin
  DUT : alu 
  port map (a,  b, op , sum, z_f, n_f, o_f,clk,en,reset);



    clk <= not clk after 5 ns;
    en <= not en after 8 ns;
    reset  <='1','0'after 1 ns, '1' after 180 ns,'0' after 300 ns;
     
    process
    begin   
    for i in A_values'range loop
      -- for j in A_values'range loop

      a <= conv_std_logic_vector(A_values(i),3);
      b <= conv_std_logic_vector(B_values(i),3);
      op <= conv_std_logic_vector(op_values(i),3);
      wait for 6 ns;

      assert (o_f = '0') report "We have an overflow " & print_number(a) & "+" & print_number(b) & "=" & print_number(sum) severity note; 
      wait for 3 ns;

      wait for 1 ns;
      -- end loop;

  end loop;
end process;
  
end behave;





