----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/03/30 15:28:46
-- Design Name: 
-- Module Name: score - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity score is
    Port ( CX : in integer;
           CY : in integer;
           score_sum : out unsigned (7 downto 0));
end score;

architecture Behavioral of score is
    signal score : unsigned(5 downto 0) := (others =>'0');
    signal sw : unsigned(7 downto 0):= (others =>'0');
begin
    score_display: process(score)
    variable sw_s : unsigned (5 downto 0);
    begin
        if ( score >="000000" and score <="001001") then
            sw(7 downto 4) <= "0000";
            sw(3 downto 0) <= score(3 downto 0); 
        elsif (  score <= "010011") then --19
            sw(7 downto 4) <= "0001";
            sw_s := (score - "001010");
            sw(3 downto 0) <= sw_s(3 downto 0); 
        elsif (  score <= "011101") then  --29
            sw(7 downto 4) <= "0010";
            sw_s := (score - "010100");
            sw(3 downto 0) <= sw_s(3 downto 0);    
        elsif (  score <= "100111") then --39
            sw(7 downto 4) <= "0011";
            sw_s := (score - "011110");
            sw(3 downto 0) <= sw_s(3 downto 0);   
        elsif (  score <= "110001") then --49
            sw(7 downto 4) <= "0100";
            sw_s := (score - "101000");
            sw(3 downto 0) <= sw_s(3 downto 0);  
        elsif (  score <= "111011") then --59
            sw(7 downto 4) <= "0101";
            sw_s := (score - "110010");
            sw(3 downto 0) <= sw_s(3 downto 0);  
        end if;
    end process;
    
    move_process : process(CX)
    begin
        if ((CY <= 230) and (CY >=190) and (CX <=112) and (CX >= 8)) then
            score <= score + 1;
        end if;
    end process;
    
    score_sum <= sw;

end Behavioral;
