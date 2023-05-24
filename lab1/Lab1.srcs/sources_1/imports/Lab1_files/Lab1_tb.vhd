----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2020 10:10:42
-- Design Name: 
-- Module Name: TestBench_Lab1 - Behavioral
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
use ieee.std_logic_signed.all;

entity TestBench_Lab1 is
--  Port ( );
end TestBench_Lab1;

architecture Behavioral of TestBench_Lab1 is
Component Lab1_TopDesign
    Port(
        led: out std_logic_vector (7 downto 0);
        sw: in std_logic_vector(7 downto 0)
    );
end Component;

Signal output_led:  std_logic_vector(7 downto 0);
Signal switches: std_logic_vector(7 downto 0):="00000000";
Signal  e_led:  std_logic_vector(7 downto 0);

function expected_led(swt: std_logic_vector(7 downto 0)) 
return std_logic_vector is
Variable expected_led: std_logic_vector(7 downto 0);
begin
    expected_led(0) := not swt(0);
    expected_led(1) := swt(1) and not swt(2);
    expected_led(3) := swt(2) and swt(3);
    expected_led(2) := swt(1) or swt(3);
    expected_led(7 downto 4) := swt(7 downto 4);
    return expected_led(7 downto 0);
end function;


begin
    instant:Lab1_TopDesign port map(
        led=>output_led,
        sw=>switches
    );

    input_gen: process
    begin
         e_led <= expected_led(switches);
        for I in 0 to 122 loop
            wait for 50ns;
            switches <= switches + 2;
            wait for 10ns;
            e_led <= expected_led(switches); 
        end loop; 
    end process input_gen;

end Behavioral;
