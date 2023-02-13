LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
USE ieee.numeric_std.all;

ENTITY ps_select IS
	GENERIC(
	val_0:	INTEGER:=	100;
	val_1:	INTEGER:=	500;
	val_2:	INTEGER:=	1000;
	val_3:	INTEGER:=	10000;
	val_4:	INTEGER:=	20000
	);
	PORT (
	i_sw : IN STD_LOGIC ;
	
	o_Q : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	) ;
END ps_select ;

architecture Behavior of ps_select is
signal r_counter :	INTEGER := 0;
begin
	process(i_sw)
	begin
		if(i_sw'EVENT and i_sw = '1') then
			r_counter <= r_counter + 1;
			
			if(r_counter >= 5) then
				r_counter <= 0;
			end if;
			
			case r_counter is
				when 0 => o_Q <= std_logic_vector(to_unsigned(val_0,o_Q'length));
				when 1 => o_Q <= std_logic_vector(to_unsigned(val_1,o_Q'length));
				when 2 => o_Q <= std_logic_vector(to_unsigned(val_2,o_Q'length));
				when 3 => o_Q <= std_logic_vector(to_unsigned(val_3,o_Q'length));
				when 4 => o_Q <= std_logic_vector(to_unsigned(val_4,o_Q'length));
				when others => o_Q <= std_logic_vector(to_unsigned(val_0,o_Q'length));
			end case;
		end if;
	end process;
end Behavior;