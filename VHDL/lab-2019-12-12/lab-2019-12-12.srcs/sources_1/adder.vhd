library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.ALL;

entity adder is
	Port (

	input_a			: in unsigned(31 DOWNTO 0);
	input_b			: in unsigned(31 DOWNTO 0);

	result			: out unsigned(31 DOWNTO 0)

	);
end adder;

architecture Behavioral of adder is
	signal temp : unsigned(31 DOWNTO 0) := (Others => '0');
begin

	temp <= input_a + input_b;
	result <= (Others => 'U') after 2 ns, temp(result'range) after 7 ns;

end Behavioral;
