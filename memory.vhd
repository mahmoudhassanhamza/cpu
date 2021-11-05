

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use work.code.all;
use IEEE.NUMERIC_STD.ALL;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY memory IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END memory;


ARCHITECTURE fake OF memory IS
type program is array (natural range <>) of std_logic_vector(15 downto 0);

	SIGNAL RAM	: program (0 to 255):=(
		(LDI & R5 & B"1_0000_0000"),
		(ADD & R5 & R5 & R5 & Tail3),
		(ADD & R5 & R5 & R5 & Tail3),
		(ADD & R5 & R5 & R5 & Tail3),
		(ADD & R5 & R5 & R5 & Tail3),
		(LDI & R6 & B"0_0010_0000"),
		(LDI & R3 & B"0_0000_0011"),
		(ST  & Tail3 & R6 & R3  & Tail3),
		(LDI & R1 & B"0_0000_0001"),
		(LDI & R0 & B"0_0000_1110"),
		(MOV & R2 & R0 & Tail3 & Tail3 ),
		(ADD & R2 & R2 & R1 & Tail3),
		(ISUB & R0 & R0 & R1 & Tail3),
		(BRZ & B"0000_0000_0011"),
		(NOP & Tail3 & Tail3 & Tail3 & Tail3  ),
		(BRA & B"0000_1111_1100"),
		(ST  & Tail3 & R6 & R2 & Tail3 ),
		(ST  & Tail3 & R5 & R2 & Tail3 ),
		(BRA & B"0000_0000_0000"),
		(NOP & Tail3 & Tail3 & Tail3 & Tail3  ),
		(NOP & Tail3 & Tail3 & Tail3 & Tail3  ),
		others=>(NOP & R0 & R0 & R0 & Tail3)
		);

BEGIN
	process(address,data,wren)
	begin
	if(wren = '0') then
		RAM (to_integer(UNSIGNED(address))) <= data;
	else
	q    <= RAM(to_integer(UNSIGNED(address)));
	end if;
	end process;
	-- altsyncram_component : altsyncram
	-- GENERIC MAP (
	-- 	clock_enable_input_a => "BYPASS",
	-- 	clock_enable_output_a => "BYPASS",
	-- 	init_file => "memory.hex",
	-- 	intended_device_family => "Cyclone IV E",
	-- 	lpm_hint => "ENABLE_RUNTIME_MOD=YES,INSTANCE_NAME=RAM",
	-- 	lpm_type => "altsyncram",
	-- 	numwords_a => 256,
	-- 	operation_mode => "SINGLE_PORT",
	-- 	outdata_aclr_a => "NONE",
	-- 	outdata_reg_a => "UNREGISTERED",
	-- 	power_up_uninitialized => "FALSE",
	-- 	read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
	-- 	widthad_a => 8,
	-- 	width_a => 16,
	-- 	width_byteena_a => 1
	-- )
	-- PORT MAP (
	-- 	address_a => address,
	-- 	clock0 => clock,
	-- 	data_a => data,
	-- 	wren_a => wren,
	-- 	q_a => q
	-- );



END fake;