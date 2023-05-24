---------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/02/11 21:49:18
-- Design Name: action 
-- Module Name: button_active - Behavioral
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

entity button_active is
    Port ( action_in : in STD_LOGIC;
           clk_in : in STD_LOGIC;
           action_out : out STD_LOGIC);
end button_active;

architecture Behavioral of button_active is
SIGNAL count1 : INTEGER   :=   0;
begin

process(action_in, clk_in)

begin
    if rising_edge (clk_in) then    
            if (action_in = '1') then
                count1 <= count1 + 1; -- Invert if '1'
                    if(count1 = 4000) then
                        action_out <= '1';
                    else
                        action_out <= '0';
                    end if;
            else
                count1 <=0;
            end if;
        end if;
    end process;
end Behavioral;
