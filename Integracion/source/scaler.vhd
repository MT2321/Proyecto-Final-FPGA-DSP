LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity scaler is
    PORT(
		i_value		:	IN  UNSIGNED(41 DOWNTO 0);
		i_prescaler	:	IN	UNSIGNED(15 DOWNTO 0);
		o_value 	:	OUT	UNSIGNED(11 DOWNTO 0)
    	);
end scaler;

architecture Behavior of scaler is
begin
	process(i_value, i_prescaler)
	variable division: INTEGER;
	begin
		division := to_integer(i_value)/to_integer(i_prescaler);
		o_value <= to_unsigned(division,o_value'length);
	end process;
end Behavior;
