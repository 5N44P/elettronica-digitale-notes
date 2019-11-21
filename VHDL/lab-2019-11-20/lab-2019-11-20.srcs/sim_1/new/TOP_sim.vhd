----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 20.11.2019 15:07:56
-- Design Name:
-- Module Name: TOP_sim - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP_sim is
  Generic(
    FIFO_WIDTH : integer := 8;
    FIFO_DEPTH : integer := 16
  );
end TOP_sim;

architecture Behavioral of TOP_sim is
  signal clk : std_logic := '0';
  signal rd_en, wr_en : std_logic := '0';
  signal reset : std_logic := '1';
  
  signal din : std_logic_vector(FIFO_WIDTH-1 DOWNTO 0) := (Others => '0');

  component FIFO is
    Port(
      reset : in std_logic;
      clk   : in std_logic;
      din   : in std_logic_vector(FIFO_WIDTH-1 DOWNTO 0);
      dout  : out std_logic_vector(FIFO_WIDTH-1 DOWNTO 0);
      rd_en : in std_logic;
      wr_en : in std_logic;
      full  : out std_logic;
      empty : out std_logic
    );
  end component;
begin
  dut: FIFO port map(
    reset => reset,
    clk => clk,
    din => din,
    rd_en => rd_en,
    wr_en => wr_en
  );

  clk <= not clk after 50 ns;

    drive_reset : process
      begin
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait;
      end process;

    drive_data : process
      begin
        wait for 100 ns;
        din <= "00000001";
        wr_en <= '1';
        wait for 100 ns;
        wr_en <= '0';

        din <= "00000010";
        wr_en <= '1';
        wait for 100 ns;
        wr_en <= '0';

        wait for 100 ns;
        rd_en <= '1';
        wait for 100 ns;
        rd_en <= '0';
        
        wait for 200 ns;
        rd_en <= '1';
        wait for 100 ns;
        rd_en <= '0';

        wait;
      end process;






end Behavioral;
