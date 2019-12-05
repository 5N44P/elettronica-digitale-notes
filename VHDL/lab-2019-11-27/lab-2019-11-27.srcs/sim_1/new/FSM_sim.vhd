library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_sim is

end top_sim;

architecture Behavioral of top_sim is
    signal reset, signal_in,upEdge,downEdge: std_logic := '0' ;
    signal clk : std_logic := '0';

    
    component FSM_moore is
      Port (
          clk : in std_logic;
          reset : in std_logic;
          signal_in : in std_logic;
          upEdge : out std_logic;
          downEdge : out std_logic
      );
    end component;
begin
    dut : FSM_moore port map(
      clk         => clk,      
      reset       => reset,    
      signal_in   => signal_in,
      upEdge      => upEdge,  
      downEdge    => downEdge 
    );
    
    clk <= not clk after 5 ns;
    
    --pattern_in <= "1001";
    
    drive_reset : process
    begin
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 90 ns;
        reset <= '1';
        wait;
    end process;

    drive_signal_in : process
        begin
            signal_in <= '0';
            wait for 14 ns;
            signal_in <= '1';
            wait for 10 ns;
            signal_in <= '0';
            wait for 25 ns;                      
            signal_in <= '1';
            wait for 35 ns;
            signal_in <= '0';
            wait for 20 ns;
            signal_in <= '1';
            wait for 25 ns;
            signal_in <= '0';
            wait for 20 ns;
            signal_in <= '1';
            wait;
        end process;

end Behavioral;