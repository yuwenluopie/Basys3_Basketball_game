----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/02/07 15:51:22
-- Design Name: right_most_7segment_display 
-- Module Name: right_most_7segment_display - Behavioral
-- Project Name: lab3_1_1
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


entity right_most_7segment_display is
Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
       an : out STD_LOGIC_VECTOR (3 downto 0);
       seg : out STD_LOGIC_VECTOR (6 downto 0)
       );
end right_most_7segment_display;

architecture Behavioral of right_most_7segment_display is

begin
 an <= "1110";
    WITH x SELECT
       seg <= "1000000" WHEN "0000",
              "1111001" WHEN "0001",
              "0100100" WHEN "0010",
              "0110000" WHEN "0011",
              "0011001" WHEN "0100",
              "0010010" WHEN "0101",
              "0000010" WHEN "0110",
              "1111000" WHEN "0111",
              "0000000" WHEN "1000",
              "0010000" WHEN "1001",
              "1111111" WHEN OTHERS;

end Behavioral;
