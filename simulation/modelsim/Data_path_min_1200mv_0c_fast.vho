-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "10/06/2021 15:31:59"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Data_path IS
    PORT (
	D_WD : IN std_logic_vector(2 DOWNTO 0);
	D_IE : IN std_logic;
	D_OE : IN std_logic;
	ALU_OP : IN std_logic_vector(2 DOWNTO 0);
	ALU_EN : IN std_logic;
	D_WAddr : IN std_logic_vector(1 DOWNTO 0);
	D_write_sig : IN std_logic;
	D_RA : IN std_logic_vector(1 DOWNTO 0);
	D_RB : IN std_logic_vector(1 DOWNTO 0);
	D_RA_sig : IN std_logic;
	D_RB_sig : IN std_logic;
	D_rst : IN std_logic;
	D_clk : IN std_logic;
	D_output : BUFFER std_logic_vector(2 DOWNTO 0);
	D_z_f : BUFFER std_logic;
	D_n_f : BUFFER std_logic;
	D_o_f : BUFFER std_logic
	);
END Data_path;

-- Design Ports Information
-- D_output[0]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_output[1]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_output[2]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_z_f	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_n_f	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_o_f	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_OE	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OP[1]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OP[2]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OP[0]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_rst	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_EN	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_RA[1]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_RA[0]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_RA_sig	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_RB[1]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_RB[0]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_RB_sig	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_clk	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_WD[0]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_IE	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_WAddr[1]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_write_sig	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_WAddr[0]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_WD[1]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D_WD[2]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Data_path IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_D_WD : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_D_IE : std_logic;
SIGNAL ww_D_OE : std_logic;
SIGNAL ww_ALU_OP : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_ALU_EN : std_logic;
SIGNAL ww_D_WAddr : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_D_write_sig : std_logic;
SIGNAL ww_D_RA : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_D_RB : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_D_RA_sig : std_logic;
SIGNAL ww_D_RB_sig : std_logic;
SIGNAL ww_D_rst : std_logic;
SIGNAL ww_D_clk : std_logic;
SIGNAL ww_D_output : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_D_z_f : std_logic;
SIGNAL ww_D_n_f : std_logic;
SIGNAL ww_D_o_f : std_logic;
SIGNAL \D_clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK_DIV|reg[26]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \D_output[0]~output_o\ : std_logic;
SIGNAL \D_output[1]~output_o\ : std_logic;
SIGNAL \D_output[2]~output_o\ : std_logic;
SIGNAL \D_z_f~output_o\ : std_logic;
SIGNAL \D_n_f~output_o\ : std_logic;
SIGNAL \D_o_f~output_o\ : std_logic;
SIGNAL \D_clk~input_o\ : std_logic;
SIGNAL \D_clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \CLOCK_DIV|reg[0]~78_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[1]~26_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[1]~27\ : std_logic;
SIGNAL \CLOCK_DIV|reg[2]~28_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[2]~29\ : std_logic;
SIGNAL \CLOCK_DIV|reg[3]~30_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[3]~31\ : std_logic;
SIGNAL \CLOCK_DIV|reg[4]~32_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[4]~33\ : std_logic;
SIGNAL \CLOCK_DIV|reg[5]~34_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[5]~35\ : std_logic;
SIGNAL \CLOCK_DIV|reg[6]~36_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[6]~37\ : std_logic;
SIGNAL \CLOCK_DIV|reg[7]~38_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[7]~39\ : std_logic;
SIGNAL \CLOCK_DIV|reg[8]~40_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[8]~41\ : std_logic;
SIGNAL \CLOCK_DIV|reg[9]~42_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[9]~43\ : std_logic;
SIGNAL \CLOCK_DIV|reg[10]~44_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[10]~45\ : std_logic;
SIGNAL \CLOCK_DIV|reg[11]~46_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[11]~47\ : std_logic;
SIGNAL \CLOCK_DIV|reg[12]~48_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[12]~49\ : std_logic;
SIGNAL \CLOCK_DIV|reg[13]~50_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[13]~51\ : std_logic;
SIGNAL \CLOCK_DIV|reg[14]~52_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[14]~53\ : std_logic;
SIGNAL \CLOCK_DIV|reg[15]~54_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[15]~55\ : std_logic;
SIGNAL \CLOCK_DIV|reg[16]~56_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[16]~57\ : std_logic;
SIGNAL \CLOCK_DIV|reg[17]~58_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[17]~59\ : std_logic;
SIGNAL \CLOCK_DIV|reg[18]~60_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[18]~61\ : std_logic;
SIGNAL \CLOCK_DIV|reg[19]~62_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[19]~63\ : std_logic;
SIGNAL \CLOCK_DIV|reg[20]~64_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[20]~65\ : std_logic;
SIGNAL \CLOCK_DIV|reg[21]~66_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[21]~67\ : std_logic;
SIGNAL \CLOCK_DIV|reg[22]~68_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[22]~69\ : std_logic;
SIGNAL \CLOCK_DIV|reg[23]~70_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[23]~71\ : std_logic;
SIGNAL \CLOCK_DIV|reg[24]~72_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[24]~73\ : std_logic;
SIGNAL \CLOCK_DIV|reg[25]~74_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[25]~75\ : std_logic;
SIGNAL \CLOCK_DIV|reg[26]~76_combout\ : std_logic;
SIGNAL \CLOCK_DIV|reg[26]~clkctrl_outclk\ : std_logic;
SIGNAL \ALU_OP[1]~input_o\ : std_logic;
SIGNAL \ALU_OP[0]~input_o\ : std_logic;
SIGNAL \D_RA_sig~input_o\ : std_logic;
SIGNAL \D_IE~input_o\ : std_logic;
SIGNAL \D_WD[0]~input_o\ : std_logic;
SIGNAL \MUX_OP[0]~0_combout\ : std_logic;
SIGNAL \D_rst~input_o\ : std_logic;
SIGNAL \D_WAddr[1]~input_o\ : std_logic;
SIGNAL \D_WAddr[0]~input_o\ : std_logic;
SIGNAL \D_write_sig~input_o\ : std_logic;
SIGNAL \REG_FILE|Decoder0~0_combout\ : std_logic;
SIGNAL \REG_FILE|memr[2][0]~q\ : std_logic;
SIGNAL \D_RA[1]~input_o\ : std_logic;
SIGNAL \REG_FILE|Decoder0~3_combout\ : std_logic;
SIGNAL \REG_FILE|memr[3][0]~q\ : std_logic;
SIGNAL \D_RA[0]~input_o\ : std_logic;
SIGNAL \REG_FILE|memr[0][0]~feeder_combout\ : std_logic;
SIGNAL \REG_FILE|Decoder0~2_combout\ : std_logic;
SIGNAL \REG_FILE|memr[0][0]~q\ : std_logic;
SIGNAL \REG_FILE|memr[1][0]~feeder_combout\ : std_logic;
SIGNAL \REG_FILE|Decoder0~1_combout\ : std_logic;
SIGNAL \REG_FILE|memr[1][0]~q\ : std_logic;
SIGNAL \REG_FILE|Mux2~0_combout\ : std_logic;
SIGNAL \REG_FILE|Mux2~1_combout\ : std_logic;
SIGNAL \ALU_OP[2]~input_o\ : std_logic;
SIGNAL \D_RB_sig~input_o\ : std_logic;
SIGNAL \D_RB[1]~input_o\ : std_logic;
SIGNAL \D_RB[0]~input_o\ : std_logic;
SIGNAL \REG_FILE|Mux5~0_combout\ : std_logic;
SIGNAL \REG_FILE|Mux5~1_combout\ : std_logic;
SIGNAL \ALU_block|Mux2~1_combout\ : std_logic;
SIGNAL \ALU_block|Mux2~0_combout\ : std_logic;
SIGNAL \ALU_block|Mux2~2_combout\ : std_logic;
SIGNAL \ALU_EN~input_o\ : std_logic;
SIGNAL \D_OE~input_o\ : std_logic;
SIGNAL \D_WD[1]~input_o\ : std_logic;
SIGNAL \MUX_OP[1]~1_combout\ : std_logic;
SIGNAL \REG_FILE|memr[1][1]~q\ : std_logic;
SIGNAL \REG_FILE|memr[3][1]~q\ : std_logic;
SIGNAL \REG_FILE|memr[2][1]~q\ : std_logic;
SIGNAL \REG_FILE|memr[0][1]~q\ : std_logic;
SIGNAL \REG_FILE|Mux4~0_combout\ : std_logic;
SIGNAL \REG_FILE|Mux4~1_combout\ : std_logic;
SIGNAL \REG_FILE|Mux1~0_combout\ : std_logic;
SIGNAL \REG_FILE|Mux1~1_combout\ : std_logic;
SIGNAL \ALU_block|Mux1~3_combout\ : std_logic;
SIGNAL \ALU_block|Mux1~0_combout\ : std_logic;
SIGNAL \ALU_block|Mux1~1_combout\ : std_logic;
SIGNAL \ALU_block|Mux1~4_combout\ : std_logic;
SIGNAL \ALU_block|Mux1~5_combout\ : std_logic;
SIGNAL \ALU_block|Mux1~2_combout\ : std_logic;
SIGNAL \ALU_block|Mux1~combout\ : std_logic;
SIGNAL \D_WD[2]~input_o\ : std_logic;
SIGNAL \MUX_OP[2]~2_combout\ : std_logic;
SIGNAL \REG_FILE|memr[2][2]~feeder_combout\ : std_logic;
SIGNAL \REG_FILE|memr[2][2]~q\ : std_logic;
SIGNAL \REG_FILE|memr[3][2]~q\ : std_logic;
SIGNAL \REG_FILE|memr[1][2]~feeder_combout\ : std_logic;
SIGNAL \REG_FILE|memr[1][2]~q\ : std_logic;
SIGNAL \REG_FILE|memr[0][2]~feeder_combout\ : std_logic;
SIGNAL \REG_FILE|memr[0][2]~q\ : std_logic;
SIGNAL \REG_FILE|Mux3~0_combout\ : std_logic;
SIGNAL \REG_FILE|Mux3~1_combout\ : std_logic;
SIGNAL \REG_FILE|Mux0~0_combout\ : std_logic;
SIGNAL \REG_FILE|Mux0~1_combout\ : std_logic;
SIGNAL \ALU_block|Mux0~2_combout\ : std_logic;
SIGNAL \ALU_block|Mux0~0_combout\ : std_logic;
SIGNAL \ALU_block|Mux0~1_combout\ : std_logic;
SIGNAL \ALU_block|Mux0~3_combout\ : std_logic;
SIGNAL \ALU_block|Mux0~4_combout\ : std_logic;
SIGNAL \ALU_block|Mux0~combout\ : std_logic;
SIGNAL \ALU_block|WideOr0~combout\ : std_logic;
SIGNAL \ALU_block|z_f~q\ : std_logic;
SIGNAL \ALU_block|n_f~q\ : std_logic;
SIGNAL \ALU_block|o_f_tmp~0_combout\ : std_logic;
SIGNAL \ALU_block|o_f_tmp~1_combout\ : std_logic;
SIGNAL \ALU_block|o_f~q\ : std_logic;
SIGNAL \REG_FILE|QA\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \CLOCK_DIV|reg\ : std_logic_vector(26 DOWNTO 0);
SIGNAL \ALU_block|y\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \REG_FILE|QB\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALU_block|ALT_INV_z_f~q\ : std_logic;
SIGNAL \ALT_INV_D_rst~input_o\ : std_logic;

