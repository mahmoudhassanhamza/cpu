library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;



entity alu is 
    
  port
  (
    a, b        : in  std_logic_vector( 2 downto 0);
    op          : in  std_logic_vector( 2 downto 0);
    y           : out std_logic_vector( 2 downto 0);
    z_f,n_f,o_f : out std_logic;
    clk,en,reset: in std_logic
  );
  
end alu; 


architecture structure of alu is 

component ripple_carry_adder is 

  port(
    A , B    : in   std_logic_vector(2 downto 0);
    sum      : out  std_logic_vector(2 downto 0)
  );
  
end component;
signal tmp_add, tmp_sub,b_dash,neg_b,tmp_sum      : std_logic_vector(2 downto 0);
signal over_flow_add_check1,over_flow_add_check2  :std_logic;   
signal over_flow_sub_check1,over_flow_sub_check2  :std_logic;
signal o_f_tmp                                    :std_logic;
signal z_f_temp                                    :std_logic := '0';
constant ZERO                                     : std_logic_vector(2 downto 0 ) := (others =>'0');
constant ONE                                      : std_logic_vector(2 downto 0 ) := (0=>'1', others =>'0');

begin 
  
 MULTI_INPUT_OR:  
  process(tmp_sum)
    begin
      for i in tmp_sum'range loop
        z_f_temp <= tmp_sum(i) or z_f_temp;
      end loop;
    end process;
    
  over_flow_add_check1 <= (not a(2)) and (not b(2)) and tmp_sum(2) and (not op(0)) and (not op(1)) and (not op(2));
  over_flow_add_check2 <= ( a(2)) and ( b(2)) and (not tmp_sum(2)) and (not op(0)) and (not op(1)) and (not op(2));
  over_flow_sub_check1 <= (not a(2)) and  b(2) and tmp_sum(2) and (not op(0)) and (not op(1)) and (op(2));
  over_flow_sub_check2 <= ( a(2)) and  (not b(2)) and (not tmp_sum(2)) and (not op(0)) and (not op(1)) and (op(2));
  o_f_tmp <= over_flow_add_check1 or over_flow_add_check2 or over_flow_sub_check1 or over_flow_sub_check2;
  SUM0 : ripple_carry_adder port map (A , B ,tmp_add);
  b_dash <= not b;
  SUM1 :ripple_carry_adder port map (b_dash ,ONE, neg_b);
  SUB0 :ripple_carry_adder port map (A , neg_b ,tmp_sub);

  
  with op select tmp_sum <= 
  a               when "110",
  not a           when "101",
  a xor b         when "100",
  a and b         when "010",
  a or b          when "011",
  tmp_sub         when "001",
  tmp_add         when "000",
  ZERO            when others;
  


  process (reset, clk) 
  begin
    if reset = '1' then 
      y   <= "000";
      z_f <= '0';
      n_f <= '0';
      o_f <= '0';
    
    elsif clk'event and clk = '1' then
      if en = '1' then
        y <= tmp_sum;
        n_f <= tmp_sum(2);
        z_f <= not z_f_temp;
        o_f <= o_f_tmp;
      end if;
    end if; 

    end process;
end structure;









