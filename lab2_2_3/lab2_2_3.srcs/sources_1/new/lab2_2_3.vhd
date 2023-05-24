----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/02/02 22:51:22
-- Design Name: lab2_2_3 - Behavioral
-- Module Name: lab2_2_3 - Behavioral
-- Project Name: Model a two-bit wide 2-to-1 multiplexer using dataflow modeling with net delays of 3 ns.
-- Target Devices: Basys3 
-- Tool Versions: 2021.2
-- Description: 
--  none
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab2_2_3 is
    Port ( x : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC;
           m : out STD_LOGIC_VECTOR (1 downto 0));
end lab2_2_3;

architecture Behavioral of lab2_2_3 is

begin
   m <= x WHEN s = '1' ELSE
         y WHEN s = '0' ELSE
         "00" after 3 ns;
         
end Behavioral;
