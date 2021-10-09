
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use IEEE.NUMERIC_STD.ALL;

entity Data_path_tb is 
constant N            : integer :=3;
constant M            : integer :=2;

end Data_path_tb;
architecture behave of Data_path_tb is

    component Data_path is 
    Generic (N : integer := 3;
    M : integer:=2);
    port(
        D_WD              : in std_logic_vector (N-1 downto 0) ;
        D_IE              : in std_logic;
        D_OE              : in std_logic;
        ALU_OP            : in std_logic_vector (2 downto 0);
        ALU_EN            : in std_logic;
        D_WAddr           : in std_logic_vector (M-1 downto 0) ;
        D_write_sig       : in std_logic;
        D_RA              : in std_logic_vector(M-1 downto 0);
        D_RB              : in std_logic_vector(M-1 downto 0);
        D_RA_sig          : in std_logic;
        D_RB_sig          : in std_logic;
        D_rst,D_clk       : in std_logic;
        D_output          : out std_logic_vector(N-1 downto 0);
        D_z_f,D_n_f,D_o_f : out std_logic
    );
    end component;
    
    signal D_WD              :  std_logic_vector (N-1 downto 0) ;
    signal D_IE              :  std_logic;
    signal D_OE              :  std_logic;
    signal ALU_OP            :  std_logic_vector (2 downto 0);
    signal ALU_EN            :  std_logic;
    signal D_WAddr           :  std_logic_vector (M-1 downto 0) ;
    signal D_write_sig       :  std_logic;
    signal D_RA              :  std_logic_vector(M-1 downto 0);
    signal D_RB              :  std_logic_vector(M-1 downto 0);
    signal D_RA_sig          :  std_logic;
    signal D_RB_sig          :  std_logic;
    signal D_rst             :  std_logic;
    signal clk               :  std_logic:= '0';
    signal D_CLK_OP          :  std_logic;
    signal D_output          :  std_logic_vector(N-1 downto 0);
    signal D_z_f,D_n_f,D_o_f :  std_logic;
begin
DUT : Data_path port map (
D_WD,
D_IE,
D_OE,
ALU_OP,
ALU_EN,
D_WAddr,
D_write_sig,
D_RA,
D_RB,
D_RA_sig,
D_RB_sig,
D_rst,
clk,
D_output,
D_z_f,
D_n_f,
D_o_f
);
clk <= not clk after 1 ns;
process 
begin

    -- D_rst    <= '1' ;
    -- wait for 1 ns;
    -- D_rst <= '0';
--------------WRITE IN ADDRESS 0 ------------------------@@@ ASK WHY ADDRESS IS 8 BITS AND WE CAN ONLY ACCESS TILL VALUE OF 7 WHICH IS 3 bits
    D_IE <= '1';
    D_WD <= "001";
    D_OE <= '0';
    ALU_OP<= "---";
    ALU_EN <= '0';
    D_WAddr <= "00";
    D_write_sig <= '1';
    D_RA   <= "--"; 
    D_RB    <= "--"; 
    D_RA_sig   <= '0';  
    D_RB_sig    <= '0';
    D_rst       <= '0';   
    wait for 4 ns;    

--------------WRITE IN ADDRESS 1 ------------------------
    D_IE <= '1';
    D_WD <= "001";
    D_OE <= '0';
    ALU_OP<= "---";
    ALU_EN <= '0';
    D_WAddr <= "01";
    D_write_sig <= '1';
    D_RA   <= "--"; 
    D_RB    <= "--"; 
    D_RA_sig   <= '0';  
    D_RB_sig    <= '0';
    D_rst       <= '0';   
    wait for 4 ns;    

   
-----------  r1 + r2 ---------------------------
    D_IE <= '-';
    D_WD <= "---"; 
    D_OE <= '0';
    ALU_OP<= "000";
    ALU_EN <= '1';
    D_WAddr <= "--";
    D_write_sig <= '0';
    D_RA     <= "00";
    D_RB      <= "01";
    D_RA_sig   <= '1';  
    D_RB_sig    <= '1';
    wait for 4 ns;   



---------------STORE IN R3--------------


    D_IE        <= '0';
    D_WD        <= "---";
    D_OE        <= '0';
    ALU_OP      <= "---";
    ALU_EN      <= '0';
    D_WAddr     <= "10"; 
    D_write_sig <= '1';
    D_RA        <= "--"; 
    D_RB        <= "--"; 
    D_RA_sig    <= '-';  
    D_RB_sig    <= '-';
    D_rst       <= '0';  
    wait for 4 ns; 


------------ READ R3 ---------------------
    D_IE        <= '-';
    D_WD        <= "---";
    D_OE        <= '1';
    ALU_OP      <= "110";
    ALU_EN      <= '1';
    D_WAddr     <= "--";
    D_write_sig <= '0';
    D_RA        <= "10";
    D_RB        <= "--"; 
    D_RA_sig    <= '1';  
    D_RB_sig    <= '0';
    D_rst       <= '0';  
    wait for 4 ns; 





end process;


end behave;