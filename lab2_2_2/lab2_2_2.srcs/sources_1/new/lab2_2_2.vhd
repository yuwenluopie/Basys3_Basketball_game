----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- Create Date: 2023/02/02 23:40:42
-- Design Name: 
-- Module Name: lab2_2_2 - Behavioral
-- Project Name: Create a two-bit wide 2-to-1 multiplexer
-- Target Devices: Basys3 
-- Tool Versions: 2021.2
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:1.0 
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab2_2_2 is
    port(
    x : in std_logic_vector(1 downto 0);
    s : in std_logic_vector(1 downto 0);
    y : in std_logic_vector(1 downto 0);
    m : out std_logic_vector(1 downto 0)
);
end lab2_2_2;

architecture Behavioral of lab2_2_2 is

begin
 m <= (x and (not s)) or (s and y);

end Behavioral;
