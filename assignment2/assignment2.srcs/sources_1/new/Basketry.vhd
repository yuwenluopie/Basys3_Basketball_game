----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/03/25 21:23:23
-- Design Name: 
-- Module Name: basketry - Behavioral
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


entity basketry is
    port ( X, Y : in  UNSIGNED (10 downto 0);
           RGB : out STD_LOGIC_VECTOR (11 downto 0);
           MASK : out STD_LOGIC );
end basketry;

architecture Behavioral of basketry is

signal TOP_FLAG, MIDDLE_FLAG, BOTTOM_FLAG : STD_LOGIC;
begin
    TOP_FLAG <='1' when (X >= 8) and (X < 130)
                and(Y >= 220) and (Y < 230) else '0'; --flag goes high when the rectangle is being drawn 
    MIDDLE_FLAG <='1' when (X >= 13) and (X < 110)
                and(Y >= 230) and (Y < 265) else '0'; --flag goes high when the rectangle is being drawn 
    BOTTOM_FLAG <='1' when (X >= 20) and (X < 95)
                and(Y >= 265) and (Y < 300) else '0'; --flag goes high when the rectangle is being drawn 
    RGB <= "111100000000" when TOP_FLAG = '1' else
           "111111111111" when MIDDLE_FLAG = '1' or BOTTOM_FLAG = '1' else
           (OTHERS => '0');
    MASK <= TOP_FLAG or MIDDLE_FLAG or BOTTOM_FLAG;

 
end Behavioral;
