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

entity FSM_mealy is
  Port (
    clk : in std_logic;
    reset : in std_logic;
    signal_in : in std_logic;
    upEdge : out std_logic;
    downEdge : out std_logic
  );
end FSM_mealy;

architecture Behavioral of FSM_mealy is

  type stati is (start, last_0, last_1);

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

      -- cambio stati
      if current_state = last_0 then
        if signal_in = '1' then
          current_state <= last_1; -- verrà committato alla fine del process
          upEdge <= '1';
          downEdge <= '0';
        else
          downEdge <= '0';
          upEdge <= '0';
        end if;
      elsif current_state = last_1 then
        if signal_in = '0' then
          current_state <= last_0;  -- verrà committato alla fine del process
          downEdge <= '1';
          upEdge <= '0';
        else
          downEdge <= '0';
          upEdge <= '0';
        end if;
      end if;
    end if;

  end process;
end Behavioral;
