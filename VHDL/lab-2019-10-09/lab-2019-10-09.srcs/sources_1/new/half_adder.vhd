----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 09.10.2019 14:11:14
-- Design Name:
-- Module Name: half_adder - Behavioral
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

entity half_adder is
  Port (
     a   : in    std_logic; -- input standard logic del IEEE
     b   : in    std_logic;
     sum   : out   std_logic;
     c_out   : out   std_logic --non si mette punto e virgola nell'ultimo pin
   );
end half_adder;

architecture Behavioral of half_adder is

begin
    sum   <=  a xor b;
    c_out   <=  a and b;


end Behavioral;
