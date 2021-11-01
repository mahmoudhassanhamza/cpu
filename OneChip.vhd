
library ieee;
use ieee.std_logic_1164.all;


entity OneChip is 
generic(N:integer;
M:integer);
port(clk,rst : in std_logic);
end entity;

architecture data_flow of OneChip is

component cpu is
    generic(N:integer;
            M:integer);
    port(clk,reset:IN std_logic;
         Din:IN std_logic_vector(N-1 downto 0);
         address:OUT std_logic_vector(N-1 downto 0);
         Dout:OUT std_logic_vector(N-1 downto 0);
         RW:OUT std_logic);
    end component;

component memory IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);




END component;   

signal Din          : std_logic_vector(N-1 downto 0);
signal address      : std_logic_vector(N-1 downto 0);
signal Dout_cpu     : std_logic_vector(N-1 downto 0);
signal Dout_memory  : std_logic_vector(N-1 downto 0);
signal Din_memory  : std_logic_vector(N-1 downto 0);
signal RW           : std_logic;


signal address_temp      : std_logic_vector(N-1 downto 0);
signal Din_memory_temp   : std_logic_vector(N-1 downto 0);
signal RW_temp           :std_logic;
signal Dout_memory_temp  : std_logic_vector(N-1 downto 0);

begin
    CP : cpu 
    generic map (N => N , M => M )
    port map (
        clk => clk,
        reset => rst,
        Din => Dout_memory,
        address =>address,
        Dout => Din_memory,
        RW => RW
    );
    memr : memory 

    port map (
        address => address_temp(7 downto 0),
        clock => clk,
        data => Din_memory_temp,
        wren => RW_temp,
        q    => Dout_memory
    );

    process ( clk )
    begin
        if rst = '1' then
                        
            address_temp    <= (others => '0');
            Din_memory_temp <= (others => '0');
            RW_temp         <= '1';

        elsif  rising_edge (clk) then
                
            address_temp    <= address;
            Din_memory_temp <= Din_memory;
            RW_temp         <= RW;
        end if;
    end process;

                



end data_flow;
