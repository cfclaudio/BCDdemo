library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity BCD_adder_proc is
port ( a,b: in unsigned(3 downto 0);
		  ci: in unsigned(0 downto 0);
			s: out unsigned(3 downto 0);
		  co: out unsigned(0 downto 0));
end entity;

architecture struct of BCD_adder_proc is
signal tmp: unsigned(4 downto 0);
begin
	process(a,b,ci,tmp) begin
		tmp <= ("0"&a) + ("0"&b) + ("0000"&ci);
		if (tmp > 9) then tmp <= tmp+6; end if;
		s <= tmp(3 downto 0);
		co <= tmp(4 downto 4);
	end process;
end architecture;
