----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- Create Date: 2023/03/31 08:52:14
-- Design Name: 
-- Module Name: Feedback - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: this module is used to show the score of the player
--  shown in segment display

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
entity Feedback is
Port (     CX : in integer;
           CY : in integer;
            clk : in STD_LOGIC; -- 100MHz board clock
           seg  : out STD_LOGIC_VECTOR (6 downto 0);
           dp  : out STD_LOGIC;
           an   : out STD_LOGIC_VECTOR (3 downto 0)
);
end Feedback;

architecture Behavioral of Feedback is
    signal x_asix : integer;
    signal y_asix: integer;
    signal player_score : unsigned(7 downto 0);
begin
    Score : ENTITY work.score(Behavioral)
        port map( CX => x_asix,
                  CY => y_asix,   
                  score_sum => player_score);   

    four_digits_unit : entity work.four_digits(Behavioral)
    Port map (d3 => "0000",
              d2 => "0000",
              d1 => player_score(7 downto 4),
              d0 => player_score(3 downto 0),
              clk => clk, seg => seg, an => an, cur_digit =>dp);
      
end Behavioral;