BEGIN

ww_D_WD <= D_WD;
ww_D_IE <= D_IE;
ww_D_OE <= D_OE;
ww_ALU_OP <= ALU_OP;
ww_ALU_EN <= ALU_EN;
ww_D_WAddr <= D_WAddr;
ww_D_write_sig <= D_write_sig;
ww_D_RA <= D_RA;
ww_D_RB <= D_RB;
ww_D_RA_sig <= D_RA_sig;
ww_D_RB_sig <= D_RB_sig;
ww_D_rst <= D_rst;
ww_D_clk <= D_clk;
D_output <= ww_D_output;
D_z_f <= ww_D_z_f;
D_n_f <= ww_D_n_f;
D_o_f <= ww_D_o_f;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\D_clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \D_clk~input_o\);

\CLOCK_DIV|reg[26]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_DIV|reg\(26));
\ALU_block|ALT_INV_z_f~q\ <= NOT \ALU_block|z_f~q\;
\ALT_INV_D_rst~input_o\ <= NOT \D_rst~input_o\;

-- Location: IOOBUF_X65_Y73_N16
\D_output[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_block|y\(0),
	oe => \D_OE~input_o\,
	devoe => ww_devoe,
	o => \D_output[0]~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\D_output[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_block|y\(1),
	oe => \D_OE~input_o\,
	devoe => ww_devoe,
	o => \D_output[1]~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\D_output[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_block|y\(2),
	oe => \D_OE~input_o\,
	devoe => ww_devoe,
	o => \D_output[2]~output_o\);

-- Location: IOOBUF_X65_Y73_N9
\D_z_f~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_block|ALT_INV_z_f~q\,
	devoe => ww_devoe,
	o => \D_z_f~output_o\);

-- Location: IOOBUF_X60_Y73_N16
\D_n_f~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_block|n_f~q\,
	devoe => ww_devoe,
	o => \D_n_f~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\D_o_f~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_block|o_f~q\,
	devoe => ww_devoe,
	o => \D_o_f~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\D_clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_clk,
	o => \D_clk~input_o\);

-- Location: CLKCTRL_G4
\D_clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \D_clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \D_clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X56_Y72_N4
\CLOCK_DIV|reg[0]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[0]~78_combout\ = !\CLOCK_DIV|reg\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CLOCK_DIV|reg\(0),
	combout => \CLOCK_DIV|reg[0]~78_combout\);

-- Location: FF_X56_Y72_N5
\CLOCK_DIV|reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[0]~78_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(0));

-- Location: LCCOMB_X56_Y72_N6
\CLOCK_DIV|reg[1]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[1]~26_combout\ = (\CLOCK_DIV|reg\(1) & (\CLOCK_DIV|reg\(0) $ (VCC))) # (!\CLOCK_DIV|reg\(1) & (\CLOCK_DIV|reg\(0) & VCC))
-- \CLOCK_DIV|reg[1]~27\ = CARRY((\CLOCK_DIV|reg\(1) & \CLOCK_DIV|reg\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CLOCK_DIV|reg\(1),
	datab => \CLOCK_DIV|reg\(0),
	datad => VCC,
	combout => \CLOCK_DIV|reg[1]~26_combout\,
	cout => \CLOCK_DIV|reg[1]~27\);

-- Location: FF_X56_Y72_N7
\CLOCK_DIV|reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[1]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(1));

-- Location: LCCOMB_X56_Y72_N8
\CLOCK_DIV|reg[2]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[2]~28_combout\ = (\CLOCK_DIV|reg\(2) & (!\CLOCK_DIV|reg[1]~27\)) # (!\CLOCK_DIV|reg\(2) & ((\CLOCK_DIV|reg[1]~27\) # (GND)))
-- \CLOCK_DIV|reg[2]~29\ = CARRY((!\CLOCK_DIV|reg[1]~27\) # (!\CLOCK_DIV|reg\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(2),
	datad => VCC,
	cin => \CLOCK_DIV|reg[1]~27\,
	combout => \CLOCK_DIV|reg[2]~28_combout\,
	cout => \CLOCK_DIV|reg[2]~29\);

-- Location: FF_X56_Y72_N9
\CLOCK_DIV|reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[2]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(2));

-- Location: LCCOMB_X56_Y72_N10
\CLOCK_DIV|reg[3]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[3]~30_combout\ = (\CLOCK_DIV|reg\(3) & (\CLOCK_DIV|reg[2]~29\ $ (GND))) # (!\CLOCK_DIV|reg\(3) & (!\CLOCK_DIV|reg[2]~29\ & VCC))
-- \CLOCK_DIV|reg[3]~31\ = CARRY((\CLOCK_DIV|reg\(3) & !\CLOCK_DIV|reg[2]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CLOCK_DIV|reg\(3),
	datad => VCC,
	cin => \CLOCK_DIV|reg[2]~29\,
	combout => \CLOCK_DIV|reg[3]~30_combout\,
	cout => \CLOCK_DIV|reg[3]~31\);

-- Location: FF_X56_Y72_N11
\CLOCK_DIV|reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[3]~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(3));

-- Location: LCCOMB_X56_Y72_N12
\CLOCK_DIV|reg[4]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[4]~32_combout\ = (\CLOCK_DIV|reg\(4) & (!\CLOCK_DIV|reg[3]~31\)) # (!\CLOCK_DIV|reg\(4) & ((\CLOCK_DIV|reg[3]~31\) # (GND)))
-- \CLOCK_DIV|reg[4]~33\ = CARRY((!\CLOCK_DIV|reg[3]~31\) # (!\CLOCK_DIV|reg\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CLOCK_DIV|reg\(4),
	datad => VCC,
	cin => \CLOCK_DIV|reg[3]~31\,
	combout => \CLOCK_DIV|reg[4]~32_combout\,
	cout => \CLOCK_DIV|reg[4]~33\);

-- Location: FF_X56_Y72_N13
\CLOCK_DIV|reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[4]~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(4));

