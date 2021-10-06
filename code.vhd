
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

package code is
    constant M : integer := 3;
    subtype opcode is std_logic_vector(2 downto 0);
    subtype regs is   std_logic_vector(M-1 downto 0);
    
    type Minstruction is record 
    -- D_WD:  std_logic_vector (N-1 downto 0) ;
    IE: std_logic;
    OE: std_logic;
    ALU_OP:opcode;
    ALU_EN:std_logic;
    D_write_sig     : std_logic;
    D_RA_sig        : std_logic;
    D_RB_sig        : std_logic;
    Bypass          : std_logic;
    MEMRRWbar       : std_logic;
    ADDRESS_REG_EN  : std_logic;
    DOUT_REG_EN     : std_logic;
end record;
type instruction is array(natural range <>) of Minstruction;
constant OpADD:opcode :="000";
constant OpSUB:opcode :="001";
constant OpAND:opcode :="010";
constant OpOR:opcode  :="011";
constant OpXOR:opcode :="100";
constant OpNOT:opcode :="101";
constant OpMOV:opcode :="110";
constant OpINCR:opcode :="111";
-- register macros
constant R0:regs :="000"; 
constant R1:regs :="001";
constant R2:regs :="010";
constant R3:regs :="011";
constant R4:regs :="100";
constant R5:regs :="101";
constant R6:regs :="110";
constant R7:regs :="111";
end code;

