----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- Create Date: 2023/02/13 22:57:53
-- Design Name: Control
-- Module Name: Control - Behavioral
-- Project Name:  assignment_2
-- Target Devices: Basys 3
-- Tool Versions:   Vivado 2020.3
-- Description:     This is a behavioral model of a key debounce circuit.
--                 The circuit is designed to detect a key press and
--               prevent the key press from being registered multiple times.
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


entity Control is
    Port ( key_in : in STD_LOGIC;
           clk100 : in STD_LOGIC;
           key_out : out STD_LOGIC);
end Control;

architecture Behavioral of Control is 

signal pressbt : integer := 0;
signal shakecount : integer := 0; 
Begin
	process(key_in, clk100) 
	begin 
		if rising_edge (clk100) then
			if (key_in = '1') then 
				pressbt <= pressbt + 1; -- Invert if '1' 
				shakecount <= 0; -- Reset shakecount if input signal changes 
				if(pressbt = 2000) then -- Threshold for anti-shake delay
					key_out <= '1';
				end if; 
			else 
				pressbt <=0; 
				shakecount <= shakecount + 1; -- Increase shakecount if input signal is stable 
				if (shakecount = 1000) then -- Threshold for anti-shake delay 
					key_out <= '0'; 
				end if; 
			end if; 
		end if; 
	end process; 
end Behavioral;