-- Location: LCCOMB_X56_Y72_N14
\CLOCK_DIV|reg[5]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[5]~34_combout\ = (\CLOCK_DIV|reg\(5) & (\CLOCK_DIV|reg[4]~33\ $ (GND))) # (!\CLOCK_DIV|reg\(5) & (!\CLOCK_DIV|reg[4]~33\ & VCC))
-- \CLOCK_DIV|reg[5]~35\ = CARRY((\CLOCK_DIV|reg\(5) & !\CLOCK_DIV|reg[4]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(5),
	datad => VCC,
	cin => \CLOCK_DIV|reg[4]~33\,
	combout => \CLOCK_DIV|reg[5]~34_combout\,
	cout => \CLOCK_DIV|reg[5]~35\);

-- Location: FF_X56_Y72_N15
\CLOCK_DIV|reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[5]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(5));

-- Location: LCCOMB_X56_Y72_N16
\CLOCK_DIV|reg[6]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[6]~36_combout\ = (\CLOCK_DIV|reg\(6) & (!\CLOCK_DIV|reg[5]~35\)) # (!\CLOCK_DIV|reg\(6) & ((\CLOCK_DIV|reg[5]~35\) # (GND)))
-- \CLOCK_DIV|reg[6]~37\ = CARRY((!\CLOCK_DIV|reg[5]~35\) # (!\CLOCK_DIV|reg\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(6),
	datad => VCC,
	cin => \CLOCK_DIV|reg[5]~35\,
	combout => \CLOCK_DIV|reg[6]~36_combout\,
	cout => \CLOCK_DIV|reg[6]~37\);

-- Location: FF_X56_Y72_N17
\CLOCK_DIV|reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[6]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(6));

-- Location: LCCOMB_X56_Y72_N18
\CLOCK_DIV|reg[7]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[7]~38_combout\ = (\CLOCK_DIV|reg\(7) & (\CLOCK_DIV|reg[6]~37\ $ (GND))) # (!\CLOCK_DIV|reg\(7) & (!\CLOCK_DIV|reg[6]~37\ & VCC))
-- \CLOCK_DIV|reg[7]~39\ = CARRY((\CLOCK_DIV|reg\(7) & !\CLOCK_DIV|reg[6]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(7),
	datad => VCC,
	cin => \CLOCK_DIV|reg[6]~37\,
	combout => \CLOCK_DIV|reg[7]~38_combout\,
	cout => \CLOCK_DIV|reg[7]~39\);

-- Location: FF_X56_Y72_N19
\CLOCK_DIV|reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[7]~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(7));

-- Location: LCCOMB_X56_Y72_N20
\CLOCK_DIV|reg[8]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[8]~40_combout\ = (\CLOCK_DIV|reg\(8) & (!\CLOCK_DIV|reg[7]~39\)) # (!\CLOCK_DIV|reg\(8) & ((\CLOCK_DIV|reg[7]~39\) # (GND)))
-- \CLOCK_DIV|reg[8]~41\ = CARRY((!\CLOCK_DIV|reg[7]~39\) # (!\CLOCK_DIV|reg\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(8),
	datad => VCC,
	cin => \CLOCK_DIV|reg[7]~39\,
	combout => \CLOCK_DIV|reg[8]~40_combout\,
	cout => \CLOCK_DIV|reg[8]~41\);

-- Location: FF_X56_Y72_N21
\CLOCK_DIV|reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[8]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(8));

-- Location: LCCOMB_X56_Y72_N22
\CLOCK_DIV|reg[9]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[9]~42_combout\ = (\CLOCK_DIV|reg\(9) & (\CLOCK_DIV|reg[8]~41\ $ (GND))) # (!\CLOCK_DIV|reg\(9) & (!\CLOCK_DIV|reg[8]~41\ & VCC))
-- \CLOCK_DIV|reg[9]~43\ = CARRY((\CLOCK_DIV|reg\(9) & !\CLOCK_DIV|reg[8]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CLOCK_DIV|reg\(9),
	datad => VCC,
	cin => \CLOCK_DIV|reg[8]~41\,
	combout => \CLOCK_DIV|reg[9]~42_combout\,
	cout => \CLOCK_DIV|reg[9]~43\);

-- Location: FF_X56_Y72_N23
\CLOCK_DIV|reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[9]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(9));

-- Location: LCCOMB_X56_Y72_N24
\CLOCK_DIV|reg[10]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[10]~44_combout\ = (\CLOCK_DIV|reg\(10) & (!\CLOCK_DIV|reg[9]~43\)) # (!\CLOCK_DIV|reg\(10) & ((\CLOCK_DIV|reg[9]~43\) # (GND)))
-- \CLOCK_DIV|reg[10]~45\ = CARRY((!\CLOCK_DIV|reg[9]~43\) # (!\CLOCK_DIV|reg\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(10),
	datad => VCC,
	cin => \CLOCK_DIV|reg[9]~43\,
	combout => \CLOCK_DIV|reg[10]~44_combout\,
	cout => \CLOCK_DIV|reg[10]~45\);

-- Location: FF_X56_Y72_N25
\CLOCK_DIV|reg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[10]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(10));

