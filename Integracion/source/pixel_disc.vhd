LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity pixel_disc is
	GENERIC(
	screen_height	:	INTEGER	:=	600;
	trace_width		:	INTEGER	:=	100;
	div_constant	:	INTEGER	:=	7
	);
    PORT(
	i_value		:	IN	UNSIGNED(11 DOWNTO 0);
	i_pixel_y	:	IN	UNSIGNED(9 DOWNTO 0);
	
	o_pixel		:	OUT STD_LOGIC := '0'
	);

end pixel_disc;

ARCHITECTURE Behavior of pixel_disc is
begin
	process(i_value,i_pixel_y)
	variable	v_y_value	:	INTEGER;
	variable	v_div	:	INTEGER;
	begin
		v_y_value := to_integer(screen_height - i_pixel_y);		
		v_div	:=	to_integer(i_value)/div_constant;
		
		if( (v_div > v_y_value) and (v_div < (v_y_value + trace_width)) ) then
			o_pixel <= '1';
		else
			o_pixel <= '0';
		end if;
	end process;
end Behavior;
	