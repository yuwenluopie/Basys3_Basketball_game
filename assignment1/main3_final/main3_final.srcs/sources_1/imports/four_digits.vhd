---------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/02/11 21:49:18
-- Design Name: main3_final
-- Module Name: four digits - Behavioral
-- Project Name: Assignment1
-- Target Devices: Basys3 
-- Tool Versions: 2021.2
-- Description: 
--The current_digit signal is updated based on the value of the digit_counter signal, 
--and the an signal is updated to enable the corresponding digit on the display. 
--The cur_digit signal is set to '1' to activate the currently selected digit on the display.

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
            d3 : in UNSIGNED (3 downto 0);
            d2 : in UNSIGNED (3 downto 0);
            d1 : in UNSIGNED (3 downto 0);
            d0 : in UNSIGNED (3 downto 0);
            --ck : in STD_LOGIC; -- centre action statement <SET button> 
            seg : out STD_LOGIC_VECTOR (6 downto 0);
            an : out STD_LOGIC_VECTOR (3 downto 0);
            cur_digit :out std_logic
           );
end four_digits;

architecture Behavioral of four_digits is

Signal digit_counter : Unsigned(1 downto 0); 
Signal current_digit : UNSIGNED (3 downto 0);
--Signal count : Integer;
Signal action_output : STD_LOGIC:='0';

begin
    one_digit_unit : ENTITY work.one_digit(Behavioral)
        port map (digit => current_digit,
                    seg => seg);
     ck_5mhz : ENTITY work.Clock_Divider(Behavioral) GENERIC MAP(count_end => 250000)
        port map ( clk_in => clk,
                   clk_out =>action_output);
     process(action_output)
     begin
         if rising_edge(action_output) then
          digit_counter <= digit_counter +1;
         end if;
     end process;
--Process (ck)
--Begin    
--    If Rising_edge (clk) Then
--        Case ck is --Eliminate jitter
--            When '1' => -- SET button is pressed
--                Count <= Count + 1;
--                    If(Count = 2000) Then 
--                    ----If the user press SET buttons exceeds 0.2s,
--                        action_output <= '1';
--                        -- It is considered that the 'Set' button is pressed and the user's behavior
--                        digit_counter <= digit_counter + 1;
--                        Count <= 0;
--                        -- refresh Count
--                    Else
--                        action_output <= '0';
--                        -- It is not considered that the 'Set' button is pressed and the user's behavior
--                    End If;
--            When Others =>
--                Count <= 0;-- refresh Count
--End Case;
--End If;
process 
    begin
    Case digit_counter is --Display in which segment
        When "00" => cur_digit<= '1'; current_digit <= d0; an <= "1110"; --4th segment
        When "01" =>  cur_digit<= '1';current_digit <= d1; an <= "1101"; --3rd segment
        When "10" =>  cur_digit<= '0';current_digit <= d2; an <= "1011"; --2nd segment
        When "11" =>  cur_digit<= '1';current_digit <= d3; an <= "0111"; --1st segment
    End Case;
End Process;

end Behavioral;
