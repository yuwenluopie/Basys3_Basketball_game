----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/03/17 15:51:45
-- Design Name: 
-- Module Name: 
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
    generic(
            modulo : NATURAL := 4);
    Port ( 
            clk100 : in STD_LOGIC; -- The clock input from the board 
            clk25 : out STD_LOGIC);--The pixel clock ( the output of frequency divider )
end Clock_Divider;

architecture Behavioral of Clock_Divider is

signal tmp : STD_LOGIC ;

begin

    process 
        variable count : INTEGER; 
    begin 
        wait until RISING_EDGE(clk100);
            --Once the count has been reached the counter will reset and a ouptut high logic
        if count = (modulo - 1) then 
            count := 0;
            tmp <= '1'; 
        else
            count := count + 1;-- increment counter 
            tmp <= '0';--output low logic 
        end if;
        
    end process ;
 
    clk25 <= tmp;

end Behavioral;
