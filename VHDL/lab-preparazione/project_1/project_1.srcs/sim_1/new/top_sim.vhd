
library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.ALL;

entity top_sim is
--  Port ( );
end top_sim;

architecture Behavioral of top_sim is

	constant CLK_PERIOD : time := 10 ns;

    component MM is
        generic(
            MEAN_LENGTH2	: integer := 2;
            DATA_WIDTH	: integer := 8
        );
        Port (
            clk		    : in std_logic;
            data_in		: in unsigned(DATA_WIDTH-1 DOWNTO 0);
            data_out	: out unsigned(DATA_WIDTH-1 DOWNTO 0)
        );
    end component;

	signal clk		: std_logic := '1';

	signal data_in, data_out : unsigned(7 DOWNTO 0);

begin

	MEDIA_MOBILE : MM
		Port Map(
			clk		=> clk,
			data_in	=> data_in,
			data_out => data_out
			);

	clk <= not clk after CLK_PERIOD/2;
	
	

	process
	begin
		data_in <= to_unsigned(1, data_in'LENGTH);
		wait until rising_edge(clk);
		data_in <= to_unsigned(2, data_in'LENGTH);
		wait until rising_edge(clk);
		data_in <= to_unsigned(3, data_in'LENGTH);
		wait until rising_edge(clk);
		data_in <= to_unsigned(4, data_in'LENGTH);
		wait until rising_edge(clk);
		data_in <= to_unsigned(5, data_in'LENGTH);
		wait until rising_edge(Clk);
		data_in <= to_unsigned(6, data_in'LENGTH);
		wait until rising_edge(clk);
		data_in <= to_unsigned(7, data_in'LENGTH);
		wait until rising_edge(clk);
		data_in <= to_unsigned(8, data_in'LENGTH);
		wait until rising_edge(clk);
		data_in <= to_unsigned(9, data_in'LENGTH);
		wait until rising_edge(clk);
		data_in <= to_unsigned(10, data_in'LENGTH);
		wait until rising_edge(clk);

    
		wait;
	end process;

end Behavioral;
