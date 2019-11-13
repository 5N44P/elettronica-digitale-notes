----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 13.11.2019 14:22:37
-- Design Name:
-- Module Name: PWM - Behavioral
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

entity PWM is
    Port (
        reset : in std_logic;
        clk : in std_logic;
        t_on : in std_logic_vector(8-1 DOWNTO 0); -- UNSIGNED
        t_total : in std_logic_vector(8-1 DOWNTO 0); -- UNSIGNED
        pwm_out : out std_logic
    );
end PWM;

architecture Behavioral of PWM is

  signal timercount : unsigned(t_total'RANGE);



begin
    process (clk,reset)
    begin
      if reset = '1' then
        pwm_out <= '0';
        timercount <= (Others => '0');

      elsif rising_edge(clk) then

        if (timercount < unsigned(t_on)) then
          pwm_out <= '1';
        elsif (timercount >= unsigned(t_on)) then
          pwm_out <= '0';
        end if;
        
        timercount <= timercount + 1;

        if (timercount = unsigned(t_total)) then
          timercount <= (Others => '0');
          pwm_out <= '1';
        end if;
       end if;


    end process;


end Behavioral;
