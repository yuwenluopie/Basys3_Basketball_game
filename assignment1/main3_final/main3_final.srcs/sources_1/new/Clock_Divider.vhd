---------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/02/13 22:37:27
-- Design Name: 
-- Module Name: Clock_Divider - Behavioral
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

entity Clock_Divider is
    GENERIC (count_end : NATURAL);
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end Clock_Divider;

architecture Behavioral of Clock_Divider is

SIGNAL count : INTEGER   :=   0;
SIGNAL action_output   : STD_LOGIC := '0';

begin

 process(clk_in)
    begin
        if RISING_EDGE(clk_in) then 
            count <= count + 1;     
            if (count = count_end) then  
                action_output <= NOT action_output;
                count <= 0;  -- And set count back to 0
            end if;
        end if;
       end process;
       clk_out <= action_output; 

end Behavioral;
