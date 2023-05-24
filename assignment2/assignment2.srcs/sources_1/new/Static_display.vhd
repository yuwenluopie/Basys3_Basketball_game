----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/03/17 15:51:45
-- Design Name: 
-- Module Name: Basketball - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description:    this display the basketery and the player
-- 
-- Dependencies:    none
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Static_display is
    Port (
        X     : in  UNSIGNED (10 downto 0);
        Y     : in  UNSIGNED (10 downto 0);
        RGB   : out STD_LOGIC_VECTOR (11 downto 0);
        MASK  : out STD_LOGIC
    );
end Static_display;

architecture Behavioral of Static_display is
    signal T_X,B_X,T_Y,B_Y :UNSIGNED (10 downto 0);
    signal T_MASK, B_MASK :STD_LOGIC;
    signal T_RGB, B_RGB: STD_LOGIC_VECTOR(11 downto 0);
     signal X_offset : unsigned(3 downto 0);
begin
    Player :ENTITY work.Player(Behavioral) 
        port map (
            X => X,
            Y => Y,
            RGB => B_RGB,
            MASK => B_MASK,
            X_offset=>X_offset
        );

    basketry : ENTITY work.basketry(Behavioral) 
        port map (
            X => X,
            Y => Y,
            RGB => T_RGB,
            MASK => T_MASK
        );
    RGB <= T_RGB or B_RGB;
    MASK <= T_MASK or B_MASK;

end Behavioral;

