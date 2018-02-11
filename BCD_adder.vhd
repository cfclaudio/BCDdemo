library IEEE;
use IEEE.std_logic_1164.all; -- operations like concatination and comparison are in this package
use IEEE.std_logic_arith.all; -- unsigned type is in this package

entity BCD_adder is
port( a, b: in unsigned(3 downto 0); 
		ci: 	in unsigned(0 downto 0);
		s:		out unsigned(3 downto 0);
		co:	out unsigned(0 downto 0));
end BCD_adder;

architecture struct of BCD_adder is
signal tmp, tmps: unsigned(4 downto 0);

begin 
	tmp <=  ('0'&a) + ('0'&b) + ("0000"&ci);
	tmps <= tmp+6 when tmp>9 
		else tmp;
		
	s  <= tmps(3 downto 0);
	co <= tmps(4 downto 4);
end struct;
