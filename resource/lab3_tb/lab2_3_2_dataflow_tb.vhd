--------------------------------------------
-- Module Name: lab2_3_2_dataflow_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity lab2_3_2_dataflow_tb Is
end lab2_3_2_dataflow_tb;

Architecture behavior of lab2_3_2_dataflow_tb Is
	Component lab2_3_2_dataflow
	port (
		a  	 		: in STD_LOGIC_VECTOR (3 downto 0);
		b  	 		: in STD_LOGIC_VECTOR (3 downto 0);
		cin  		: in STD_LOGIC;
		seg0 		: out STD_LOGIC_VECTOR (6 downto 0);
		an	 		: out STD_LOGIC_VECTOR (3 downto 0);
		m_s_digit 	: out STD_LOGIC
	);	
	End Component;
	
	Signal a 	: STD_LOGIC_VECTOR(3 downto 0) := "0000";
	Signal b 	: STD_LOGIC_VECTOR(3 downto 0) := "0000";
	Signal cin  : STD_LOGIC := '0';
	
	Signal seg0 : STD_LOGIC_VECTOR(6 downto 0);
	Signal an : STD_LOGIC_VECTOR(3 downto 0);
	Signal m_s_digit : STD_LOGIC;

begin
	DUP:  lab2_3_2_dataflow PORT MAP (
		a => a,
		b => b,
		cin => cin,
		seg0 => seg0,
		an => an,
		m_s_digit => m_s_digit
		 );
		 
	process
	begin
		wait;
	end process;
end behavior;