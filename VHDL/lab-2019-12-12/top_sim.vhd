-- Cambiare il component istanziato in base all'esercizio da testare ed il clk

library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.ALL;

entity top_sim is
--  Port ( );
end top_sim;

architecture Behavioral of top_sim is

	constant CLK_PERIOD : time := 10 ns;

	component MegaOperation is
		Port (
			reset	: in std_logic;
			clk		: in std_logic;


			input_a	: in std_logic_vector(31 DOWNTO 0);
			input_b	: in std_logic_vector(31 DOWNTO 0);
			input_c	: in std_logic_vector(31 DOWNTO 0);

			result	: out std_logic_vector(31 DOWNTO 0)
			);
	end component;

	signal reset 	: std_logic := '0';
	signal clk		: std_logic := '1';

	signal input_a, input_b, input_c, result	: std_logic_vector(31 DOWNTO 0);
	signal input_a_integer, input_b_integer, input_c_integer, result_integer	: integer;

begin

	esercizio_4_inst : MegaOperation
		Port Map(
			reset	=> reset,
			clk		=> clk,


			input_a	=> input_a,
			input_b	=> input_b,
			input_c => input_c,

			result	=> result
			);

	clk <= not clk after CLK_PERIOD/2;

	input_a 	<= std_logic_vector(to_unsigned(input_a_integer, input_a'LENGTH));
	input_b 	<= std_logic_vector(to_unsigned(input_b_integer, input_b'LENGTH));
	input_c 	<= std_logic_vector(to_unsigned(input_c_integer, input_c'LENGTH));
	result_integer	<= to_integer(unsigned(result));

	process
	begin

		input_a_integer <= 10;
		input_b_integer <= 0;
		input_c_integer <= 0;

		-- for I in 0 to 5 loop
			wait until rising_edge(clk);
		-- end loop;
		input_a_integer <= 10;
		input_b_integer <= 1;
		input_c_integer <= 1;

		wait until rising_edge(clk);

		input_a_integer <= 10;
		input_b_integer <= 2;
		input_c_integer <= 2;

		wait until rising_edge(clk);

		input_a_integer <= 10;
		input_b_integer <= 3;
		input_c_integer <= 3;

		wait until rising_edge(clk);

		input_a_integer <= 10;
		input_b_integer <= 4;
		input_c_integer <= 4;

		wait until rising_edge(clk);

		input_a_integer <= 10;
		input_b_integer <= 5;
		input_c_integer <= 5;

		wait;
	end process;

end Behavioral;
