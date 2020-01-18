library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.ALL;

entity multiplier is
	Port (

	input_a			: in unsigned(31 DOWNTO 0);
	input_b			: in unsigned(31 DOWNTO 0);

	result			: out unsigned(31 DOWNTO 0)

	);
end multiplier;

architecture Behavioral of multiplier is
	signal temp : unsigned(63 DOWNTO 0) := (Others => '0');
begin

	temp <= input_a * input_b;
	result <= (Others => 'U') after 2 ns, temp(result'range) after 15 ns;

end Behavioral;
