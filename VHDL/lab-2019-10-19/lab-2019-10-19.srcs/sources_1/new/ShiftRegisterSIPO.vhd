----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 16.10.2019 14:21:47
-- Design Name:
-- Module Name: ShiftRegisterSIPO - Behavioral
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

entity ShiftRegisterSIPO is
 Generic(
    SR_WIDTH :integer:=4
 );
 Port(
  reset     :in std_logic;
  clk       :in std_logic;
  data_in   :in std_logic;
  data_out  :inout std_logic_vector(SR_WIDTH-1 DOWNTO 0)
 );
end ShiftRegisterSIPO;

architecture Behavioral of ShiftRegisterSIPO is
  component ff_d is
  	Port(
  		reset	: in std_logic;
  		clk		: in std_logic;
  		d 		:	in std_logic;
  		q 		: out std_logic
  	);
  end component;

begin
  instantiater : for I in 0 TO SR_WIDTH-1 generate  
    
  chain : if I /= 0 generate
    FF_D_inst: ff_d port map(
      reset => reset,
      clk => clk,
      d => data_out(I-1),
      q => data_out(I)
    );
    end generate;

 bottom : if I = 0 generate
    FF_D_inst: ff_d port map(
      reset => reset,
      clk => clk,
      d => data_in,
      q => data_out(I)
    );
    end generate;

  end generate;
end Behavioral;
