---------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Yu Wenlu
-- 
-- Create Date: 2023/02/11 21:49:18
-- Design Name: main3_final
-- Module Name: main3_final - Behavioral
-- Project Name: Assignment1
-- Target Devices: Basys3 
-- Tool Versions: 2021.2
-- Description:    main file for final design
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main3_final is port (
   clk  : in  STD_LOGIC;

   btnU, btnD,  btnC : in  STD_LOGIC;--btnL, btnR,
   seg  : out STD_LOGIC_VECTOR (6 downto 0);
   dp  : out STD_LOGIC;
   an   : out STD_LOGIC_VECTOR (3 downto 0));
end main3_final;

architecture Behavioral of main3_final is
       
signal clk_s : STD_LOGIC :='0';
type STATE is (STATE_SET, STATE_GO); 
signal CUR_STATE, NX_STATE: STATE; 

signal sw : unsigned (15 downto 0) := "0000000000000000";
signal action_out_C: STD_LOGIC;
signal action_out_U: STD_LOGIC;
signal action_out_D: STD_LOGIC;
--signal ck: std_logic;
signal reset: std_logic := '1';
begin

    action_Center: entity work.button_active(Behavioral)
        port map( action_in => btnC,
                  clk_in => clk,
                  action_out => action_out_C);
                  
    action_UP: entity work.button_active(Behavioral)
        port map( action_in => btnU,
                  clk_in => clk,
                  action_out => action_out_U);
                  
    action_DOWN: entity work.button_active(Behavioral)
        port map( action_in => btnD,
                  clk_in => clk,
                  action_out => action_out_D);    
                  
    four_digits_unit : entity work.four_digits(Behavioral)
        Port map (d3 => sw(15 downto 12),
                  d2 => sw(11 downto 8),
                  d1 => sw(7 downto 4),
                  d0 => sw(3 downto 0),
                  --ck => ck,
                  clk => clk, seg => seg, an => an, cur_digit =>dp);

    clock_1s : ENTITY work.Clock_Divider(Behavioral) GENERIC MAP(count_end => 50000000)
        port map ( clk_in => clk,
                   clk_out =>clk_s);
                   
    state_do_it : process (reset, clk)
    begin
        if reset = '1' then
            CUR_STATE <= STATE_GO;
            reset <= not reset;
        elsif rising_edge(clk) then
            CUR_STATE <= NX_STATE;
        end if;
    end process;

    state_transferBCD : process (action_out_U, action_out_D, clk_s, action_out_C, CUR_STATE)
        variable counter_min : unsigned (5 downto 0);
        variable counter_sec : unsigned (5 downto 0);
        
        variable sw_m : unsigned (5 downto 0);
        variable sw_s : unsigned (5 downto 0);
        variable pause:boolean:=false;
        begin
            case CUR_STATE is 
                when STATE_SET =>-- Handle the STATE_SET state
                    if rising_edge(clk) then  -- Check for rising edge of the clock signal
                        case action_out_C is -- Check the value of action_out_C
                            when '1' =>-- If action_out_C is 1, set the next state to STATE_GO
                                NX_STATE <= STATE_GO; 
                                PAUSE := false; -- Reset pause when transitioning to STATE_GO
                            when others =>  -- If action_out_C is not 1, handle the other cases
                                NX_STATE <= STATE_SET; -- Set the next state to STATE_SET
                                pause := false; -- Reset pause when staying in STATE_SET
                                if action_out_U = '1' then-- If action_out_U is 1, increment the counter_min value
                                counter_sec := "000000";
                                for i in 0 to 59 loop
                                    if counter_min = i then
                                        counter_min := counter_min + 1;
                                    exit;
                                    end if;
                                end loop;           
                            if counter_min = 60 then -- If counter_min is 60, reset it to 0
                                counter_min := "000000";
                            end if;
                            elsif action_out_D = '1' then -- If action_out_D is 1, decrement the counter_min value
                                counter_sec := "000000";
                                for i in 0 to 59 loop
                                    if counter_min = i then
                                        counter_min := counter_min - 1;
                                        exit;
                                    end if;
                                end loop;
                                if counter_min = -1 then-- If counter_min is -1, set it to 59
                                    counter_min := "111011";
                                end if;
                            end if;
                        end case;
                    end if;
                
                when STATE_GO =>-- Handle the STATE_GO state
                    if rising_edge(clk_s) then-- Check for rising edge of the clock_s signal
                            if not pause then -- Check if the timer is not paused    
                            case NX_STATE is-- Check the value of NX_STATE
                                when STATE_SET =>-- If the next state is STATE_SET, handle the cases for action_out_C
                                        if action_out_C = '1' then
                                            NX_STATE <= STATE_SET;
                                            pause := false; -- Reset pause when transitioning to STATE_SET
                                        else
                                            NX_STATE <= STATE_GO;
                                            pause := false; -- Reset pause when staying in STATE_GO
                                        end if;
                    
                                when STATE_GO =>-- If the next state is STATE_GO, decrement the counter_sec value
                                    if counter_sec = 0 then
                                        if counter_min = 0 then -- If both counter_sec and counter_min are 0, pause the timer
                                            pause := true;
                                        else
                                            counter_sec := "111011";
                                                for i in 0 to 59 loop
                                                    if counter_min = i then
                                                        counter_min := counter_min - 1;
                                                        exit;
                                                    end if;
                                                end loop;
                                            if counter_min = -1 then-- If counter_min is -1, set it to 59
                                                counter_min := "111011";
                                            end if;
                                        end if;
                                    else
                                        counter_sec := counter_sec - 1;
                                    end if;
                            end case;
                        end if;
                    end if;
            end case;

            if ( counter_min >="000000" and counter_min <="001001") then
                sw(15 downto 12) <= "0000";
                sw(11 downto 8) <= counter_min(3 downto 0); 
            elsif (  counter_min <= "010011") then --19
                sw(15 downto 12) <= "0001";
                sw_m := (counter_min - "001010");
                sw(11 downto 8) <= sw_m(3 downto 0); 
            elsif (  counter_min <= "011101") then  --29
                sw(15 downto 12) <= "0010";
                sw_m := (counter_min - "010100");
                sw(11 downto 8) <= sw_m(3 downto 0);    
            elsif (  counter_min <= "100111") then --39
                sw(15 downto 12) <= "0011";
                sw_m := (counter_min - "011110");
                sw(11 downto 8) <= sw_m(3 downto 0);   
            elsif (  counter_min <= "110001") then --49
                sw(15 downto 12) <= "0100";
                sw_m := (counter_min - "101000");
                sw(11 downto 8) <= sw_m(3 downto 0);  
            elsif (  counter_min <= "111011") then --59
                sw(15 downto 12) <= "0101";
                sw_m := (counter_min - "110010");
                sw(11 downto 8) <= sw_m(3 downto 0);  
            elsif (  counter_min <= "111100") then 
                sw(15 downto 12) <= "0110";
                sw(11 downto 8) <= "0000";
            end if;
            
            if ( counter_sec >="000000" and counter_sec <="001001") then
                sw(7 downto 4) <= "0000";
                sw(3 downto 0) <= counter_sec(3 downto 0); 
            elsif (  counter_sec <= "010011") then 
                sw(7 downto 4) <= "0001";
                sw_s := (counter_sec - "001010");
                sw(3 downto 0) <= sw_s(3 downto 0); 
            elsif (  counter_sec <= "011101") then  
                sw(7 downto 4) <= "0010";
                sw_s := (counter_sec - "010100");
                sw(3 downto 0) <= sw_s(3 downto 0);    
            elsif (  counter_sec <= "100111") then 
                sw(7 downto 4) <= "0011";
                sw_s := (counter_sec - "011110");
                sw(3 downto 0) <= sw_s(3 downto 0);   
            elsif (  counter_sec <= "110001") then 
                sw(7 downto 4) <= "0100";
                sw_s := (counter_sec - "101000");
                sw(3 downto 0) <= sw_s(3 downto 0);  
            elsif (  counter_sec <= "111011") then 
                sw(7 downto 4) <= "0101";
                sw_s := (counter_sec - "110010");
                sw(3 downto 0) <= sw_s(3 downto 0);  
            end if;
    end process;
    
end Behavioral;
