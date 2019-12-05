----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 27.11.2019 14:09:44
-- Design Name:
-- Module Name: FSM - Behavioral
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
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_moore is
  Port (
    clk : in std_logic;
    reset : in std_logic;
    signal_in : in std_logic;
    upEdge : out std_logic;
    downEdge : out std_logic
  );
end FSM_moore;

architecture Behavioral of FSM_moore is

  type stati is (start, last_0, last_1, rising, falling);

  signal current_state : stati := start;

begin
  process (clk, reset)
  begin
    if reset = '1' then
      current_state <= start;
      downEdge <= '0';
      upEdge <= '0';
    elsif rising_edge(clk) then

      if current_state = start then
        if signal_in = '1' then
          current_state <= last_1;
        else
          current_state <= last_0;
        end if;
      end if;


      -- assegnazione uscite, fatto all'inizio per evitare problemi di signal commit
      -- se ci fosse bisogno di inserire un'operazione che committa in simulazione

      if current_state = rising then
        upEdge <= '1';
      else
        upEdge <= '0';
      end if;

      if current_state = falling then
        downEdge <= '1';
      else
        downEdge <= '0';
      end if;


      -- cambio stati
      if current_state = last_0 or current_state = falling  then
        if signal_in = '1' then
          current_state <= rising;
        else
          current_state <= last_0;
        end if;
      elsif current_state = last_1 or current_state = rising then
        if signal_in = '0' then
          current_state <= falling;
        else
          current_state <= last_1;
        end if;
      end if;

    end if;

  end process;
end Behavioral;
