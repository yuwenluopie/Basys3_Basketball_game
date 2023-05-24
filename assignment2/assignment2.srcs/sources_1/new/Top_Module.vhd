----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- Create Date: 2023/03/16 17:06:15
-- Design Name:  Assignment 2
-- Module Name: Top_Module - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description:  Top level module
--  This module is the top level module of the project. It is responsible for
--  connecting all the submodules together.
-- Dependencies:    Clock_Divider
--                  Control
--                  vga_controller_640_60
--                  Physics
--                  Graphics
--                  Feedback

-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Top_Module is
    Port ( clk : in STD_LOGIC;
         --Vsync : out STD_LOGIC;
           vgaRed : out STD_LOGIC_VECTOR (3 downto 0);
           vgaBlue : out STD_LOGIC_VECTOR (3 downto 0);
           vgaGreen : out STD_LOGIC_VECTOR (3 downto 0);
           sw : in unsigned(15 downto 4);
           seg  : out STD_LOGIC_VECTOR (6 downto 0);
           --dp  : out STD_LOGIC;
           an   : out STD_LOGIC_VECTOR (3 downto 0);
           btnC : in STD_LOGIC);

end Top_Module;

architecture Behavioral of Top_Module is

    signal hcount,vcount : unsigned(10 downto 0);
    SIGNAL Graphics_MASK,clk_25MHz: STD_LOGIC := '0';
    signal Hsync,Vsync,key_out_C, dp ,blank :STD_LOGIC;
    signal Horizontal_speed, Vertical_speed : STD_LOGIC_VECTOR (3 downto 0);
    signal CX,CY : integer;
    
begin
    clock_divider: ENTITY work.Clock_Divider(Behavioral) GENERIC MAP(modulo =>4)
       port map ( clk100 => clk,
                  clk25 =>clk_25MHz);
    Control: entity work.Control (Behavioral)
        port map( key_in => btnC,
                  clk100 => clk,
                  key_out => key_out_C);
    VGA_Controller : ENTITY work.vga_controller_640_60(Behavioral)
        port map ( rst         => '0',
                   clk25   => clk_25MHz,
                   HS          => Hsync,
                   VS          => Vsync,
                   hcount      => hcount,
                   vcount      => vcount,
                   blank       => blank);  
    Physics : ENTITY work.Physics(Behavioral)
        port map( Reset => key_out_C,
                  clk => clk,
                  CX => CX,
                  CY => CY,   
                  VS => Vsync,
                  vx=> sw(15 downto 12),
                  vy => sw(11 downto 8),
                  X_offset => sw(7 downto 4));   
   Graphics: ENTITY work.Graphics(Behavioral)
        port map (  clk => clk_25MHz,
                    X => hcount,
                    Y => vcount,
                    CX => CX,
                    CY => CY,
                   graRED =>  vgaRed,
                   graBlue => vgaBlue,
                   graGreen => vgaGreen );
   Feedback: ENTITY work.Feedback (Behavioral)
    port map(
        CX => CX,
        CY => CY,   
        clk => clk, 
        seg => seg, 
        an => an, 
        dp =>dp
    );

end Behavioral;
