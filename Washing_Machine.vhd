--------------------------------------------------
-- Simple Washsing Machine
-- Bar?? ATAK
-- May 6, 2019
-- 4 Situations: BSL, YK, DRL, SKM
-- Reading Symbols: y='00', d='01', s='10', r='11'
---------------------------------------------------

Library IEEE;
Use IEEE.std_logic_1164.all;

Entity Washing_Machine is
Port(   c : in  std_logic;  -- clock
	A : in  std_logic_vector(1 downto 0);
	f : out std_logic); -- finish
End Washing_Machine;

Architecture Behv of Washing_Machine is
Type tSituations is ( BSL, YK, DRL, SKM);
Signal dNow : tSituations :=BSL; 		-- First Situation.
Begin 
   Process(c)
      Begin
	if(Rising_edge(c))then
	  Case dNow is
	    When BSL =>
	      if(A = "00") then
		f <= '0';  dNow <= YK;
	      elsif(A = "01") then
		f <= '0';  dNow <= DRL;
	      elsif(A = "10") then
		f <= '0';  dNow <= SKM;
	      elsif(A = "11") then		-- Reset Situation.	
		f <= '0';  dNow <= BSL;
	      end if;
	    When YK =>
	      if(A = "01") then
		f <= '0';  dNow <= DRL;
	      elsif(A = "11") then
		f <= '0';  dNow <= BSL;
	      end if;
   	    When DRL =>
	      if(A = "10") then
		f <= '0';  dNow <= SKM;
	      elsif(A = "11") then
		f <= '0';  dNow <= BSL;
	      end if;
	    When SKM =>
	      f <= '1';				-- Finish.	
	      if(A = "11") then
		f <= '0';  dNow <= BSL;
	      end if;
	    end case;
	 end if;
    end process;
End Behv;
