----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 09.10.2019 14:43:02
-- Design Name:
-- Module Name: nibble_adder - Behavioral
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

entity nibble_adder is
  Port(

		a	: in std_logic_vector(3 DOWNTO 0);
		b	: in std_logic_vector(3 DOWNTO 0);

		sum	: out std_logic_vector(3 DOWNTO 0)
	);
end nibble_adder;

architecture Behavioral of nibble_adder is

  signal carry_propagation1 : std_logic;
  signal carry_propagation2 : std_logic;
  signal carry_propagation3 : std_logic;

  component full_adder is
    Port (
       a_fa      : in    std_logic; -- input standard logic del IEEE
       b_fa      : in    std_logic;
       c_in_fa   : in    std_logic;
       sum_fa    : out   std_logic;
       c_out_fa  : out   std_logic --non si mette punto e virgola nell'ultimo pin
     );
  end component;

begin
  fa_inst1: full_adder
    port map(
      a_fa => a(0),
      b_fa => b(0),
      c_in_fa => '0',
      sum_fa => sum(0),
      c_out_fa => carry_propagation1

    );
  fa_inst2: full_adder
    port map(
      a_fa => a(1),
      b_fa => b(1),
      c_in_fa =>  carry_propagation1,
      sum_fa => sum(1),
      c_out_fa => carry_propagation2

    );
  fa_inst3: full_adder
    port map(
      a_fa => a(2),
      b_fa => b(2),
      c_in_fa => carry_propagation2,
      sum_fa => sum(2),
      c_out_fa => carry_propagation3

    );
  fa_inst4: full_adder
    port map(
      a_fa => a(3),
      b_fa => b(3),
      c_in_fa => carry_propagation3,
      sum_fa => sum(3),
      c_out_fa => open

    );

end Behavioral;
