----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/03/30 23:41:19
-- Design Name: Graphics
-- Module Name: Graphics - Behavioral
-- Project Name: Basketball Video Game
-- Target Devices: Basys 3 Artix-7 FPGA Trainer Board
-- Tool Versions: Vivado 2018.3
-- Description:  This module is the top module of the graphics system. It is responsible for
--             combining the static display and the basketball display. 
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
entity Graphics is
Port ( 
           clk : in STD_LOGIC;
           X, Y : in UNSIGNED(10 downto 0);
           CX : in integer ; 
           CY : in integer;
           graRed : out STD_LOGIC_VECTOR (3 downto 0);
           graBlue : out STD_LOGIC_VECTOR (3 downto 0);
           graGreen : out STD_LOGIC_VECTOR (3 downto 0)
);
end Graphics;

architecture Behavioral of Graphics is
    signal clk_25MHz: STD_LOGIC :='0';
    signal hc,vc : unsigned(10 downto 0);
    SIGNAL  Static_display_MASK,Basketball_MASK: STD_LOGIC := '0';
    signal Static_display_RGB,Basketball_RGB: STD_LOGIC_VECTOR (11 downto 0);
    signal x_asix : integer;
    signal y_asix: integer;

begin
 Basketball : ENTITY work.Basketball(Behavioral)
        port map ( PIXEL_CK =>clk,
                   X => X,
                   Y => Y,
                   CX => CX,
                   CY => CY,   
                   RGB(11 downto 8) => Basketball_RGB(11 downto 8),
                   RGB(7 downto 4) => Basketball_RGB(7 downto 4),
                   RGB(3 downto 0) => Basketball_RGB(3 downto 0),
                   MASK => Basketball_MASK); 
  Static_display : ENTITY work.Static_display(Behavioral)
        port map ( X => X,
                   Y => Y,
                   RGB(11 downto 8) => Static_display_RGB(11 downto 8),
                   RGB(7 downto 4) => Static_display_RGB(7 downto 4),
                   RGB(3 downto 0) => Static_display_RGB(3 downto 0),
                   MASK => Static_display_MASK);

    graRed <= Basketball_RGB(11 downto 8) or Static_display_RGB(11 downto 8);
    graGreen <= Basketball_RGB(7 downto 4) or Static_display_RGB(7 downto 4);
    graBlue <= Basketball_RGB(3 downto 0) or Static_display_RGB(3 downto 0);

end Behavioral;
