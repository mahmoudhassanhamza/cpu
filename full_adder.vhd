library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity full_adder is
  port(
    a,b,cin   : in std_logic;
    cout,sum  : out std_logic
  );
  
end full_adder;

architecture structure of full_adder is 

begin
  
cout <= ( a and b ) or ( a and cin) or (b and cin);
sum  <=  a xor b xor cin;

end structure;



