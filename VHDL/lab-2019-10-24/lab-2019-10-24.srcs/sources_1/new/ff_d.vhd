library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;

entity ff_d is
	Port(
		reset	: in std_logic;
		clk		: in std_logic;

		d 	:	in std_logic;
		q 	: out std_logic
	);
end ff_d;

architecture Behavioral of ff_d is
	signal q_int : std_logic := 'U';
begin

	q_int	<= 	'0' when reset = '1' else
				d 	when rising_edge(clk) else q_int;

	q <= q_int;
	
end Behavioral;
