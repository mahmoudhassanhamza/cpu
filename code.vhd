
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

package micro_assembly_code is
    constant M : integer := 3;
    subtype opcode is std_logic_vector(2 downto 0);
    subtype regs is   std_logic_vector(M-1 downto 0);
    type instruction is record 
    IE: std_logic;
    WrReg,ReadA,ReadB: regs;
    ALU: opcode;
    OE: std_logic;
end record;
type program is array(natural range<>) of instruction;
constant OpComp:opcode :="000";
constant OpAnd:opcode :="001";
constant OpXor:opcode :="010";
-- register macros
constant R0:regs :="000"; -- bit zero is the enable signal
constant R1:regs :="001";
constant R2:regs :="010";
constant R3:regs :="011";
constant R4:regs :="100";
constant R5:regs :="101";
constant R6:regs :="110";
constant R7:regs :="111";
end micro_assembly_code;

