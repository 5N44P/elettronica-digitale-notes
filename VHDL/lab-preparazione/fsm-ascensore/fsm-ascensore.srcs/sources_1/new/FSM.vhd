----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2020 18:36:14
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
 Port ( 
    reset : in std_logic;
    clk : in std_logic;
    pulsante : in std_logic;
    
    
    luce : out std_logic
 );
end FSM;

architecture Behavioral of FSM is
    type tipo_stati is (ground, first);
    signal stato : tipo_stati := ground;
    signal stato_prossimo : tipo_stati := ground;

begin
    process(clk, reset)
    begin
        if reset = '1' then
            stato <= ground;
        elsif rising_edge(clk) then
            stato <= stato_prossimo;
        end if;
    end process;
    
    process(pulsante)
    begin
        case stato is
            when ground =>
            if pulsante = '0' then
                stato_prossimo <= ground;
            elsif pulsante = '1' then
                stato_prossimo <= first; 
            end if;
            
            when first =>
            if pulsante = '0' then
                stato_prossimo <= ground;
            elsif pulsante = '1' then
                stato_prossimo <= first;
            end if;
            when others =>
                stato_prossimo <= ground;
         end case;
     end process;
     
     process(stato)
     begin
--        if stato = ground then
--            luce <= '0';
--        elsif stato = first then 
--            luce <= '1';
--        end if;
        case stato is
            when ground =>
                luce <= '0';
            when first =>
                luce <= '1';
            when Others =>
                luce <= '0';
            end case;
     end process;
    


end Behavioral;
