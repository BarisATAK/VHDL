--------------
-- Gray Code Bit
-- Bar?? ATAK
--------------

library ieee;
use ieee.std_logic_1164.all;

entity grayCode is
	port(
	A:in std_logic_vector(3 downto 0);
	B:out std_logic_vector(3 downto 0)
	);
end grayCode;
architecture Behv of grayCode is
begin
	B(3) <= A(3);
	B(2) <= A(3) XOR A(2);
	B(1) <= A(2) XOR A(1);
	B(0) <= A(1) XOR A(0);
end behv;