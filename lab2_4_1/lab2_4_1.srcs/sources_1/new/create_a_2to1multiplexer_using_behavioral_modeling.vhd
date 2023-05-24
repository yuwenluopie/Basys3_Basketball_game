----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/02/02 15:51:22
-- Design Name: create_a_2to1multiplexer_using_behavioral_modeling
-- Module Name: create_a_2to1multiplexer_using_behavioral_modeling - Behavioral
-- Project Name: lab2_4_1
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


entity create_a_2to1multiplexer_using_behavioral_modeling is
Port ( x : in STD_LOGIC_VECTOR (1 downto 0);
           --x1 : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           --y1 : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC;
           m : out STD_LOGIC_VECTOR (1 downto 0)
           --m1 : out STD_LOGIC_VECTOR (1 downto 0)
           );
end create_a_2to1multiplexer_using_behavioral_modeling;

architecture Behavioral of create_a_2to1multiplexer_using_behavioral_modeling is

begin
    process (x,y,s) begin 
        if (s='0') then
            m<=y;
         else
            m<=x;
         end if;
    end process;
       
end Behavioral;
