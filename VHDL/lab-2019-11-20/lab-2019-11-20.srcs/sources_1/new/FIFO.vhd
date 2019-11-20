----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 20.11.2019 13:48:26
-- Design Name:
-- Module Name: FIFO - Behavioral
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

entity FIFO is
  Generic(
    FIFO_WIDTH : integer := 8;
    FIFO_DEPTH : integer := 16
  );
  Port(
    reset : in std_logic;
    clk : in std_logic;
    din : in std_logic_vector(FIFO_WIDTH-1 DOWNTO 0);
    dout : out std_logic_vector(FIFO_WIDTH-1 DOWNTO 0) := (Others => '0');
    rd_en : in std_logic;
    wr_en : in std_logic;
    full : out std_logic := '0';
    empty : out std_logic := '1'
  );
end FIFO;



architecture Behavioral of FIFO is

    type FIFO_memory_type IS ARRAY (0 TO FIFO_DEPTH-1) of std_logic_vector(FIFO_WIDTH-1 downto 0);

    signal FIFO_memory    : FIFO_memory_type := (Others => (Others => '0')); -- si fa davvero così?
    signal write_pointer  : integer := 0;
    signal read_pointer   : integer := 0;
    signal n_elements     : integer := 0;
begin

  process (clk, reset)
  begin
    if reset = '1' then
      write_pointer <= 0;
      read_pointer <= 0;
      n_elements <= 0;
    elsif rising_edge(clk) then
      if n_elements = 0 then
        empty <= '1';
        full <= '0';
      elsif (n_elements = FIFO_DEPTH) then
        empty <= '0';
        full <= '1';
      else
        empty <= '0';
        full <= '0';
      end if;

      if rd_en = '1' and n_elements > 0 then
        dout <= FIFO_memory(read_pointer);
        read_pointer <= read_pointer + 1;
        n_elements <= n_elements - 1;

        if(read_pointer >= FIFO_DEPTH) then
          read_pointer <= 0;
        end if;
      end if;

      if wr_en = '1' and n_elements < FIFO_WIDTH then
        FIFO_memory(write_pointer) <= din;
        write_pointer <= write_pointer + 1;
        n_elements <= n_elements + 1;

        if(write_pointer >= FIFO_DEPTH) then
          write_pointer <= 0;
        end if;
      end if;


    end if;






  end process;


end Behavioral;
