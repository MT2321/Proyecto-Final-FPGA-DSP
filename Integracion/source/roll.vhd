LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity roll is
    PORT(
		i_value		:	IN  UNSIGNED(11 DOWNTO 0);
		i_prescaler	:	IN	UNSIGNED(15 DOWNTO 0);
		i_clk		:	IN	STD_LOGIC;
		
		o_w_clk		:	OUT STD_LOGIC := '0';
		o_value 	:	OUT	UNSIGNED(11 DOWNTO 0)
    	);
end roll;

architecture Behavior of roll is
	signal r_counter: integer := 0;
begin
	process(i_clk)
	begin
		if (i_clk'Event and i_clk = '1') then
			if (r_counter = to_integer(i_prescaler)) then
				o_value <= i_value;
				o_w_clk <= '1';
				r_counter <= 0;
			else
				r_counter <= r_counter + 1;
				o_w_clk <= '0';
			end if;
		end if;
	end process;
end Behavior;
		
