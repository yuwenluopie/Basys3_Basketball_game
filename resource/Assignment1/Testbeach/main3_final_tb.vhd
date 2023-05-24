----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.01.2021 10:24:17
-- Design Name: 
-- Module Name: main3_final_tb - Behavioral
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

library UNISIM;
use UNISIM.VComponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main3_final_tb is
--  Port ( );
end main3_final_tb;

architecture Behavioral of main3_final_tb is

Component main3_final
	port (
       sw : in UNSIGNED (15 downto 0);
       clk  : in  STD_LOGIC;
       btnU, btnD,  btnC  : in  STD_LOGIC;--btnL, btnR,
       seg  : out STD_LOGIC_VECTOR (6 downto 0);
       dp  : out STD_LOGIC;
       an   : out STD_LOGIC_VECTOR (3 downto 0));	
	End Component;

signal clk_in : std_logic := '0';
signal sw_in : UNSIGNED (15 downto 0) := (others => '0');
signal btnU_in, btnD_in, btnL_in, btnR_in, btnC_in  : STD_LOGIC := '0';
signal seg_out : STD_LOGIC_VECTOR(6 downto 0); 
signal dp_out : STD_LOGIC;
signal an_out : STD_LOGIC_VECTOR(3 downto 0);
signal Seg_output : integer;

constant clk_period : time := 10 ns;

  function Seg_2_Dec (
    Seg : in std_logic_vector(6 downto 0))
    return integer is
    variable v_TEMP : integer;
  begin
    if (Seg = "1000000") then
      v_TEMP := 0;
    elsif (Seg = "1111001" ) then
      v_TEMP := 1;
    elsif (Seg = "0100100" ) then
      v_TEMP := 2;
    elsif (Seg = "0110000" ) then
      v_TEMP := 3;
    elsif (Seg = "0011001" ) then
      v_TEMP := 4;
    elsif (Seg = "0010010" ) then
      v_TEMP := 5;
    elsif (Seg = "0000010" ) then
      v_TEMP := 6;
    elsif (Seg = "1111000" ) then
      v_TEMP := 7;
    elsif (Seg = "0000000" ) then
      v_TEMP := 8;
    elsif (Seg = "0010000" ) then
      v_TEMP := 9;
    elsif (Seg = "0000110" ) then
      v_TEMP := 99;
    end if;
    return (v_TEMP);
  end;


begin

uut: main3_final PORT MAP (
        sw => sw_in,
        clk => clk_in,
        btnU => btnU_in,
        btnD => btnD_in,
       -- btnL => btnL_in,
      --  btnR => btnR_in,
        btnC => btnC_in,
        seg => seg_out,
        dp => dp_out,
        an => an_out
       );
 Seg_output <= Seg_2_Dec(seg_out);     

clk_process :process
    begin
        clk_in <= '0';
        wait for clk_period/2;
        clk_in <= '1';
        wait for clk_period/2;
    end process;

--modify your testing process as needed to validate the results.

	
stim_proc: process
    begin
    wait for 300ns;
     
    btnC_in <= '1'; 
    wait for 100ns;   
    btnC_in <= '0';
    

    wait for 300ns;
     
    btnC_in <= '1'; 
    wait for 100ns;   
    btnC_in <= '0';



    wait for 170ns; 
    btnU_in <= '1'; 
    wait for 300ns;   
    btnU_in <= '0'; 
     
    wait for 300ns;  
    btnU_in <= '1'; 
    wait for 30ns;   
    btnU_in <= '0';
    
    
    wait for 300ns; 
    btnC_in <= '1'; 
    wait for 300ns;   
    btnC_in <= '0';
    
    wait for 1000ns; 
    btnC_in <= '1'; 
    wait for 300ns;   
    btnC_in <= '0';
    
    wait for 170ns; 
    btnU_in <= '1'; 
    wait for 300ns;   
    btnU_in <= '0'; 
     
    wait for 300ns;  
    btnU_in <= '1'; 
    wait for 30ns;   
    btnU_in <= '0';
    
    wait for 1000ns; 
    btnC_in <= '1'; 
    wait for 300ns;   
    btnC_in <= '0';
    
       
    wait;
    end process;
    
    
    
end Behavioral;
