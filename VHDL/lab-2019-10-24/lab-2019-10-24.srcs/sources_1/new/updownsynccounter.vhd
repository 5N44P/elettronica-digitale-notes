----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 24.10.2019 09:21:39
-- Design Name:
-- Module Name: updownsynccounter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UpDownSyncCounter is
  Generic(
    COUNT_WIDTH : integer := 4
  );
  Port (
    reset : in std_logic;
    clk : in std_logic;
    inc_count : in std_logic;
    dec_count : in std_logic;
    count : out std_logic_vector(COUNT_WIDTH-1 DOWNTO 0) -- Signed
  );
end UpDownSyncCounter;

architecture Behavioral of updownsynccounter is

  signal internal_count: signed(COUNT_WIDTH-1 DOWNTO 0);
  signal inc_vector: std_logic_vector(0 DOWNTO 0);
  signal dec_vector: std_logic_vector(0 DOWNTO 0);
  

  component ff_d is
  	Port(
  		reset	: in std_logic;
  		clk		: in std_logic;
  		d 		:	in std_logic;
  		q 		: out std_logic
  	);
  end component;


begin

inc_vector(0) <= inc_count;
dec_vector(0) <= dec_count;

  flipflop_instantiater: for I in 0 to COUNT_WIDTH-1 generate
    ff_d_inst: ff_d port map(
      reset => reset,
      clk => clk,
      d => internal_count(I),
      q => count(I)
    );
  end generate;

  internal_count <= signed(count) + signed(inc_vector) - signed(dec_vector);


end Behavioral;
