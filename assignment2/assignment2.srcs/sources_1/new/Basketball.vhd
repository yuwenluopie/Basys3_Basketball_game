----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/03/17 15:51:45
-- Design Name: 
-- Module Name: Basketball - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: this is the top level module of the basketball 
-- inculde the trajectory of the circle use index to store the Y coordinate of the circle
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
entity Basketball is
    generic ( 
              R : natural := 20; -- radius of a circle
              COLOUR : std_logic_vector(11 downto 0):= "111100110000" ); -- color of a circle
     port ( PIXEL_CK : in std_logic; -- oixel clock : 25MHz
            X, Y : in  UNSIGNED (10 downto 0); -- X,Y coordinates of the current circle
            RGB : out STD_LOGIC_VECTOR (11 downto 0); -- Color bits of circle
            MASK : out STD_LOGIC; -- Display mask of circle
            CX : in integer ; -- X-axis coordinate of center of circle
            CY : in integer); -- Y-axis coordinate of center of circle
           
end Basketball;

architecture Behavioral of Basketball is
    constant    matrix_num:      integer := 600; 
    TYPE        matrix_index is array (matrix_num downto 0) of integer;
    --store the Y coordinate of the circle and draw the trajectory of the circle
    signal      Y_G:    matrix_index;
    signal DX, DY : unsigned (X'range); -- DX = |(X-CX)|; DY = |(Y -CY)|
    signal DX2, -- (X-CX)^2
           DY2 : unsigned ((2*X'high+1) downto 0); -- (Y -CY)^2
    signal FLAG : std_logic; -- Determine when to display a circle.
    constant R2 : unsigned(DX2'range):= to_unsigned(R * R, DX2'length); -- R^2
begin
--    G_clear:process(Clear)
--    variable i: integer := 0;
--    begin
--        if rising_edge(Clear) then
--            i := 0;
--            while(i<=matrix_num) loop 
--                Y_G(i) <= 0;
--                i := i+1;
--            end loop;
--        end if;
--    end process;
    process
    begin
        wait until rising_edge(PIXEL_CK);
        Y_G(CX)<=CY;
        if X <= CX - R or X >= CX + R then
            DX2 <= R2;
        else
            DX2 <= DX2 + (X * 2) - (CX * 2) - 1;
        end if;
        if X = 0 then
            if (Y <= CY - R) or (Y >= CY + R) then
                DY2 <= R2;
            else
                DY2 <= DY2 + (Y * 2) - (CY * 2) - 1;
            end if;
        end if;
        FLAG<='0';
        if Y_G(TO_INTEGER(X)) = TO_INTEGER(Y) or (DX2 + DY2 < R2) then
            FLAG<='1';
        end if;    
    end process;
    RGB <= COLOUR when FLAG = '1'else (OTHERS => '0');
    MASK <= FLAG;
end Behavioral;
