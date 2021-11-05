
library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;
use work.code.all;

entity micro_assembly_code_ROM is 
port (
    A_6_3        : in std_logic_vector (6 downto 3 );
    A_2          : in std_logic;
    A_1_0        : in std_logic_vector (1 downto 0 );
    M_instr      : out Minstruction
);
end micro_assembly_code_ROM;

architecture behave of micro_assembly_code_ROM is
   -- IE = OE = ALU_OP
   --ALU_EN = D_write_sig = D_RA_sig
   --D_RB_sig = BypassB =BypassA= MEMRRWbar
   --ADDRESS_REG_EN = DOUT_REG_EN     
     constant allinstr: Minstruction_arr := (

    -----------------------ADD--------------------------------- 
    ('0','0', "000",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','1','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching


    ------------------------------------------------
    ('0','0', "000",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','1','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching


    -----------------------------------------------------------------
        
    -----------------------SUB--------------------------------- 
    ('0','0', "001",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','1','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching


    ------------------------------------------------
    ('0','0', "001",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','1','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching

    -----------------------------------------------------------------
        
    -----------------------AND--------------------------------- 
    ('0','0', "010",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','1','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching


    ------------------------------------------------
    ('0','0', "010",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','0','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching

    -----------------------------------------------------------------
        
    -----------------------OR--------------------------------- 
    ('0','0', "011",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','1','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching


    ------------------------------------------------
    ('0','0', "011",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','0','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching

    -----------------------------------------------------------------
        
    -----------------------XOR--------------------------------- 
    ('0','0', "100",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','1','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching


    ------------------------------------------------
    ('0','0', "100",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','0','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching

    -----------------------------------------------------------------
        
    -----------------------NOT--------------------------------- 
    ('0','0', "101",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','1','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching


    ------------------------------------------------
    ('0','0', "101",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','0','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching
    -----------------------------------------------------------------
        
    -----------------------MOV--------------------------------- 
    ('0','0', "110",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','1','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching


    ------------------------------------------------
    ('0','0', "110",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','1','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching
    -----------------------------------------------------------------
        
    -----------------------NOP--------------------------------- 
    ('0','0', "111",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','0','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching


    ------------------------------------------------
    ('0','0', "111",'1','0','1','1','0','0','0','0','1','0','0' ),-- R1 = r2 + r3
    ('0','1', "111",'1','0','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching

    -----------------------------------------------------------------
      -- IE = OE = ALU_OP
   --ALU_EN = D_write_sig = D_RA_sig
   --D_RB_sig = BypassB =BypassACD= MEMRRWbar
   --ADDRESS_REG_EN = DOUT_REG_EN  
    -----------------------LDr1,<r2>--------------------------------- 
    ('0','0', "000",'0','0','1','0','0','0','1','0','1','1','0' ),-- y = r2
    ('0','1', "111",'1','0','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','0', "000",'0','1','1','0','0','1','1','0','1','1','0' ),-- y = r2
    ('1','0', "000",'0','1','0','0','0','0','0','0','1','0','0' ), -- fetching
    ------------------------------------------------
    ('0','0', "000",'0','0','1','0','0','0','1','0','1','1','0' ),-- y = r2
    ('0','1', "111",'1','0','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','0', "000",'0','1','1','0','0','1','1','0','1','1','0' ),-- y = r2
    ('1','0', "000",'0','1','0','0','0','0','0','0','1','0','0' ), -- fetching

    -----------------------------------------------------------------
           -- IE = OE = ALU_OP
   --ALU_EN = D_write_sig = D_RA_sig
   --D_RB_sig = BypassB =BypassACD= MEMRRWbar
   --ADDRESS_REG_EN = DOUT_REG_EN  
    -----------------------STr1,<r2>--------------------------------- 
  -- IE     OE    ALU_OP    ALU_EN    D_write  D_RA  D_RB  BypassB BypassA   bypsC   bypsD MEMRRWbar ADrs_REG_EN = DOUT_REG_EN  
    ('0',   '1',    "000",    '0',    '0',    '1',    '1',    '0',    '0',    '0',    '1',    '1',    '0',    '1' ),-- y = r2
    ('0',   '1',    "000",    '0',    '0',    '1',    '1',    '0',    '0',    '1',    '0',    '0',    '1',    '0' ),-- y = r2
    ('0',   '1',    "111",    '1',    '0',    '1',    '1',    '1',    '0',    '0',    '0',    '1',    '1',    '0' ),-- address = pc + 1 and read mem(address)
    ('0',   '1',    "000",    '0',    '1',    '1',    '1',    '0',    '1',    '0',    '0',    '1',    '1',    '0' ), -- fetching
    ------------------------------------------------
    ('0',   '1',    "000",    '0',    '0',    '1',    '1',    '0',    '0',    '0',    '1',    '1',    '0',    '1' ),-- y = r2
    ('0',   '1',    "000",    '0',    '0',    '1',    '1',    '0',    '0',    '1',    '0',    '0',    '1',    '0' ),-- y = r2
    ('0',   '1',    "111",    '1',    '0',    '1',    '1',    '1',    '0',    '0',    '0',    '1',    '1',    '0' ),-- address = pc + 1 and read mem(address)
    ('0',   '1',    "000",    '0',    '1',    '1',    '1',    '0',    '1',    '0',    '0',    '1',    '1',    '0' ), -- fetching
    ------------------------------------------------
    -----------------------------------------------------------------

    -----------------------LDI--------------------------------- 
    ('1','0', "110",'0','1','0','0','0','0','0','0','1','0','1' ),-- R1 = Data
    ('0','1', "111",'1','0','1','1','1','0','0','0','1','1','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching

    ------------------------------------------------
    ('1','0', "110",'0','1','0','0','0','0','0','0','1','0','1' ),-- R1 = Data
    ('0','1', "111",'1','0','1','1','1','0','0','0','1','1','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching

    -----------------------------------------------------------------
        
    -----------------------NOTUSED--------------------------------- 
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching
    ('0','1', "111",'1','1','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','1','0','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching

    ------------------------------------------------
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching
    ('0','1', "111",'1','1','1','1','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','1', "111",'0','1','1','1','1','0','0','0','1','1','0' ), -- store pc+1
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching


    -----------------------------------------------------------------
 
    -----------------------BRZ--------------------------------- 
    ('0','0', "111",'1','0','0','0','1','0','0','0','1','0','0' ),-- address = pc + 1 and read mem(address)
    ('0','0', "000",'0','1','0','0','0','1','0','0','1','0','0' ),-- y = r2
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- fetching
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching
    ------------------------------------------------
    ('0','0', "000",'1','0','1','0','1','0','0','0','1','0','0' ), -- fetching
    ('0','0', "000",'0','1','0','0','1','1','0','0','1','0','1' ),-- R1 = r2 + r3
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- fetching
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching

    -- -----------------------BRN--------------------------------- 
    ('0','1', "111",'1','0','0','0','1','0','0','0','1','1','0' ),-- address = pc + 1 and read mem(address)
    ('0','0', "000",'0','1','0','0','0','1','0','0','1','0','0' ),-- y = r2
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- fetching
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching
    ------------------------------------------------
    ('0','0', "000",'1','0','1','0','1','0','0','0','1','0','0' ), -- fetching
    ('0','0', "000",'0','1','0','0','1','1','0','0','1','0','1' ),-- R1 = r2 + r3
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- fetching
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching


    -- -----------------------------------------------------------------
        
    -- -----------------------BRO--------------------------------- 
    ('0','1', "111",'1','0','0','0','1','0','0','0','1','1','0' ),-- address = pc + 1 and read mem(address)
    ('0','0', "000",'0','1','0','0','0','1','0','0','1','0','0' ),-- y = r2
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- fetching
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching
    ------------------------------------------------
    ('0','0', "000",'1','0','1','0','1','0','0','0','1','0','0' ), -- fetching
    ('0','0', "000",'0','1','0','0','1','1','0','0','1','0','1' ),-- R1 = r2 + r3
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- fetching
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching



    -- -----------------------------------------------------------------
    -- IE = OE = ALU_OP
   --ALU_EN = D_write_sig = D_RA_sig
   --D_RB_sig = BypassB =BypassACD= MEMRRWbar
   --ADDRESS_REG_EN = DOUT_REG_EN  
    -- -----------------------BRA--------------------------------- 
    ('0','0', "000",'1','0','1','0','1','0','0','0','1','0','0' ), -- fetching
    ('0','0', "000",'0','1','0','0','1','1','0','0','1','0','1' ),-- R1 = r2 + r3
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- fetching
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ), -- fetching
    ------------------------------------------------
    ('0','0', "000",'1','0','1','0','1','0','0','0','1','0','0' ), -- fetching
    ('0','0', "000",'0','1','0','0','1','1','0','0','1','0','1' ),-- R1 = r2 + r3
    ('0','1', "111",'0','1','1','1','0','1','0','0','1','1','0' ), -- fetching
    ('0','0', "000",'0','0','0','0','0','0','0','0','1','0','0' ) -- fetching



    -----------------------------------------------------------------

    );
begin


    M_instr <= allinstr(to_integer(UNSIGNED(A_6_3 & A_2 & A_1_0)));

end behave;
