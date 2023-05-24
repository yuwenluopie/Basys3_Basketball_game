----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/02/05 10:32:42
-- Design Name: reate_2bit_2to1multiplexer_using_behavioral_modeling
-- Module Name: create_2bit_2to1multiplexer_using_behavioral_modeling - Behavioral
-- Project Name: lab2_4_1
-- Target Devices: Basys3 
-- Tool Versions: 2021.2
-- Description: 
--  none
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

entity create_2bit_2to1multiplexer_using_behavioral_modeling is
Port ( 
            x : in STD_LOGIC;
           --x1 : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC;
           --y1 : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC;
           m : out STD_LOGIC 
           --m1 : out STD_LOGIC_VECTOR (1 downto 0)
           );
end create_2bit_2to1multiplexer_using_behavioral_modeling;

architecture Behavioral of create_2bit_2to1multiplexer_using_behavioral_modeling is

begin

    process (x,y,s) begin 
        if (s='0') then
            m<=y;
         else
            m<=x;
         end if;
    end process;
end Behavioral;
