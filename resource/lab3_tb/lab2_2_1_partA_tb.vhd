--------------------------------------------
-- Module Name: lab2_2_1_partA_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity lab2_2_1_partA_tb Is
end lab2_2_1_partA_tb;

Architecture behavior of lab2_2_1_partA_tb Is
	Component lab2_2_1_partA
	port (
		v 		: in STD_LOGIC_VECTOR (3 downto 0);
		z 		: out STD_LOGIC;
		m_out 	: out STD_LOGIC_VECTOR (3 downto 0)
	);	
	End Component;
	
	Signal count       : STD_LOGIC_VECTOR (3 downto 0) := "0000";
	Signal m_out       : STD_LOGIC_VECTOR (3 downto 0) := "0000";
	Signal v_int 	   : STD_LOGIC_VECTOR (3 downto 0) := "0000";
	Signal z_int 	   : STD_LOGIC := '0';

begin
	DUT:  lab2_2_1_partA PORT MAP (
			v => v_int,
			z => z_int,
			m_out => m_out
		 );
	    		 
	process
		    
		variable k : integer := 0;

	begin
		
        for k in 0 to 16 loop       
	  

		  wait for 10 ns;
		  v_int <= count;

		  count <= count + 1;		  
        end loop;		 
		
		wait;
	end process;
end behavior;