-- Location: LCCOMB_X56_Y72_N26
\CLOCK_DIV|reg[11]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[11]~46_combout\ = (\CLOCK_DIV|reg\(11) & (\CLOCK_DIV|reg[10]~45\ $ (GND))) # (!\CLOCK_DIV|reg\(11) & (!\CLOCK_DIV|reg[10]~45\ & VCC))
-- \CLOCK_DIV|reg[11]~47\ = CARRY((\CLOCK_DIV|reg\(11) & !\CLOCK_DIV|reg[10]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CLOCK_DIV|reg\(11),
	datad => VCC,
	cin => \CLOCK_DIV|reg[10]~45\,
	combout => \CLOCK_DIV|reg[11]~46_combout\,
	cout => \CLOCK_DIV|reg[11]~47\);

-- Location: FF_X56_Y72_N27
\CLOCK_DIV|reg[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[11]~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(11));

-- Location: LCCOMB_X56_Y72_N28
\CLOCK_DIV|reg[12]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[12]~48_combout\ = (\CLOCK_DIV|reg\(12) & (!\CLOCK_DIV|reg[11]~47\)) # (!\CLOCK_DIV|reg\(12) & ((\CLOCK_DIV|reg[11]~47\) # (GND)))
-- \CLOCK_DIV|reg[12]~49\ = CARRY((!\CLOCK_DIV|reg[11]~47\) # (!\CLOCK_DIV|reg\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(12),
	datad => VCC,
	cin => \CLOCK_DIV|reg[11]~47\,
	combout => \CLOCK_DIV|reg[12]~48_combout\,
	cout => \CLOCK_DIV|reg[12]~49\);

-- Location: FF_X56_Y72_N29
\CLOCK_DIV|reg[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[12]~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(12));

-- Location: LCCOMB_X56_Y72_N30
\CLOCK_DIV|reg[13]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[13]~50_combout\ = (\CLOCK_DIV|reg\(13) & (\CLOCK_DIV|reg[12]~49\ $ (GND))) # (!\CLOCK_DIV|reg\(13) & (!\CLOCK_DIV|reg[12]~49\ & VCC))
-- \CLOCK_DIV|reg[13]~51\ = CARRY((\CLOCK_DIV|reg\(13) & !\CLOCK_DIV|reg[12]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CLOCK_DIV|reg\(13),
	datad => VCC,
	cin => \CLOCK_DIV|reg[12]~49\,
	combout => \CLOCK_DIV|reg[13]~50_combout\,
	cout => \CLOCK_DIV|reg[13]~51\);

-- Location: FF_X56_Y72_N31
\CLOCK_DIV|reg[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[13]~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(13));

-- Location: LCCOMB_X56_Y71_N0
\CLOCK_DIV|reg[14]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[14]~52_combout\ = (\CLOCK_DIV|reg\(14) & (!\CLOCK_DIV|reg[13]~51\)) # (!\CLOCK_DIV|reg\(14) & ((\CLOCK_DIV|reg[13]~51\) # (GND)))
-- \CLOCK_DIV|reg[14]~53\ = CARRY((!\CLOCK_DIV|reg[13]~51\) # (!\CLOCK_DIV|reg\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(14),
	datad => VCC,
	cin => \CLOCK_DIV|reg[13]~51\,
	combout => \CLOCK_DIV|reg[14]~52_combout\,
	cout => \CLOCK_DIV|reg[14]~53\);

-- Location: FF_X56_Y71_N1
\CLOCK_DIV|reg[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[14]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(14));

-- Location: LCCOMB_X56_Y71_N2
\CLOCK_DIV|reg[15]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[15]~54_combout\ = (\CLOCK_DIV|reg\(15) & (\CLOCK_DIV|reg[14]~53\ $ (GND))) # (!\CLOCK_DIV|reg\(15) & (!\CLOCK_DIV|reg[14]~53\ & VCC))
-- \CLOCK_DIV|reg[15]~55\ = CARRY((\CLOCK_DIV|reg\(15) & !\CLOCK_DIV|reg[14]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(15),
	datad => VCC,
	cin => \CLOCK_DIV|reg[14]~53\,
	combout => \CLOCK_DIV|reg[15]~54_combout\,
	cout => \CLOCK_DIV|reg[15]~55\);

-- Location: FF_X56_Y71_N3
\CLOCK_DIV|reg[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[15]~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(15));

-- Location: LCCOMB_X56_Y71_N4
\CLOCK_DIV|reg[16]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[16]~56_combout\ = (\CLOCK_DIV|reg\(16) & (!\CLOCK_DIV|reg[15]~55\)) # (!\CLOCK_DIV|reg\(16) & ((\CLOCK_DIV|reg[15]~55\) # (GND)))
-- \CLOCK_DIV|reg[16]~57\ = CARRY((!\CLOCK_DIV|reg[15]~55\) # (!\CLOCK_DIV|reg\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(16),
	datad => VCC,
	cin => \CLOCK_DIV|reg[15]~55\,
	combout => \CLOCK_DIV|reg[16]~56_combout\,
	cout => \CLOCK_DIV|reg[16]~57\);

-- Location: FF_X56_Y71_N5
\CLOCK_DIV|reg[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[16]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(16));

-- Location: LCCOMB_X56_Y71_N6
\CLOCK_DIV|reg[17]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[17]~58_combout\ = (\CLOCK_DIV|reg\(17) & (\CLOCK_DIV|reg[16]~57\ $ (GND))) # (!\CLOCK_DIV|reg\(17) & (!\CLOCK_DIV|reg[16]~57\ & VCC))
-- \CLOCK_DIV|reg[17]~59\ = CARRY((\CLOCK_DIV|reg\(17) & !\CLOCK_DIV|reg[16]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CLOCK_DIV|reg\(17),
	datad => VCC,
	cin => \CLOCK_DIV|reg[16]~57\,
	combout => \CLOCK_DIV|reg[17]~58_combout\,
	cout => \CLOCK_DIV|reg[17]~59\);

-- Location: FF_X56_Y71_N7
\CLOCK_DIV|reg[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[17]~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(17));

-- Location: LCCOMB_X56_Y71_N8
\CLOCK_DIV|reg[18]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[18]~60_combout\ = (\CLOCK_DIV|reg\(18) & (!\CLOCK_DIV|reg[17]~59\)) # (!\CLOCK_DIV|reg\(18) & ((\CLOCK_DIV|reg[17]~59\) # (GND)))
-- \CLOCK_DIV|reg[18]~61\ = CARRY((!\CLOCK_DIV|reg[17]~59\) # (!\CLOCK_DIV|reg\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(18),
	datad => VCC,
	cin => \CLOCK_DIV|reg[17]~59\,
	combout => \CLOCK_DIV|reg[18]~60_combout\,
	cout => \CLOCK_DIV|reg[18]~61\);

-- Location: FF_X56_Y71_N9
\CLOCK_DIV|reg[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[18]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(18));

-- Location: LCCOMB_X56_Y71_N10
\CLOCK_DIV|reg[19]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[19]~62_combout\ = (\CLOCK_DIV|reg\(19) & (\CLOCK_DIV|reg[18]~61\ $ (GND))) # (!\CLOCK_DIV|reg\(19) & (!\CLOCK_DIV|reg[18]~61\ & VCC))
-- \CLOCK_DIV|reg[19]~63\ = CARRY((\CLOCK_DIV|reg\(19) & !\CLOCK_DIV|reg[18]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CLOCK_DIV|reg\(19),
	datad => VCC,
	cin => \CLOCK_DIV|reg[18]~61\,
	combout => \CLOCK_DIV|reg[19]~62_combout\,
	cout => \CLOCK_DIV|reg[19]~63\);

-- Location: FF_X56_Y71_N11
\CLOCK_DIV|reg[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[19]~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(19));

-- Location: LCCOMB_X56_Y71_N12
\CLOCK_DIV|reg[20]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[20]~64_combout\ = (\CLOCK_DIV|reg\(20) & (!\CLOCK_DIV|reg[19]~63\)) # (!\CLOCK_DIV|reg\(20) & ((\CLOCK_DIV|reg[19]~63\) # (GND)))
-- \CLOCK_DIV|reg[20]~65\ = CARRY((!\CLOCK_DIV|reg[19]~63\) # (!\CLOCK_DIV|reg\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CLOCK_DIV|reg\(20),
	datad => VCC,
	cin => \CLOCK_DIV|reg[19]~63\,
	combout => \CLOCK_DIV|reg[20]~64_combout\,
	cout => \CLOCK_DIV|reg[20]~65\);

-- Location: FF_X56_Y71_N13
\CLOCK_DIV|reg[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[20]~64_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(20));

-- Location: LCCOMB_X56_Y71_N14
\CLOCK_DIV|reg[21]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[21]~66_combout\ = (\CLOCK_DIV|reg\(21) & (\CLOCK_DIV|reg[20]~65\ $ (GND))) # (!\CLOCK_DIV|reg\(21) & (!\CLOCK_DIV|reg[20]~65\ & VCC))
-- \CLOCK_DIV|reg[21]~67\ = CARRY((\CLOCK_DIV|reg\(21) & !\CLOCK_DIV|reg[20]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(21),
	datad => VCC,
	cin => \CLOCK_DIV|reg[20]~65\,
	combout => \CLOCK_DIV|reg[21]~66_combout\,
	cout => \CLOCK_DIV|reg[21]~67\);

-- Location: FF_X56_Y71_N15
\CLOCK_DIV|reg[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[21]~66_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(21));

-- Location: LCCOMB_X56_Y71_N16
\CLOCK_DIV|reg[22]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[22]~68_combout\ = (\CLOCK_DIV|reg\(22) & (!\CLOCK_DIV|reg[21]~67\)) # (!\CLOCK_DIV|reg\(22) & ((\CLOCK_DIV|reg[21]~67\) # (GND)))
-- \CLOCK_DIV|reg[22]~69\ = CARRY((!\CLOCK_DIV|reg[21]~67\) # (!\CLOCK_DIV|reg\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(22),
	datad => VCC,
	cin => \CLOCK_DIV|reg[21]~67\,
	combout => \CLOCK_DIV|reg[22]~68_combout\,
	cout => \CLOCK_DIV|reg[22]~69\);

-- Location: FF_X56_Y71_N17
\CLOCK_DIV|reg[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[22]~68_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(22));

-- Location: LCCOMB_X56_Y71_N18
\CLOCK_DIV|reg[23]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[23]~70_combout\ = (\CLOCK_DIV|reg\(23) & (\CLOCK_DIV|reg[22]~69\ $ (GND))) # (!\CLOCK_DIV|reg\(23) & (!\CLOCK_DIV|reg[22]~69\ & VCC))
-- \CLOCK_DIV|reg[23]~71\ = CARRY((\CLOCK_DIV|reg\(23) & !\CLOCK_DIV|reg[22]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(23),
	datad => VCC,
	cin => \CLOCK_DIV|reg[22]~69\,
	combout => \CLOCK_DIV|reg[23]~70_combout\,
	cout => \CLOCK_DIV|reg[23]~71\);

-- Location: FF_X56_Y71_N19
\CLOCK_DIV|reg[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[23]~70_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(23));

-- Location: LCCOMB_X56_Y71_N20
\CLOCK_DIV|reg[24]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[24]~72_combout\ = (\CLOCK_DIV|reg\(24) & (!\CLOCK_DIV|reg[23]~71\)) # (!\CLOCK_DIV|reg\(24) & ((\CLOCK_DIV|reg[23]~71\) # (GND)))
-- \CLOCK_DIV|reg[24]~73\ = CARRY((!\CLOCK_DIV|reg[23]~71\) # (!\CLOCK_DIV|reg\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CLOCK_DIV|reg\(24),
	datad => VCC,
	cin => \CLOCK_DIV|reg[23]~71\,
	combout => \CLOCK_DIV|reg[24]~72_combout\,
	cout => \CLOCK_DIV|reg[24]~73\);

-- Location: FF_X56_Y71_N21
\CLOCK_DIV|reg[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[24]~72_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(24));

-- Location: LCCOMB_X56_Y71_N22
\CLOCK_DIV|reg[25]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[25]~74_combout\ = (\CLOCK_DIV|reg\(25) & (\CLOCK_DIV|reg[24]~73\ $ (GND))) # (!\CLOCK_DIV|reg\(25) & (!\CLOCK_DIV|reg[24]~73\ & VCC))
-- \CLOCK_DIV|reg[25]~75\ = CARRY((\CLOCK_DIV|reg\(25) & !\CLOCK_DIV|reg[24]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CLOCK_DIV|reg\(25),
	datad => VCC,
	cin => \CLOCK_DIV|reg[24]~73\,
	combout => \CLOCK_DIV|reg[25]~74_combout\,
	cout => \CLOCK_DIV|reg[25]~75\);

-- Location: FF_X56_Y71_N23
\CLOCK_DIV|reg[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[25]~74_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(25));

-- Location: LCCOMB_X56_Y71_N24
\CLOCK_DIV|reg[26]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLOCK_DIV|reg[26]~76_combout\ = \CLOCK_DIV|reg\(26) $ (\CLOCK_DIV|reg[25]~75\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CLOCK_DIV|reg\(26),
	cin => \CLOCK_DIV|reg[25]~75\,
	combout => \CLOCK_DIV|reg[26]~76_combout\);

-- Location: FF_X56_Y71_N25
\CLOCK_DIV|reg[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \D_clk~inputclkctrl_outclk\,
	d => \CLOCK_DIV|reg[26]~76_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLOCK_DIV|reg\(26));

-- Location: CLKCTRL_G10
\CLOCK_DIV|reg[26]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_DIV|reg[26]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_DIV|reg[26]~clkctrl_outclk\);

-- Location: IOIBUF_X115_Y6_N15
\ALU_OP[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALU_OP(1),
	o => \ALU_OP[1]~input_o\);

-- Location: IOIBUF_X115_Y13_N1
\ALU_OP[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALU_OP(0),
	o => \ALU_OP[0]~input_o\);

-- Location: IOIBUF_X115_Y16_N8
\D_RA_sig~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_RA_sig,
	o => \D_RA_sig~input_o\);

-- Location: IOIBUF_X115_Y9_N22
\D_IE~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_IE,
	o => \D_IE~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\D_WD[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_WD(0),
	o => \D_WD[0]~input_o\);

-- Location: LCCOMB_X110_Y11_N14
\MUX_OP[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MUX_OP[0]~0_combout\ = (\D_IE~input_o\ & (\D_WD[0]~input_o\)) # (!\D_IE~input_o\ & ((\ALU_block|y\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_IE~input_o\,
	datac => \D_WD[0]~input_o\,
	datad => \ALU_block|y\(0),
	combout => \MUX_OP[0]~0_combout\);

-- Location: IOIBUF_X115_Y35_N22
\D_rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_rst,
	o => \D_rst~input_o\);

-- Location: IOIBUF_X115_Y11_N8
\D_WAddr[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_WAddr(1),
	o => \D_WAddr[1]~input_o\);

-- Location: IOIBUF_X115_Y18_N8
\D_WAddr[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_WAddr(0),
	o => \D_WAddr[0]~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\D_write_sig~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_write_sig,
	o => \D_write_sig~input_o\);

-- Location: LCCOMB_X111_Y11_N12
\REG_FILE|Decoder0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Decoder0~0_combout\ = (\D_WAddr[1]~input_o\ & (!\D_WAddr[0]~input_o\ & \D_write_sig~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_WAddr[1]~input_o\,
	datab => \D_WAddr[0]~input_o\,
	datad => \D_write_sig~input_o\,
	combout => \REG_FILE|Decoder0~0_combout\);

-- Location: FF_X111_Y11_N17
\REG_FILE|memr[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	asdata => \MUX_OP[0]~0_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	sload => VCC,
	ena => \REG_FILE|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_FILE|memr[2][0]~q\);

-- Location: IOIBUF_X115_Y5_N15
\D_RA[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_RA(1),
	o => \D_RA[1]~input_o\);

-- Location: LCCOMB_X112_Y11_N10
\REG_FILE|Decoder0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Decoder0~3_combout\ = (\D_WAddr[1]~input_o\ & (\D_WAddr[0]~input_o\ & \D_write_sig~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_WAddr[1]~input_o\,
	datab => \D_WAddr[0]~input_o\,
	datad => \D_write_sig~input_o\,
	combout => \REG_FILE|Decoder0~3_combout\);

-- Location: FF_X110_Y11_N25
\REG_FILE|memr[3][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	asdata => \MUX_OP[0]~0_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	sload => VCC,
	ena => \REG_FILE|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_FILE|memr[3][0]~q\);

-- Location: IOIBUF_X115_Y4_N15
\D_RA[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_RA(0),
	o => \D_RA[0]~input_o\);

-- Location: LCCOMB_X111_Y11_N22
\REG_FILE|memr[0][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|memr[0][0]~feeder_combout\ = \MUX_OP[0]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MUX_OP[0]~0_combout\,
	combout => \REG_FILE|memr[0][0]~feeder_combout\);

-- Location: LCCOMB_X111_Y11_N26
\REG_FILE|Decoder0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Decoder0~2_combout\ = (!\D_WAddr[1]~input_o\ & (!\D_WAddr[0]~input_o\ & \D_write_sig~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_WAddr[1]~input_o\,
	datab => \D_WAddr[0]~input_o\,
	datad => \D_write_sig~input_o\,
	combout => \REG_FILE|Decoder0~2_combout\);

-- Location: FF_X111_Y11_N23
\REG_FILE|memr[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	d => \REG_FILE|memr[0][0]~feeder_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	ena => \REG_FILE|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_FILE|memr[0][0]~q\);

-- Location: LCCOMB_X112_Y11_N28
\REG_FILE|memr[1][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|memr[1][0]~feeder_combout\ = \MUX_OP[0]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MUX_OP[0]~0_combout\,
	combout => \REG_FILE|memr[1][0]~feeder_combout\);

-- Location: LCCOMB_X112_Y11_N8
\REG_FILE|Decoder0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Decoder0~1_combout\ = (!\D_WAddr[1]~input_o\ & (\D_WAddr[0]~input_o\ & \D_write_sig~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_WAddr[1]~input_o\,
	datab => \D_WAddr[0]~input_o\,
	datad => \D_write_sig~input_o\,
	combout => \REG_FILE|Decoder0~1_combout\);

-- Location: FF_X112_Y11_N29
\REG_FILE|memr[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	d => \REG_FILE|memr[1][0]~feeder_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	ena => \REG_FILE|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_FILE|memr[1][0]~q\);

-- Location: LCCOMB_X111_Y11_N24
\REG_FILE|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Mux2~0_combout\ = (\D_RA[1]~input_o\ & (\D_RA[0]~input_o\)) # (!\D_RA[1]~input_o\ & ((\D_RA[0]~input_o\ & ((\REG_FILE|memr[1][0]~q\))) # (!\D_RA[0]~input_o\ & (\REG_FILE|memr[0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_RA[1]~input_o\,
	datab => \D_RA[0]~input_o\,
	datac => \REG_FILE|memr[0][0]~q\,
	datad => \REG_FILE|memr[1][0]~q\,
	combout => \REG_FILE|Mux2~0_combout\);

-- Location: LCCOMB_X110_Y11_N24
\REG_FILE|Mux2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Mux2~1_combout\ = (\D_RA[1]~input_o\ & ((\REG_FILE|Mux2~0_combout\ & ((\REG_FILE|memr[3][0]~q\))) # (!\REG_FILE|Mux2~0_combout\ & (\REG_FILE|memr[2][0]~q\)))) # (!\D_RA[1]~input_o\ & (((\REG_FILE|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \REG_FILE|memr[2][0]~q\,
	datab => \D_RA[1]~input_o\,
	datac => \REG_FILE|memr[3][0]~q\,
	datad => \REG_FILE|Mux2~0_combout\,
	combout => \REG_FILE|Mux2~1_combout\);

-- Location: LCCOMB_X110_Y11_N26
\REG_FILE|QA[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|QA\(0) = (\D_RA_sig~input_o\ & ((\REG_FILE|Mux2~1_combout\))) # (!\D_RA_sig~input_o\ & (\REG_FILE|QA\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \REG_FILE|QA\(0),
	datab => \D_RA_sig~input_o\,
	datad => \REG_FILE|Mux2~1_combout\,
	combout => \REG_FILE|QA\(0));

-- Location: IOIBUF_X115_Y10_N8
\ALU_OP[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALU_OP(2),
	o => \ALU_OP[2]~input_o\);

-- Location: IOIBUF_X115_Y10_N1
\D_RB_sig~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_RB_sig,
	o => \D_RB_sig~input_o\);

-- Location: IOIBUF_X115_Y4_N22
\D_RB[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_RB(1),
	o => \D_RB[1]~input_o\);

-- Location: IOIBUF_X115_Y15_N1
\D_RB[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_RB(0),
	o => \D_RB[0]~input_o\);

-- Location: LCCOMB_X111_Y11_N18
\REG_FILE|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Mux5~0_combout\ = (\D_RB[0]~input_o\ & ((\D_RB[1]~input_o\) # ((\REG_FILE|memr[1][0]~q\)))) # (!\D_RB[0]~input_o\ & (!\D_RB[1]~input_o\ & (\REG_FILE|memr[0][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_RB[0]~input_o\,
	datab => \D_RB[1]~input_o\,
	datac => \REG_FILE|memr[0][0]~q\,
	datad => \REG_FILE|memr[1][0]~q\,
	combout => \REG_FILE|Mux5~0_combout\);

-- Location: LCCOMB_X111_Y11_N4
\REG_FILE|Mux5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Mux5~1_combout\ = (\D_RB[1]~input_o\ & ((\REG_FILE|Mux5~0_combout\ & ((\REG_FILE|memr[3][0]~q\))) # (!\REG_FILE|Mux5~0_combout\ & (\REG_FILE|memr[2][0]~q\)))) # (!\D_RB[1]~input_o\ & (((\REG_FILE|Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_RB[1]~input_o\,
	datab => \REG_FILE|memr[2][0]~q\,
	datac => \REG_FILE|memr[3][0]~q\,
	datad => \REG_FILE|Mux5~0_combout\,
	combout => \REG_FILE|Mux5~1_combout\);

-- Location: LCCOMB_X110_Y11_N6
\REG_FILE|QB[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|QB\(0) = (\D_RB_sig~input_o\ & ((\REG_FILE|Mux5~1_combout\))) # (!\D_RB_sig~input_o\ & (\REG_FILE|QB\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \REG_FILE|QB\(0),
	datac => \D_RB_sig~input_o\,
	datad => \REG_FILE|Mux5~1_combout\,
	combout => \REG_FILE|QB\(0));

-- Location: LCCOMB_X109_Y11_N30
\ALU_block|Mux2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux2~1_combout\ = (\ALU_OP[0]~input_o\ & (!\ALU_OP[2]~input_o\ & ((\REG_FILE|QA\(0)) # (\REG_FILE|QB\(0))))) # (!\ALU_OP[0]~input_o\ & (\REG_FILE|QA\(0) & ((\ALU_OP[2]~input_o\) # (\REG_FILE|QB\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_OP[0]~input_o\,
	datab => \REG_FILE|QA\(0),
	datac => \ALU_OP[2]~input_o\,
	datad => \REG_FILE|QB\(0),
	combout => \ALU_block|Mux2~1_combout\);

-- Location: LCCOMB_X109_Y11_N24
\ALU_block|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux2~0_combout\ = (\ALU_OP[0]~input_o\ & ((\REG_FILE|QA\(0) & (!\ALU_OP[2]~input_o\ & \REG_FILE|QB\(0))) # (!\REG_FILE|QA\(0) & (\ALU_OP[2]~input_o\)))) # (!\ALU_OP[0]~input_o\ & ((\REG_FILE|QB\(0)) # ((\REG_FILE|QA\(0) & 
-- !\ALU_OP[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110100100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_OP[0]~input_o\,
	datab => \REG_FILE|QA\(0),
	datac => \ALU_OP[2]~input_o\,
	datad => \REG_FILE|QB\(0),
	combout => \ALU_block|Mux2~0_combout\);

-- Location: LCCOMB_X109_Y11_N16
\ALU_block|Mux2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux2~2_combout\ = \ALU_block|Mux2~1_combout\ $ (((!\ALU_OP[1]~input_o\ & \ALU_block|Mux2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALU_OP[1]~input_o\,
	datac => \ALU_block|Mux2~1_combout\,
	datad => \ALU_block|Mux2~0_combout\,
	combout => \ALU_block|Mux2~2_combout\);

-- Location: IOIBUF_X115_Y14_N8
\ALU_EN~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALU_EN,
	o => \ALU_EN~input_o\);

-- Location: FF_X110_Y11_N13
\ALU_block|y[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	asdata => \ALU_block|Mux2~2_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	sload => VCC,
	ena => \ALU_EN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ALU_block|y\(0));

-- Location: IOIBUF_X115_Y7_N15
\D_OE~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_OE,
	o => \D_OE~input_o\);

-- Location: IOIBUF_X115_Y15_N8
\D_WD[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_WD(1),
	o => \D_WD[1]~input_o\);

-- Location: LCCOMB_X112_Y11_N30
\MUX_OP[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MUX_OP[1]~1_combout\ = (\D_IE~input_o\ & (\D_WD[1]~input_o\)) # (!\D_IE~input_o\ & ((\ALU_block|y\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D_WD[1]~input_o\,
	datac => \D_IE~input_o\,
	datad => \ALU_block|y\(1),
	combout => \MUX_OP[1]~1_combout\);

-- Location: FF_X112_Y11_N11
\REG_FILE|memr[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	asdata => \MUX_OP[1]~1_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	sload => VCC,
	ena => \REG_FILE|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_FILE|memr[1][1]~q\);

-- Location: FF_X112_Y11_N9
\REG_FILE|memr[3][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	asdata => \MUX_OP[1]~1_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	sload => VCC,
	ena => \REG_FILE|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_FILE|memr[3][1]~q\);

-- Location: FF_X111_Y11_N27
\REG_FILE|memr[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	asdata => \MUX_OP[1]~1_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	sload => VCC,
	ena => \REG_FILE|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_FILE|memr[2][1]~q\);

-- Location: FF_X111_Y11_N13
\REG_FILE|memr[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	asdata => \MUX_OP[1]~1_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	sload => VCC,
	ena => \REG_FILE|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_FILE|memr[0][1]~q\);

-- Location: LCCOMB_X111_Y11_N10
\REG_FILE|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Mux4~0_combout\ = (\D_RB[0]~input_o\ & (\D_RB[1]~input_o\)) # (!\D_RB[0]~input_o\ & ((\D_RB[1]~input_o\ & (\REG_FILE|memr[2][1]~q\)) # (!\D_RB[1]~input_o\ & ((\REG_FILE|memr[0][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_RB[0]~input_o\,
	datab => \D_RB[1]~input_o\,
	datac => \REG_FILE|memr[2][1]~q\,
	datad => \REG_FILE|memr[0][1]~q\,
	combout => \REG_FILE|Mux4~0_combout\);

-- Location: LCCOMB_X111_Y11_N0
\REG_FILE|Mux4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Mux4~1_combout\ = (\D_RB[0]~input_o\ & ((\REG_FILE|Mux4~0_combout\ & ((\REG_FILE|memr[3][1]~q\))) # (!\REG_FILE|Mux4~0_combout\ & (\REG_FILE|memr[1][1]~q\)))) # (!\D_RB[0]~input_o\ & (((\REG_FILE|Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_RB[0]~input_o\,
	datab => \REG_FILE|memr[1][1]~q\,
	datac => \REG_FILE|memr[3][1]~q\,
	datad => \REG_FILE|Mux4~0_combout\,
	combout => \REG_FILE|Mux4~1_combout\);

-- Location: LCCOMB_X111_Y11_N30
\REG_FILE|QB[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|QB\(1) = (\D_RB_sig~input_o\ & ((\REG_FILE|Mux4~1_combout\))) # (!\D_RB_sig~input_o\ & (\REG_FILE|QB\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \REG_FILE|QB\(1),
	datac => \D_RB_sig~input_o\,
	datad => \REG_FILE|Mux4~1_combout\,
	combout => \REG_FILE|QB\(1));

-- Location: LCCOMB_X111_Y11_N14
\REG_FILE|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Mux1~0_combout\ = (\D_RA[1]~input_o\ & ((\D_RA[0]~input_o\) # ((\REG_FILE|memr[2][1]~q\)))) # (!\D_RA[1]~input_o\ & (!\D_RA[0]~input_o\ & ((\REG_FILE|memr[0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_RA[1]~input_o\,
	datab => \D_RA[0]~input_o\,
	datac => \REG_FILE|memr[2][1]~q\,
	datad => \REG_FILE|memr[0][1]~q\,
	combout => \REG_FILE|Mux1~0_combout\);

-- Location: LCCOMB_X112_Y11_N18
\REG_FILE|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Mux1~1_combout\ = (\D_RA[0]~input_o\ & ((\REG_FILE|Mux1~0_combout\ & ((\REG_FILE|memr[3][1]~q\))) # (!\REG_FILE|Mux1~0_combout\ & (\REG_FILE|memr[1][1]~q\)))) # (!\D_RA[0]~input_o\ & (((\REG_FILE|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \REG_FILE|memr[1][1]~q\,
	datab => \D_RA[0]~input_o\,
	datac => \REG_FILE|memr[3][1]~q\,
	datad => \REG_FILE|Mux1~0_combout\,
	combout => \REG_FILE|Mux1~1_combout\);

-- Location: LCCOMB_X112_Y11_N4
\REG_FILE|QA[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|QA\(1) = (\D_RA_sig~input_o\ & ((\REG_FILE|Mux1~1_combout\))) # (!\D_RA_sig~input_o\ & (\REG_FILE|QA\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \REG_FILE|QA\(1),
	datac => \D_RA_sig~input_o\,
	datad => \REG_FILE|Mux1~1_combout\,
	combout => \REG_FILE|QA\(1));

-- Location: LCCOMB_X109_Y11_N26
\ALU_block|Mux1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux1~3_combout\ = (\ALU_OP[1]~input_o\) # (!\ALU_OP[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALU_OP[2]~input_o\,
	datac => \ALU_OP[1]~input_o\,
	combout => \ALU_block|Mux1~3_combout\);

-- Location: LCCOMB_X109_Y11_N6
\ALU_block|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux1~0_combout\ = ((!\ALU_OP[0]~input_o\ & \ALU_OP[1]~input_o\)) # (!\ALU_OP[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_OP[0]~input_o\,
	datab => \ALU_OP[1]~input_o\,
	datad => \ALU_OP[2]~input_o\,
	combout => \ALU_block|Mux1~0_combout\);

-- Location: LCCOMB_X109_Y11_N22
\ALU_block|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux1~1_combout\ = (\ALU_OP[2]~input_o\ & ((\ALU_OP[0]~input_o\) # (\ALU_OP[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_OP[0]~input_o\,
	datab => \ALU_OP[2]~input_o\,
	datac => \ALU_OP[1]~input_o\,
	combout => \ALU_block|Mux1~1_combout\);

-- Location: LCCOMB_X110_Y11_N4
\ALU_block|Mux1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux1~4_combout\ = (\ALU_OP[1]~input_o\ & (\ALU_OP[0]~input_o\)) # (!\ALU_OP[1]~input_o\ & (\REG_FILE|QB\(0) & (\ALU_OP[0]~input_o\ $ (\REG_FILE|QA\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_OP[0]~input_o\,
	datab => \ALU_OP[1]~input_o\,
	datac => \REG_FILE|QA\(0),
	datad => \REG_FILE|QB\(0),
	combout => \ALU_block|Mux1~4_combout\);

-- Location: LCCOMB_X109_Y11_N18
\ALU_block|Mux1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux1~5_combout\ = (\ALU_OP[1]~input_o\ & ((\REG_FILE|QB\(1) & ((\REG_FILE|QA\(1)) # (\ALU_block|Mux1~4_combout\))) # (!\REG_FILE|QB\(1) & (\REG_FILE|QA\(1) & \ALU_block|Mux1~4_combout\)))) # (!\ALU_OP[1]~input_o\ & (\REG_FILE|QB\(1) $ 
-- (\REG_FILE|QA\(1) $ (\ALU_block|Mux1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \REG_FILE|QB\(1),
	datab => \ALU_OP[1]~input_o\,
	datac => \REG_FILE|QA\(1),
	datad => \ALU_block|Mux1~4_combout\,
	combout => \ALU_block|Mux1~5_combout\);

-- Location: LCCOMB_X109_Y11_N28
\ALU_block|Mux1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux1~2_combout\ = (\ALU_block|Mux1~0_combout\ & ((\ALU_block|Mux1~1_combout\ & (\REG_FILE|QA\(1))) # (!\ALU_block|Mux1~1_combout\ & ((\ALU_block|Mux1~5_combout\))))) # (!\ALU_block|Mux1~0_combout\ & (!\ALU_block|Mux1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_block|Mux1~0_combout\,
	datab => \ALU_block|Mux1~1_combout\,
	datac => \REG_FILE|QA\(1),
	datad => \ALU_block|Mux1~5_combout\,
	combout => \ALU_block|Mux1~2_combout\);

-- Location: LCCOMB_X109_Y11_N8
\ALU_block|Mux1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux1~combout\ = (\ALU_block|Mux1~3_combout\ & (((\ALU_block|Mux1~2_combout\)))) # (!\ALU_block|Mux1~3_combout\ & (\REG_FILE|QA\(1) $ (((\REG_FILE|QB\(1)) # (!\ALU_block|Mux1~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \REG_FILE|QB\(1),
	datab => \REG_FILE|QA\(1),
	datac => \ALU_block|Mux1~3_combout\,
	datad => \ALU_block|Mux1~2_combout\,
	combout => \ALU_block|Mux1~combout\);

-- Location: FF_X109_Y11_N7
\ALU_block|y[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	asdata => \ALU_block|Mux1~combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	sload => VCC,
	ena => \ALU_EN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ALU_block|y\(1));

-- Location: IOIBUF_X115_Y13_N8
\D_WD[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D_WD(2),
	o => \D_WD[2]~input_o\);

-- Location: LCCOMB_X110_Y11_N30
\MUX_OP[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MUX_OP[2]~2_combout\ = (\D_IE~input_o\ & (\D_WD[2]~input_o\)) # (!\D_IE~input_o\ & ((\ALU_block|y\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_IE~input_o\,
	datac => \D_WD[2]~input_o\,
	datad => \ALU_block|y\(2),
	combout => \MUX_OP[2]~2_combout\);

-- Location: LCCOMB_X111_Y11_N8
\REG_FILE|memr[2][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|memr[2][2]~feeder_combout\ = \MUX_OP[2]~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MUX_OP[2]~2_combout\,
	combout => \REG_FILE|memr[2][2]~feeder_combout\);

-- Location: FF_X111_Y11_N9
\REG_FILE|memr[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	d => \REG_FILE|memr[2][2]~feeder_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	ena => \REG_FILE|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_FILE|memr[2][2]~q\);

-- Location: FF_X110_Y11_N31
\REG_FILE|memr[3][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	d => \MUX_OP[2]~2_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	ena => \REG_FILE|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_FILE|memr[3][2]~q\);

-- Location: LCCOMB_X112_Y11_N24
\REG_FILE|memr[1][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|memr[1][2]~feeder_combout\ = \MUX_OP[2]~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MUX_OP[2]~2_combout\,
	combout => \REG_FILE|memr[1][2]~feeder_combout\);

-- Location: FF_X112_Y11_N25
\REG_FILE|memr[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	d => \REG_FILE|memr[1][2]~feeder_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	ena => \REG_FILE|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_FILE|memr[1][2]~q\);

-- Location: LCCOMB_X111_Y11_N6
\REG_FILE|memr[0][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|memr[0][2]~feeder_combout\ = \MUX_OP[2]~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MUX_OP[2]~2_combout\,
	combout => \REG_FILE|memr[0][2]~feeder_combout\);

-- Location: FF_X111_Y11_N7
\REG_FILE|memr[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	d => \REG_FILE|memr[0][2]~feeder_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	ena => \REG_FILE|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_FILE|memr[0][2]~q\);

-- Location: LCCOMB_X111_Y11_N20
\REG_FILE|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Mux3~0_combout\ = (\D_RB[1]~input_o\ & (((\D_RB[0]~input_o\)))) # (!\D_RB[1]~input_o\ & ((\D_RB[0]~input_o\ & (\REG_FILE|memr[1][2]~q\)) # (!\D_RB[0]~input_o\ & ((\REG_FILE|memr[0][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_RB[1]~input_o\,
	datab => \REG_FILE|memr[1][2]~q\,
	datac => \D_RB[0]~input_o\,
	datad => \REG_FILE|memr[0][2]~q\,
	combout => \REG_FILE|Mux3~0_combout\);

-- Location: LCCOMB_X111_Y11_N2
\REG_FILE|Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Mux3~1_combout\ = (\D_RB[1]~input_o\ & ((\REG_FILE|Mux3~0_combout\ & ((\REG_FILE|memr[3][2]~q\))) # (!\REG_FILE|Mux3~0_combout\ & (\REG_FILE|memr[2][2]~q\)))) # (!\D_RB[1]~input_o\ & (((\REG_FILE|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_RB[1]~input_o\,
	datab => \REG_FILE|memr[2][2]~q\,
	datac => \REG_FILE|memr[3][2]~q\,
	datad => \REG_FILE|Mux3~0_combout\,
	combout => \REG_FILE|Mux3~1_combout\);

-- Location: LCCOMB_X111_Y11_N16
\REG_FILE|QB[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|QB\(2) = (\D_RB_sig~input_o\ & ((\REG_FILE|Mux3~1_combout\))) # (!\D_RB_sig~input_o\ & (\REG_FILE|QB\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \REG_FILE|QB\(2),
	datab => \D_RB_sig~input_o\,
	datad => \REG_FILE|Mux3~1_combout\,
	combout => \REG_FILE|QB\(2));

-- Location: LCCOMB_X111_Y11_N28
\REG_FILE|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Mux0~0_combout\ = (\D_RA[0]~input_o\ & (((\D_RA[1]~input_o\) # (\REG_FILE|memr[1][2]~q\)))) # (!\D_RA[0]~input_o\ & (\REG_FILE|memr[0][2]~q\ & (!\D_RA[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \REG_FILE|memr[0][2]~q\,
	datab => \D_RA[0]~input_o\,
	datac => \D_RA[1]~input_o\,
	datad => \REG_FILE|memr[1][2]~q\,
	combout => \REG_FILE|Mux0~0_combout\);

-- Location: LCCOMB_X110_Y11_N0
\REG_FILE|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|Mux0~1_combout\ = (\D_RA[1]~input_o\ & ((\REG_FILE|Mux0~0_combout\ & ((\REG_FILE|memr[3][2]~q\))) # (!\REG_FILE|Mux0~0_combout\ & (\REG_FILE|memr[2][2]~q\)))) # (!\D_RA[1]~input_o\ & (((\REG_FILE|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \REG_FILE|memr[2][2]~q\,
	datab => \D_RA[1]~input_o\,
	datac => \REG_FILE|memr[3][2]~q\,
	datad => \REG_FILE|Mux0~0_combout\,
	combout => \REG_FILE|Mux0~1_combout\);

-- Location: LCCOMB_X110_Y11_N12
\REG_FILE|QA[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \REG_FILE|QA\(2) = (\D_RA_sig~input_o\ & ((\REG_FILE|Mux0~1_combout\))) # (!\D_RA_sig~input_o\ & (\REG_FILE|QA\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D_RA_sig~input_o\,
	datab => \REG_FILE|QA\(2),
	datad => \REG_FILE|Mux0~1_combout\,
	combout => \REG_FILE|QA\(2));

-- Location: LCCOMB_X110_Y11_N8
\ALU_block|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux0~2_combout\ = (\ALU_OP[1]~input_o\ & ((\ALU_OP[0]~input_o\ & ((\REG_FILE|QA\(2)) # (\REG_FILE|QB\(2)))) # (!\ALU_OP[0]~input_o\ & (\REG_FILE|QA\(2) & \REG_FILE|QB\(2))))) # (!\ALU_OP[1]~input_o\ & ((\REG_FILE|QA\(2) $ (\REG_FILE|QB\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_OP[0]~input_o\,
	datab => \ALU_OP[1]~input_o\,
	datac => \REG_FILE|QA\(2),
	datad => \REG_FILE|QB\(2),
	combout => \ALU_block|Mux0~2_combout\);

-- Location: LCCOMB_X110_Y11_N20
\ALU_block|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux0~0_combout\ = (\ALU_OP[0]~input_o\ $ (!\REG_FILE|QA\(0))) # (!\REG_FILE|QB\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_OP[0]~input_o\,
	datac => \REG_FILE|QA\(0),
	datad => \REG_FILE|QB\(0),
	combout => \ALU_block|Mux0~0_combout\);

-- Location: LCCOMB_X110_Y11_N10
\ALU_block|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux0~1_combout\ = (\REG_FILE|QB\(1) & (\ALU_block|Mux0~0_combout\ & (\ALU_OP[0]~input_o\ $ (!\REG_FILE|QA\(1))))) # (!\REG_FILE|QB\(1) & ((\ALU_block|Mux0~0_combout\) # (\ALU_OP[0]~input_o\ $ (!\REG_FILE|QA\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101011101000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \REG_FILE|QB\(1),
	datab => \ALU_OP[0]~input_o\,
	datac => \REG_FILE|QA\(1),
	datad => \ALU_block|Mux0~0_combout\,
	combout => \ALU_block|Mux0~1_combout\);

-- Location: LCCOMB_X110_Y11_N16
\ALU_block|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux0~3_combout\ = \ALU_block|Mux0~2_combout\ $ (((!\ALU_OP[1]~input_o\ & !\ALU_block|Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_OP[1]~input_o\,
	datab => \ALU_block|Mux0~2_combout\,
	datad => \ALU_block|Mux0~1_combout\,
	combout => \ALU_block|Mux0~3_combout\);

-- Location: LCCOMB_X110_Y11_N2
\ALU_block|Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux0~4_combout\ = (\ALU_block|Mux1~0_combout\ & ((\ALU_block|Mux1~1_combout\ & (\REG_FILE|QA\(2))) # (!\ALU_block|Mux1~1_combout\ & ((\ALU_block|Mux0~3_combout\))))) # (!\ALU_block|Mux1~0_combout\ & (!\ALU_block|Mux1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_block|Mux1~0_combout\,
	datab => \ALU_block|Mux1~1_combout\,
	datac => \REG_FILE|QA\(2),
	datad => \ALU_block|Mux0~3_combout\,
	combout => \ALU_block|Mux0~4_combout\);

-- Location: LCCOMB_X110_Y11_N28
\ALU_block|Mux0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|Mux0~combout\ = (\ALU_block|Mux1~3_combout\ & (((\ALU_block|Mux0~4_combout\)))) # (!\ALU_block|Mux1~3_combout\ & (\REG_FILE|QA\(2) $ (((\REG_FILE|QB\(2)) # (!\ALU_block|Mux0~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_block|Mux1~3_combout\,
	datab => \REG_FILE|QB\(2),
	datac => \REG_FILE|QA\(2),
	datad => \ALU_block|Mux0~4_combout\,
	combout => \ALU_block|Mux0~combout\);

-- Location: FF_X110_Y11_N27
\ALU_block|y[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	asdata => \ALU_block|Mux0~combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	sload => VCC,
	ena => \ALU_EN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ALU_block|y\(2));

-- Location: LCCOMB_X109_Y11_N4
\ALU_block|WideOr0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|WideOr0~combout\ = (\ALU_block|Mux2~2_combout\) # ((\ALU_block|Mux1~combout\) # (\ALU_block|Mux0~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALU_block|Mux2~2_combout\,
	datac => \ALU_block|Mux1~combout\,
	datad => \ALU_block|Mux0~combout\,
	combout => \ALU_block|WideOr0~combout\);

-- Location: FF_X109_Y11_N5
\ALU_block|z_f\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	d => \ALU_block|WideOr0~combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	ena => \ALU_EN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ALU_block|z_f~q\);

-- Location: FF_X110_Y11_N17
\ALU_block|n_f\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	asdata => \ALU_block|Mux0~combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	sload => VCC,
	ena => \ALU_EN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ALU_block|n_f~q\);

-- Location: LCCOMB_X110_Y11_N18
\ALU_block|o_f_tmp~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|o_f_tmp~0_combout\ = (\REG_FILE|QA\(2) & (!\ALU_block|Mux0~combout\ & (\ALU_OP[2]~input_o\ $ (\REG_FILE|QB\(2))))) # (!\REG_FILE|QA\(2) & (\ALU_block|Mux0~combout\ & (\ALU_OP[2]~input_o\ $ (!\REG_FILE|QB\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100101100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_OP[2]~input_o\,
	datab => \REG_FILE|QB\(2),
	datac => \REG_FILE|QA\(2),
	datad => \ALU_block|Mux0~combout\,
	combout => \ALU_block|o_f_tmp~0_combout\);

-- Location: LCCOMB_X110_Y11_N22
\ALU_block|o_f_tmp~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU_block|o_f_tmp~1_combout\ = (!\ALU_OP[1]~input_o\ & (!\ALU_OP[0]~input_o\ & \ALU_block|o_f_tmp~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALU_OP[1]~input_o\,
	datac => \ALU_OP[0]~input_o\,
	datad => \ALU_block|o_f_tmp~0_combout\,
	combout => \ALU_block|o_f_tmp~1_combout\);

-- Location: FF_X110_Y11_N23
\ALU_block|o_f\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_DIV|reg[26]~clkctrl_outclk\,
	d => \ALU_block|o_f_tmp~1_combout\,
	clrn => \ALT_INV_D_rst~input_o\,
	ena => \ALU_EN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ALU_block|o_f~q\);

ww_D_output(0) <= \D_output[0]~output_o\;

ww_D_output(1) <= \D_output[1]~output_o\;

ww_D_output(2) <= \D_output[2]~output_o\;

ww_D_z_f <= \D_z_f~output_o\;

ww_D_n_f <= \D_n_f~output_o\;

ww_D_o_f <= \D_o_f~output_o\;
END structure;


