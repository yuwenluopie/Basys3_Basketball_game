----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Luca Citi
-- 
-- Create Date:    09/01/2016
-- Design Name:    Assignment1
-- Module Name:    main0_dummy - Behavioral 
-- Description:    dummy design allowing students to familiarize with pinout
--                 and polarity of the Basys3 7-segment display designed
--                 for time-multiplexing
-- Dependencies:   none
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main0_dummy is
    Port (
        sw   : in  STD_LOGIC_VECTOR (15 downto 0);
        seg  : out STD_LOGIC_VECTOR (6 downto 0);
        dp   : out STD_LOGIC;
        an   : out STD_LOGIC_VECTOR (3 downto 0));
end main0_dummy;

architecture Behavioral of main0_dummy is

begin
    an <= sw(15 downto 12);
    seg <= sw(6 downto 0);
    dp <= sw(7);
end Behavioral;
