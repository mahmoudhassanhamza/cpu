library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
-- use ieee.std_logic_signed.all;
-- use IEEE.NUMERIC_STD.ALL;
use work.code.all;


entity Data_path is 
Generic (N : integer;
M : integer);
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
    BypassB           : in std_logic;
    BypassA           : in std_logic;
    BypassC           : in std_logic;
    BypassD           : in std_logic;
    offset            : in std_logic_vector(N-1 downto 0);
    D_output          : out std_logic_vector(N-1 downto 0);
    D_z_f,D_n_f,D_o_f : out std_logic
);
end Data_path;



architecture behave of Data_path is 

component Clock_Divider is 
port(   
        clk_in  : in  std_logic;
        clk_out : out std_logic
);
end component;


component alu is 
Generic (N : integer );
  port
  (
    a, b        : in  std_logic_vector( N-1 downto 0);
    op          : in  std_logic_vector( 2 downto 0);
    y           : out std_logic_vector( N-1 downto 0);
    z_f,n_f,o_f : out std_logic;
    clk,en,reset: in std_logic
  );
  
end component; 

component register_file is 
Generic (N : integer;
M : integer);

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
signal MUX_OP         : std_logic_vector(N-1 downto 0);
signal TEMP_SUM       : std_logic_vector(N-1 downto 0);
signal temp_QA        : std_logic_vector(N-1 downto 0);    
signal temp_QB        : std_logic_vector(N-1 downto 0);
signal temp_QB2       : std_logic_vector(N-1 downto 0);
signal temp_QA2       : std_logic_vector(N-1 downto 0);
signal temp_clk       : std_logic;
signal RA_sig_ored    : std_logic;
signal write_sig_ored : std_logic;
signal D_output1      : std_logic_vector(N-1 downto 0);
signal RA_temp        : std_logic_vector(M-1 downto 0);
signal WAddr_temp     : std_logic_vector(M-1 downto 0);
begin

MUX1: process (D_IE,D_WD,TEMP_SUM)
begin
    if (D_IE = '1') then
        MUX_OP <= D_WD;
        else
        MUX_OP <= TEMP_SUM;
    end if;
end process;
BYPASSMUXB: process (BypassB,D_clk,offset,temp_QB,D_RA,D_WAddr)
begin
    if (BypassB = '1') then
        temp_QB2    <= offset;
        RA_temp     <= (others => '1');
    else
        temp_QB2    <= temp_QB;
        RA_temp     <= D_RA;
    end if;

end process;
BYPASSMUXA: process (BypassA,offset,temp_QA)
begin
    if (BypassA = '1') then
        WAddr_temp <= (others => '1');
    else
        WAddr_temp  <= D_WAddr;
    end if;

end process;

BYPASSMUXC:process(temp_QA,D_output1,BypassC)
begin
    if (BypassC = '1' ) then
        D_output <= temp_QA;
        else 
        D_output <= D_output1;
    end if;
end process;

BYPASSMUXD:process(temp_QA,D_output1,BypassD)
begin
    if (BypassD = '1' ) then
        D_output <= temp_QB;
        else 
        D_output <= D_output1;
    end if;
end process;


RA_sig_ored     <= D_RA_sig or BypassB;
write_sig_ored  <= D_write_sig  ;

TRI_BUFFER: 
process(D_OE,TEMP_SUM)
begin
    if (D_OE = '1') then
        D_output1 <= TEMP_SUM;
        else
        D_output1 <= (others => 'Z');
    end if;
end process;

REG_FILE: register_file 
Generic map( N  => N , M => M)
port map (   
    WD            => MUX_OP,
    WAddr         => WAddr_temp,
    write_sig     => write_sig_ored,
    RA            => RA_temp,
    RB            => D_RB,  
    RA_sig        => RA_sig_ored,
    RB_sig        => D_RB_sig,
    rst           => D_rst, 
    clk           => temp_clk,
    QA            => temp_QA,
    QB            => temp_QB
    );

ALU_block: alu 
Generic map( N  => N )
port map (
        a        => temp_QA,
        b        => temp_QB2,
        op       => ALU_OP,
        y        => TEMP_SUM,
        z_f      => D_z_f,
        n_f      => D_n_f,
        o_f      => D_o_f,
        clk      => temp_clk,
        en       => ALU_EN,
        reset    => D_rst      

); 

CLOCK_DIV: Clock_Divider port map (
    clk_in      => D_clk,
    clk_out     => temp_clk
);


end behave;