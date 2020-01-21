----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2019 09:07:17
-- Design Name: 
-- Module Name: MegaOperation - Behavioral
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

entity MegaOperation is
  Port ( 
    input_a : in std_logic_vector(31 DOWNTO 0);
    input_b : in std_logic_vector(31 DOWNTO 0);
    input_c : in std_logic_vector(31 DOWNTO 0);   
    
    reset : in std_logic;
    clk : in std_logic;
     
    result : out std_logic_vector(31 DOWNTO 0)
  );
end MegaOperation;

architecture Behavioral of MegaOperation is
type pipelinereg_t is array (0 to 2) of unsigned(31 DOWNTO 0);

    signal interleaving_reg : pipelinereg_t := (Others => (Others => 'U'));
    signal pipelinereg1 : pipelinereg_t := (Others => (Others => 'U'));
    signal pipelinereg2 : pipelinereg_t := (Others => (Others => 'U'));
    signal pipelinereg3 : pipelinereg_t := (Others => (Others => 'U'));
    signal pipelinereg4 : pipelinereg_t := (Others => (Others => 'U'));
    signal pipelinereg5 : pipelinereg_t := (Others => (Others => 'U'));
    signal adder_in : unsigned(31 DOWNTO 0) := (Others => 'U');
    signal interleaving_select : std_logic := '0';
    
    
 component adder is 
	Port (
	input_a			: in unsigned(31 DOWNTO 0);
	input_b			: in unsigned(31 DOWNTO 0);
	result			: out unsigned(31 DOWNTO 0)
	);
  end component;
  
  component multiplier is
	Port (
	input_a			: in unsigned(31 DOWNTO 0);
	input_b			: in unsigned(31 DOWNTO 0);
	result			: out unsigned(31 DOWNTO 0)
	);
  end component;
  
  
  
begin
    adder1_inst : adder port map (
        input_a => adder_in,
        input_b => pipelinereg2(2),
        result => pipelinereg5(0)
    );
    
    multiplier1_inst : multiplier port map (
        input_a => pipelinereg3(0),
        input_b => pipelinereg3(1),
        result => pipelinereg1(0)
    );
    
    multiplier2_inst : multiplier port map (
        input_a => pipelinereg4(0),
        input_b => pipelinereg4(1),
        result => pipelinereg1(1)
    );
        
        
    process (clk)
    begin
    if rising_edge(clk) then
        interleaving_select <= not interleaving_select;
        
        case interleaving_select is
            when '0' => 
            adder_in <= pipelinereg1(0);
            pipelinereg3(0) <= unsigned(input_a);
            pipelinereg3(1) <= unsigned(input_b);
            when '1' =>
            adder_in <= pipelinereg1(1);
            pipelinereg4(0) <= unsigned(input_a);
            pipelinereg4(1) <= unsigned(input_b);
            when others =>
            pipelinereg3(0) <= unsigned(input_a);
            pipelinereg3(1) <= unsigned(input_b);
        end case;
        
        pipelinereg2(2) <= pipelinereg2(1);
        pipelinereg2(1) <= pipelinereg2(0);
        pipelinereg2(0) <= unsigned(input_c);
        result <= std_logic_vector(pipelinereg5(0));
    end if;
        
    end process;

end Behavioral;
