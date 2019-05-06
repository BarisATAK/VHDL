--------------
-- Parity Bit
-- Bar?? ATAK
--------------

library ieee;
use ieee.std_logic_1164.all;

entity parity is
	port(
	a:in std_logic_vector(7 downto 0);
	cp,tp:out std_logic
	);
end parity;

architecture behv of parity is
signal k:std_logic;
begin
	cp <= a(0) xor a(1) xor a(2) xor a(3) xor a(4) xor a(5) xor a(6) xor a(7);
	tp <= not(a(0) xor a(1) xor a(2) xor a(3) xor a(4) xor a(5) xor a(6) xor a(7));
	
end behv;

	