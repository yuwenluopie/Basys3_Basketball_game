--------------------------------------------
-- Module Name: mux_2bit_2_to_1_dataflow_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity mux_2bit_2_to_1_dataflow_tb Is
end mux_2bit_2_to_1_dataflow_tb;

Architecture behavior of mux_2bit_2_to_1_dataflow_tb Is
	Component mux_2bit_2_to_1_dataflow
	port (
		x : in STD_LOGIC_VECTOR(1 downto 0);
		y : in STD_LOGIC_VECTOR(1 downto 0);
		s : in STD_LOGIC;
		m : out STD_LOGIC_VECTOR(1 downto 0)
		);	
	End Component;
	
	Signal m_int : STD_LOGIC_VECTOR(1 downto 0) := "00";
	Signal s_int : STD_LOGIC := '0';
	Signal x_int : STD_LOGIC_VECTOR(1 downto 0) := "00";
	Signal y_int : STD_LOGIC_VECTOR(1 downto 0) := "00";
	
begin
	uut:  mux_2bit_2_to_1_dataflow PORT MAP (
			x => x_int,
			y => y_int,
			s => s_int,
			m => m_int
		 );
		 
	process

	begin
	    wait for 10 ns; x_int <= "01";
	    wait for 10 ns; y_int <= "01";
	    wait for 10 ns; x_int <= "11"; y_int <= "00";
	    wait for 10 ns; x_int <= "10"; y_int <= "11";
	    wait for 10 ns; x_int <= "01";
	    wait for 10 ns; x_int <= "01";
	    wait for 10 ns; x_int <= "01";
	    wait for 10 ns; x_int <= "01"; y_int <= "00";
	    wait for 10 ns; x_int <= "01"; y_int <= "11";
		wait for 20 ns;
		
	end process;
end behavior;