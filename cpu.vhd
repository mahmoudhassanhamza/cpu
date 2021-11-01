
library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
use work.code.all;


entity cpu is
generic(N:integer;
        M:integer);
port(clk,reset:IN std_logic;
     Din:IN std_logic_vector(N-1 downto 0);
     address:OUT std_logic_vector(N-1 downto 0);
     Dout:OUT std_logic_vector(N-1 downto 0);
     RW:OUT std_logic);
end entity;

architecture behave of cpu is

    component micro_assembly_code_ROM is 
    port (
        A_6_3        : in std_logic_vector (6 downto 3 );
        A_2          : in std_logic;
        A_1_0        : in std_logic_vector (1 downto 0 );
        M_instr      : out Minstruction
    );
    end component;

    component Data_path is 
Generic (N : integer ;
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
end component;


    signal IR                           : std_logic_vector ( 15 downto 0 );
    signal M_instr_sig                  : Minstruction;
    signal DOUT_temp                    : std_logic_vector (N-1 downto 0 );
    signal SE_DIN                       : std_logic_vector (N-1 downto 0 );
    signal SE_DIN_TEMP                  : std_logic_vector (N-1 downto 0 );
    signal SE_OFFSET                    : std_logic_vector (N-1 downto 0 );
    signal L_z,L_n,L_o                  : std_logic;
    signal Z_F_temp,N_F_temp,O_F_temp   : std_logic;
    signal upc                          : std_logic_vector(1 downto 0 ) := "00";
    signal A_2_temp                     : std_logic;
    begin
SE_DIN    <= std_logic_vector(resize(signed(IR(8 downto 0)),N));
SE_OFFSET <= std_logic_vector(resize(signed(IR(11 downto 0)),N));
InstructionREGISTER:
process (upc,reset,Din)
begin
    -- if rising_edge(clk) then
        if upc = "00" then
            IR <= Din;
        end if;
    -- end if;
end process;

InputMUX:
process (Din,reset,clk)
begin
    if (IR(15 downto 12 ) = "1000") then
        SE_DIN_TEMP <= Din;
        else
        SE_DIN_TEMP <= SE_DIN;
    end if;
end process;

UProgramCounter:
process (clk,reset)
begin
if reset = '1' then
    upc <= "00";
elsif rising_edge(clk) then
    upc <= upc + 1 ;
end if;
end process;

STATUS_REG:
process (clk,reset,IR(15))
begin
if reset = '1' then
    L_z <= '0';
    L_n <= '0';
    L_o <= '0';
    elsif rising_edge(clk) then
        if (IR(15) = '0' and upc = "01"   ) then  -- performing alu instr and after the calculation
            L_z <= Z_F_temp;
            L_n <= N_F_temp;
            L_o <= O_F_temp;
        end if;
end if;
end process;
AddressAndDout: 
process(M_instr_sig,reset,DOUT_temp)

begin
if reset = '1' then 
    address <= (others => '0');
    Dout    <= (others => '0');
elsif M_instr_sig.ADDRESS_REG_EN = '1' then
    address <= DOUT_temp;   
elsif M_instr_sig.DOUT_REG_EN = '1' then
    Dout <= DOUT_temp;
end if;

end process;

A2_MUX:with IR(13 downto 12) select A_2_temp <=
L_z when "00",
L_n when "01",
L_o when others;
RW <= M_instr_sig.MEMRRWbar;

ROM:    micro_assembly_code_ROM port map 
(
    A_6_3    => IR(15 downto 12),
    A_2      => A_2_temp,
    A_1_0    => upc,
    M_instr  => M_instr_sig     
);
-- IE OE ALU_OP ALU_EN D_write_sig  D_RA_sig     D_RB_sig     Bypass       MEMRRWbar    ADDRESS_REG_EN   DOUT_REG_EN
DataPath:   Data_path 
Generic map (N => N , M => M )
port map
(
    D_WD            => SE_DIN_TEMP ,
    D_IE            => M_instr_sig.IE,
    D_OE            => M_instr_sig.OE,
    ALU_OP          => M_instr_sig.alu_op,
    ALU_EN          => M_instr_sig.alu_en,
    D_WAddr         => IR(11 downto 9),
    D_write_sig     => M_instr_sig.D_write_sig,
    D_RA            => IR(8 downto 6),
    D_RB            => IR(5 downto 3),
    D_RA_sig        => M_instr_sig.D_RA_sig, 
    D_RB_sig        => M_instr_sig.D_RB_sig,  
    D_rst           => reset,
    D_clk           => clk,
    BypassB         => M_instr_sig.BypassB,
    BypassA         => M_instr_sig.BypassA,
    BypassC         => M_instr_sig.BypassC,
    BypassD         => M_instr_sig.BypassD,
    offset          => SE_OFFSET,
    D_output        => DOUT_temp,
    D_z_f           => Z_F_temp,
    D_n_f           => N_F_temp,
    D_o_f           => O_F_temp
);

end behave ; 