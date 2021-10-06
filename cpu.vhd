
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
    Bypass            : in std_logic;
    offset            : in std_logic_vector(N-1 downto 0);
    D_output          : out std_logic_vector(N-1 downto 0);
    D_z_f,D_n_f,D_o_f : out std_logic
);
end component;


    signal IR                           : std_logic_vector ( 15 downto 0 );
    signal M_instr_sig                  : Minstruction;
    signal DOUT_temp                    : std_logic_vector (N-1 downto 0 );
    signal SE_DIN                       : std_logic_vector (N-1 downto 0 );
    signal SE_OFFSET                    : std_logic_vector (N-1 downto 0 );
    signal Z_F,N_F,O_F                  : std_logic;
    signal Z_F_temp,N_F_temp,O_F_temp   : std_logic;
    signal uPgmCount                    : std_logic_vector(1 downto 0 ) := "00";
    signal A_2_temp                     : std_logic;
    begin
SE_DIN    <= std_logic_vector(resize(signed(IR(9 downto 0)),N));
SE_OFFSET <= std_logic_vector(resize(signed(IR(11 downto 0)),N));
InstructionREGISTER:
process (clk)
begin
    if rising_edge(clk) then
        if uPgmCount = "00" then
            IR <= Din;
        end if;
    end if;
end process;

UProgramCounter:
process (clk,reset)
begin
if reset = '1' then
    uPgmCount <= "00";
elsif rising_edge(clk) then
    uPgmCount <= uPgmCount + 1 ;
end if;
end process;

STATUS_REG:
process (clk,reset)
begin
if reset = '1' then
    Z_F <= '0';
    N_F <= '0';
    O_F <= '0';
    elsif rising_edge(clk) then
        if (IR(15) = '0' and uPgmCount = "01" ) then  -- performing alu instr and after the calculation
            Z_F <= Z_F_temp;
            N_F <= N_F_temp;
            O_F <= O_F_temp;
        end if;
end if;
end process;
AddressAndDout: 
process(M_instr_sig,reset)

begin
if reset = '1' then 
    address <= (others => '0');
elsif M_instr_sig.ADDRESS_REG_EN = '1' then
    address <= DOUT_temp;   
elsif M_instr_sig.DOUT_REG_EN = '1' then
    Dout <= DOUT_temp;
end if;

end process;

A2_MUX:with IR(13 downto 12) select A_2_temp <=
Z_F when "00",
N_F when "01",
O_F when others;


ROM:    micro_assembly_code_ROM port map 
(
    A_6_3    => IR(15 downto 12),
    A_2      => A_2_temp,
    A_1_0    => uPgmCount,
    M_instr  => M_instr_sig     
);
-- IE OE ALU_OP ALU_EN D_write_sig  D_RA_sig     D_RB_sig     Bypass       MEMRRWbar    ADDRESS_REG_EN   DOUT_REG_EN
DataPath:      Data_path port map
(
    D_WD            => SE_DIN ,
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
    Bypass          => M_instr_sig.Bypass,
    offset          => SE_OFFSET,
    D_output        => DOUT_temp,
    D_z_f           => Z_F_temp,
    D_n_f           => N_F_temp,
    D_o_f           => O_F_temp
);

end behave ; 