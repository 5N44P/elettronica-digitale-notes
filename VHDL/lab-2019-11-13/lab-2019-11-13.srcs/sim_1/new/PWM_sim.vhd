library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_sim is
--  Port ( );
end top_sim;

architecture Behavioral of top_sim is
    signal clk : std_logic := '0';
    signal reset,pwm_out : std_logic;
    signal t_on : std_logic_vector(8-1 DOWNTO 0) := "00000100";
    signal t_total : std_logic_vector(8-1 DOWNTO 0) := "00100000";
    
    component PWM is
        Port (
        reset : in std_logic;
        clk : in std_logic;
        t_on : in std_logic_vector(8-1 DOWNTO 0); -- UNSIGNED
        t_total : in std_logic_vector(8-1 DOWNTO 0); -- UNSIGNED
        pwm_out : out std_logic
    );
end component;
begin
    dut: PWM port map(
        reset    => reset, 
        clk      => clk,
        t_on     => t_on,
        t_total  => t_total,
        pwm_out  => pwm_out
        );
        
   clk <= not clk after 5 ns;
   
    drive_reset : process
        begin
         reset <= '1';
         wait for 10 ns;
         reset <= '0';
         wait;
        end process;
end Behavioral;