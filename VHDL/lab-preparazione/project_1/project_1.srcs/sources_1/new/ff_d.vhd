library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;

entity ff_d is
	Generic (
		WIDTH : integer := 4
	);
	Port(
		reset	: in std_logic;
		clk		: in std_logic;

		d 	:	in std_logic_vector(WIDTH downto 0);
		q 	: out std_logic_vector(WIDTH downto 0)
	);
end ff_d;

architecture Behavioral of ff_d is
	signal q_int : std_logic_vector := (Others => 'U');
begin

	q_int	<= 	(Others => '0') when reset = '1' else
				d 	when rising_edge(clk) else q_int;

	q <= q_int;

end Behavioral;