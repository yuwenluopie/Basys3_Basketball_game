----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2020 16:40:40
-- Design Name: 
-- Module Name: Lab1_TopDesign - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab1_TopDesign is
--  Port ( );
Port( 
    led: out std_logic_vector (7 downto 0);
    sw: in std_logic_vector(7 downto 0)
    );
end Lab1_TopDesign;

architecture Behavioral of Lab1_TopDesign is
begin
    led(0) <= not sw(0);
    led(1) <= sw(1) and not sw(2);
    led(3) <= sw(2) and sw(3);
    led(2) <= sw(1) or sw(3);
    led(7 downto 4) <= sw(7 downto 4);
end Behavioral;
