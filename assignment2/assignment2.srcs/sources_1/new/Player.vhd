----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/03/25 21:23:23
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
use IEEE.NUMERIC_STD.ALL;

entity Player is
    port (
            X, Y : in  UNSIGNED (10 downto 0);
            RGB : out STD_LOGIC_VECTOR (11 downto 0);
            MASK : out STD_LOGIC;
            X_offset : in unsigned(3 downto 0));
end Player;

architecture Behavioral of Player is

signal TOP_FLAG,MIDDLE_FLAG,BOTTOM_FLAG : STD_LOGIC;
begin
    TOP_FLAG <='1' when (X >= 590-3*TO_INTEGER(X_offset)) and (X < 600-3*TO_INTEGER(X_offset))
                and(Y >= 370) and (Y < 410) else '0'; --flag goes high when arm is being drawn
    MIDDLE_FLAG <='1' when (X >= 607-3*TO_INTEGER(X_offset)) and (X < 617-3*TO_INTEGER(X_offset))
                and(Y >= 390) and (Y < 410) else '0'; --flag goes high when hand is being drawn           
    BOTTOM_FLAG <='1' when (X >=600-3*TO_INTEGER(X_offset) ) and (X < 620-3*TO_INTEGER(X_offset))
                and(Y >= 410) and (Y < 460) else '0'; --flag goes high when body is being drawn
    RGB <= "111111111111" when TOP_FLAG = '1' else
           "111100001111" when MIDDLE_FLAG = '1' else
           "000011110000" when BOTTOM_FLAG = '1' else
           (OTHERS => '0');
    MASK <= TOP_FLAG or BOTTOM_FLAG or MIDDLE_FLAG;

end Behavioral;

