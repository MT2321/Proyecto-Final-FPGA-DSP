LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
--USE ieee.std_logic_arith.ALL;

ENTITY u2s IS
	GENERIC(
		bits	: INTEGER	:= 12
		);
	PORT(
		X:	IN 	STD_LOGIC_VECTOR((bits-1) DOWNTO 0);
		Y:	OUT STD_LOGIC_VECTOR((bits-1) DOWNTO 0)
		);
END u2s;

architecture Behavior of u2s is
	SIGNAL retval : STD_LOGIC_VECTOR((bits-1) DOWNTO 0);
begin
	process(X)
	constant c_zero : unsigned := TO_UNSIGNED(2**(bits-1),X'length);
	variable aux: signed((bits-1) DOWNTO 0);
	begin
		aux := signed(X) - signed(c_zero);
		Y <= std_logic_vector(aux);
	end process;
	
end Behavior;