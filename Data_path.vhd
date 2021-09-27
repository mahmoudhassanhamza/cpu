library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use IEEE.NUMERIC_STD.ALL;

entity Data_path is 
Generic (N : integer := 3;
M : integer:= 8);
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
end Data_path;



architecture behave of Data_path is 

component alu is 
Generic (N : integer := 3);
  port
  (
    a, b        : in  std_logic_vector( N-1 downto 0);
    op          : in  std_logic_vector( N-1 downto 0);
    y           : out std_logic_vector( N-1 downto 0);
    z_f,n_f,o_f : out std_logic;
    clk,en,reset: in std_logic
  );
  
end component; 
component register_file is 
Generic (N : integer := 3;
M : integer:= 8);

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
signal MUX_OP      : std_logic_vector(N-1 downto 0);
signal TEMP_SUM    : std_logic_vector(N-1 downto 0);
signal temp_QA     : std_logic_vector(N-1 downto 0);    
signal temp_QB     : std_logic_vector(N-1 downto 0);
signal WD_TEMP     : std_logic_vector(N-1 downto 0);
begin
    WD_TEMP <= D_WD;
MUX: process (D_IE)
begin
    if (D_IE = '1') then
        MUX_OP <= D_WD;
        else
        MUX_OP <= TEMP_SUM;
    end if;
end process;
TRI_BUFFER: 
process(D_OE,TEMP_SUM)
begin
    if (D_OE = '1') then
        D_output <= TEMP_SUM;
        else
        D_output <= (others => 'Z');
    end if;
end process;

REG_FILE: register_file port map (   
    WD            => MUX_OP,
    WAddr         => D_WAddr,
    write_sig     => D_write_sig,
    RA            => D_RA,
    RB            => D_RB,  
    RA_sig        => D_RA_sig,
    RB_sig        => D_RB_sig,
    rst           => D_rst, 
    clk           => D_clk,
    QA            => temp_QA,
    QB            => temp_QB
    );

ALU_block: alu port map (
        a        => temp_QA,
        b        => temp_QB,
        op       => ALU_OP,
        y        => TEMP_SUM,
        z_f      => D_z_f,
        n_f      => D_n_f,
        o_f      => D_o_f,
        clk      => D_clk,
        en       => ALU_EN,
        reset    => D_rst      

); 


end behave;