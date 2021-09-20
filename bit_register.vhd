
-- library ieee;
-- use ieee.std_logic_1164.all;
-- use ieee.std_logic_arith.all;
-- use ieee.std_logic_signed.all;

-- entity bit_register is 
-- port(
--     D,en,clk,rst : in std_logic;
--     Q            : out std_logic

-- );
-- end bit_register;

-- architecture behav of bit_register is 


-- begin 

--     process (clk,rst)
--     begin 
--         if (rst = '1') then
--             Q <= '0';
--         elsif rising_edge(clk) then
--             if en = '1' then
--                 Q <= D;
--             end if;      -- else keep the value
--         end if;
--     end process; 
-- end architecture;