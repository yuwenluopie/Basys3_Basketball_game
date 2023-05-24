---------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/02/11 21:49:18
-- Design Name: main2_four digits
-- Module Name: four digits - Behavioral
-- Project Name: Assignment1
-- Target Devices: Basys3 
-- Tool Versions: 2021.2
-- Description: 
-- manually-multiplexed 4-digit 7-segment decoder: the user should be able to use the sixteen
-- switches, SW15-SW0, to input four BCD (0-9) digits that are then displayed, in turn, on
-- each one of the four digits of the Basys3 display; the user manually simulates the multiplexing
-- clock by pressing the central button

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

entity four_digits is
    Port (  
            clk : in STD_LOGIC;
        --clock is used as a control signal for a process block. 
        --The process block will be triggered only on the rising edge of the clk signal.
            d3 : in STD_LOGIC_VECTOR (3 downto 0);
            d2 : in STD_LOGIC_VECTOR (3 downto 0);
            d1 : in STD_LOGIC_VECTOR (3 downto 0);
            d0 : in STD_LOGIC_VECTOR (3 downto 0);
            ck : in STD_LOGIC; -- centre key statement <SET button> 
            seg : out STD_LOGIC_VECTOR (6 downto 0);
            an : out STD_LOGIC_VECTOR (3 downto 0)
           );
end four_digits;

architecture Behavioral of four_digits is

Signal digit_counter : Unsigned(1 downto 0); 
Signal current_digit : STD_LOGIC_VECTOR (3 downto 0);
Signal count : Integer;
Signal key_output : STD_LOGIC;

begin
    one_digit_unit : ENTITY work.one_digit(Behavioral)
        port map (digit => current_digit,
                    seg => seg);
Process (ck)
Begin    
    If Rising_edge (clk) Then
        Case ck is --Eliminate jitter
            When '1' => -- SET button is pressed
                Count <= Count + 1;
                    If(Count = 2000) Then 
                    ----If the user press SET buttons exceeds 0.2s,
                        key_output <= '1';
                        -- It is considered that the 'Set' button is pressed and the user's behavior
                        digit_counter <= digit_counter + 1;
                        Count <= 0;
                        -- refresh Count
                    Else
                        key_output <= '0';
                        -- It is not considered that the 'Set' button is pressed and the user's behavior
                    End If;
            When Others =>
                Count <= 0;-- refresh Count
End Case;
End If;
    Case digit_counter is --Display in which segment
        When "00" => current_digit <= d0; an <= "1110"; --4th segment
        When "01" => current_digit <= d1; an <= "1101"; --3rd segment
        When "10" => current_digit <= d2; an <= "1011"; --2nd segment
        When "11" => current_digit <= d3; an <= "0111"; --1st segment
    End Case;
End Process;

end Behavioral;
