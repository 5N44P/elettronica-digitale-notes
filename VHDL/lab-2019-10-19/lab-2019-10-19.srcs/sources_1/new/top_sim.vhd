library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;

entity top_sim is
--  Port ( );
end top_sim;

architecture Behavioral of top_sim is

	constant LARGHEZZA_SR_SIPO : integer := 4; -- Ora prova a cambiare in 32

	component ShiftRegisterSIPO is
		Generic(
			SR_WIDTH	: integer
		);
		Port(
			reset		: in std_logic;
			clk			: in std_logic;

			data_in		: in std_logic;

			data_out	: inout std_logic_vector(SR_WIDTH-1 DOWNTO 0)

		);
	end component;

	signal clk		: std_logic := '0';
	signal reset	: std_logic := '0';
	signal data_in	: std_logic := '0';
	-- data_out serve solo per vedere il segnale direttamente in simulazione
	signal data_out	: std_logic_vector(LARGHEZZA_SR_SIPO-1 DOWNTO 0);

begin

	SR_inst : ShiftRegisterSIPO
		Generic Map(
			SR_WIDTH	=> LARGHEZZA_SR_SIPO
		)
		Port Map(
			reset		=> reset,
			clk			=> clk,

			data_in		=> data_in,

			data_out	=> data_out

		);

	clk <= not clk after 5 ns;

	process
	begin
		wait for 15 ns;

		data_in	<= '0';
		reset 	<= '1';

		wait for 50 ns;

		reset 	<= '0';

		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '0';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '0';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '0';
		wait until rising_edge(clk);
		data_in<= '0';
		wait until rising_edge(clk);
		data_in<= '0';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '0';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '0';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '0';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '0';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '0';
		wait until rising_edge(clk);
		data_in<= '1';
		wait until rising_edge(clk);
		data_in<= '1';

		wait;
	end process;
end Behavioral;
