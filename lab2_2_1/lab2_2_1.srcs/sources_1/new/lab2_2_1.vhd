----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/02/01 22:51:22
-- Design Name: 
-- Module Name: lab2_2_1 - Behavioral
-- Project Name: lab2 Create a 2-to-1 multiplexer
-- Target Devices: Basys3 
-- Tool Versions: 2021.2
-- Description: 
--  none
-- Dependencies: 
-- 
-- Revision: 1.4
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity lab2_2_1 is
port ( x : in std_logic;
    s : in std_logic;
    y : in std_logic;
    m : out std_logic
);
end lab2_2_1;

architecture Behavioral of lab2_2_1 is

begin
     m <= (x and (not s)) or (s and y);
end Behavioral;
