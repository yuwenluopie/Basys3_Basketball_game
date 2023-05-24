---------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/02/11 21:49:18
-- Design Name: main1_one_digit
-- Module Name: one_digit - Behavioral
-- Project Name: Assignment1
-- Target Devices: Basys3 
-- Tool Versions: 2021.2
-- Description: 
-- 7-segment decoder: the user should be able to use the rightmost four switches, SW3-SW0, to
-- input a BCD (0-9) digit that is then displayed (duplicated) on all four digits of the Basys3
-- display;

-- Dependencies: 
-- 
-- Revision: 1.0
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity one_digit is
    Port ( digit : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end one_digit;

architecture Behavioral of one_digit is
    begin
        seg <= "1000000" when digit = "0000" else
               "1111001" when digit = "0001" else
               "0100100" when digit = "0010" else
               "0110000" when digit = "0011" else
               "0011001" when digit = "0100" else
               "0010010" when digit = "0101" else
               "0000010" when digit = "0110" else
               "1111000" when digit = "0111" else
               "0000000" when digit = "1000" else
               "0010000" when digit = "1001" else
               "1111111";
    end Behavioral;
