----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 16.01.2020 15:46:10
-- Design Name:
-- Module Name: mm - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MM is
	generic(
		MEAN_LENGTH2	: integer := 2;
		DATA_WIDTH	: integer := 8

	);
	Port (
		clk		: in std_logic;

		data_in		: in unsigned(DATA_WIDTH-1 DOWNTO 0);
		data_out	: out unsigned(DATA_WIDTH-1 DOWNTO 0)
	);
end MM;

architecture Behavioral of mm is

	type tipo_memorietta is array (2**MEAN_LENGTH2 DOWNTO 0) of unsigned(DATA_WIDTH-1 DOWNTO 0);

	signal memorietta : tipo_memorietta := (Others	=> (Others => '0')); -- this is the memory where the values have to be stored
	signal somma : unsigned (DATA_WIDTH-1 DOWNTO 0) := (Others => '0');
	

begin

    
	process(clk)
		begin
		  if rising_edge(clk) then 
			for i in 2**MEAN_LENGTH2 DOWNTO 1 loop
				memorietta(i) <= memorietta(i-1);
			end loop;
			memorietta(0) <= data_in;
			somma <=  somma + memorietta(0) -  memorietta((2**MEAN_LENGTH2)); -- SRL MEAN_LENGTH2);
			data_out <= somma SRL MEAN_LENGTH2;
          end if;
	end process;
end Behavioral;
