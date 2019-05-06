--------------
-- Hamming Code
-- Bar?? ATAK
--------------
library ieee;
use ieee.std_logic_1164.all;

entity Hamming is
	port(
	A:in std_logic_vector (3 downto 0);	-- Data Bits
	control:out std_logic_vector(6 downto 0)
	);
end Hamming;

architecture behv of Hamming is
	signal a4,a5,a6	   :std_logic; 	--control 1
	signal a_4,a_5,a_6 :std_logic; 	--control 2
	signal B0,B1,B2    :std_logic;
begin
	--control 1 (sent)
	a4 <= A(0) XOR A(1) XOR A(2);
	a5 <= A(1) XOR A(2) XOR A(3);
	a6 <= A(2) XOR A(3) XOR A(0);

	--control 2 (recive)
	a_4 <= A(0) XOR A(1) XOR A(2);
	a_5 <= A(1) XOR A(2) XOR A(3);
	a_6 <= A(2) XOR A(3) XOR A(0);

	B0 <= a4 XOR a_4; -- No error if it would be ZERO
	B1 <= a5 XOR a_5;
	B2 <= a6 XOR a_6;
	
	control(0) <= B0;
	control(1) <= B1;
	coNtrol(2) <= B2;
	control(3) <= A(0);
	control(4) <= A(1);
	control(5) <= A(2);
	control(6) <= A(3);
end behv;
	
	
	