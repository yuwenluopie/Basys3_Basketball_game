----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/03/20 12:44:32
-- Design Name: assignment2
-- Module Name: Physics - Behavioral
-- Project Name: 
-- Target Devices: basys3 board 
-- Tool Versions: 
-- Description: this is the physics module
-- simulation the gravity and collision effect of the ball

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

entity Physics is
    port( clk: in std_logic;
          CX : out integer;
          CY : out integer;
          VS : in std_logic;
          Reset : in STD_LOGIC;
          vx: in unsigned(3 downto 0);
          vy: in unsigned(3 downto 0);
          X_offset : in unsigned(3 downto 0)

          );
end Physics;

architecture Behavioral of Physics is

    signal xAxis : integer := 570 - 3 * to_integer(X_offset);
    signal yAxis : integer := 370;
    -- xAxis and yAxis are the initial position of the ball including the offset
    
    signal x_Asix: integer := xAxis;
    signal y_Asix : integer := yAxis;
    -- x_Asix and y_Asix are the current position of the ball

    signal G : integer := 2;
    -- G is the gravity constant to simulate the gravity effect

    type STATE is (debug, play);
    signal CUR_STATE, NX_STATE: STATE;
    signal start: std_logic := '1';
    signal vHorizontal : integer :=  3 * to_integer(vx);
    signal vVertical : integer := 3 * to_integer(vy);
    signal sw : unsigned(7 downto 0):= (others =>'0');
    -- refence github.com/alexforencich/verilog-axi/blob/master/axi_pkg.vhd
   
    constant collision : integer := 2;
     -- collision is the constant to simulate the collision effect
     
begin
    
    state_registers : process (reset, clk)
    begin
        if start = '1' then
            start <= '0';
            CUR_STATE <= play;
        elsif rising_edge(clk) then
            CUR_STATE <= NX_STATE;
        end if;
    end process;
    state_transition : process (CUR_STATE, clk)
    begin
        case CUR_STATE is
            when debug =>
            if rising_edge(clk) then
                if (Reset = '1') then
                    NX_STATE <= play;
                else
                    NX_STATE <= debug;
                end if;
            end if;
            when play =>
            if rising_edge(clk) then
                if (Reset = '1') then
                    NX_STATE <= debug;
                else
                    NX_STATE <= play;
                end if;
            end if;
        end case;
    end process;
    move_process : process(VS)
    --this is Collision detection
    --the ball will bounce back when it hits the wall
    -- we can change the consta of vHorizontal and vVertical to change the speed of the ball
    begin
        if (CUR_STATE = play) then
            if (falling_edge(VS)) then
                if (x_Asix >= 8 and y_Asix <= 457) then
                    x_Asix <= x_Asix - vHorizontal;
                    y_Asix <= y_Asix - vVertical;
                    vVertical <= vVertical - G;
                    -- if the ball hits the left wall
                else 
                    if ( y_Asix > 457 ) then
                      vHorizontal <= (vHorizontal/collision);
                      vVertical <= -(vVertical)/collision/2;
                      y_Asix <= 457;
                      -- if the ball hits the bottom wall
                     end if;
                    if (x_Asix <8) then
                        vHorizontal <= (vHorizontal/collision);
                        vVertical <= -(vVertical)/collision/2;
                        x_Asix <= 8;
                     -- if the ball hits the top wall
                   end if;
                end if;
            end if;
        elsif (CUR_STATE = debug) then
            vHorizontal <= 3 * to_integer(vx);
            vVertical <=3 * to_integer(vy);
            x_Asix <= xAxis;
            y_Asix <= yAxis;
       end if;            
    end process;
    CX <= x_Asix;
    CY <= y_Asix;    

end Behavioral;

