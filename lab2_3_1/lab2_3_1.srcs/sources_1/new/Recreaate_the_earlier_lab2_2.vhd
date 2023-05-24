----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/02/02 15:51:22
-- Design Name: Recreate_the_earlier_lab2_2
-- Module Name: Recreate_the_earlier_lab2_2 - Behavioral
-- Project Name: lab2_3_1
-- Target Devices: Basys3 
-- Tool Versions: 2021.2
-- Description: 
--  none
-- Dependencies: 
-- 
-- Revision:1.0
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Recreate_the_earlier_lab2_2 is
    Port ( x : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC;
           m : out STD_LOGIC_VECTOR (1 downto 0)
           );
end Recreate_the_earlier_lab2_2;

architecture Behavioral of Recreate_the_earlier_lab2_2 is
component lab2_2_3 is
    Port ( x1 : in STD_LOGIC_VECTOR (1 downto 0);
           y1 : in STD_LOGIC_VECTOR (1 downto 0);
           s1 : in STD_LOGIC;
           m1 : out STD_LOGIC_VECTOR (1 downto 0)
           );
end component;

begin
    multiplexer : lab2_2_3 port map (x1 => x, y1 => y,s1 => s, m1 => m );

end Behavioral;
