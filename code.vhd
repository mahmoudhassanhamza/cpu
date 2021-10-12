
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

package code is
    constant M : integer := 3;
    constant N : integer := 16;
    subtype opcode is std_logic_vector(3 downto 0);
    subtype reg_code   is std_logic_vector(2 downto 0);
    subtype instruction is std_logic_vector(15 downto 0);
    subtype immediate   is std_logic_vector(8 downto 0);
    type Minstruction is record 
    -- D_WD:  std_logic_vector (N-1 downto 0) ;
    IE: std_logic;
    OE: std_logic;
    ALU_OP:std_logic_vector(2 downto 0);
    ALU_EN:std_logic;
    D_write_sig     : std_logic;
    D_RA_sig        : std_logic;
    D_RB_sig        : std_logic;
    BypassB         : std_logic;
    BypassA         : std_logic;
    BypassC         : std_logic;
    BypassD         : std_logic;
    MEMRRWbar       : std_logic;
    ADDRESS_REG_EN  : std_logic;
    DOUT_REG_EN     : std_logic;
end record;
type Minstruction_arr is array(natural range <>) of Minstruction;
constant ADD    : opcode := "0000";
constant ISUB   : opcode := "0001";
constant iAND   : opcode := "0010";
constant iOR    : opcode := "0011";
constant iXOR   : opcode := "0100";
constant iNOT   : opcode := "0101";
constant MOV    : opcode := "0110";
constant LD     : opcode := "1000";
constant ST     : opcode := "1001";
constant LDI    : opcode := "1010";
constant BRZ    : opcode := "1100";
constant BRN    : opcode := "1101";
constant BRO    : opcode := "1110";
constant BRA    : opcode := "1111";

constant tail3  : std_logic_vector := "000";


-- register macros
constant R0:reg_code :="000"; 
constant R1:reg_code :="001";
constant R2:reg_code :="010";
constant R3:reg_code :="011";
constant R4:reg_code :="100";
constant R5:reg_code :="101";
constant R6:reg_code :="110";
constant R7:reg_code :="111";
end code;

