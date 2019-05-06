---------------------------------
-- Full Adder
-- Bar?? Atak
-- May 2, 2019
-- Input Ports  : i_1, i_2, i_3
-- Output Ports : sum_2, carry_3
---------------------------------

Library IEEE;
Use IEEE.std_logic_1164.all;

Entity Full_Adder is
Port(i_1     : in std_logic;
     i_2     : in std_logic;
     i_3     : in std_logic;
     sum_1   : inout std_logic;
     carry_1 : inout std_logic;
     carry_2 : inout std_logic;
     sum_2   : out std_logic;
     carry_3 : out std_logic);
End Full_Adder;

Architecture Behv of Full_Adder is
Begin
	sum_1   <= i_1     xor i_2;
	carry_1 <= i_1     and i_2;
	sum_2   <= sum_1   xor i_3;
	carry_2 <= sum_1   and i_3;
	carry_3 <= carry_1 or  carry_2;
End Behv;