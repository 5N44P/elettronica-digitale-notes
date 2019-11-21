library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.NUMERIC_STD.ALL;

entity top_sim is
--  Port ( );
end top_sim;

architecture Behavioral of top_sim is

	component nibble_adder is
	Port(

		a	: in std_logic_vector(3 DOWNTO 0);
		b	: in std_logic_vector(3 DOWNTO 0);

		sum	: out std_logic_vector(3 DOWNTO 0)
	);
	end component;

	signal a,b,sum	: std_logic_vector(3 DOWNTO 0);
begin

	dut : nibble_adder
		Port map(

			a	=> a,
			b	=> b,

			sum	=> sum
		);

	drive_a : process
	begin
		a <= 	std_logic_vector(to_unsigned(1, a'LENGTH));
		wait for 200 ns;
		a <= 	std_logic_vector(to_unsigned(2, a'LENGTH));
		wait for 200 ns;
		a <= 	std_logic_vector(to_unsigned(3, a'LENGTH));
		wait;
	end process;



	drive_b : process
	begin
		b <=	std_logic_vector(to_unsigned(0, b'LENGTH));
		wait for 100 ns;
		b <=	std_logic_vector(to_unsigned(1, b'LENGTH));
		wait for 100 ns;
		b <=	std_logic_vector(to_unsigned(2, b'LENGTH));
		wait for 100 ns;
		b <=	std_logic_vector(to_unsigned(3, b'LENGTH));
		wait;
	end process;
end Behavioral;
