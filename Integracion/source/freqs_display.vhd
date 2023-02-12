LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity freqs_display is
	GENERIC(
		sc_width		:	INTEGER	:=	800;
		sc_height		:	INTEGER	:=	600;
		bins			:	INTEGER	:=	3;
		num_samples		:	INTEGER	:=	1600
	);
	PORT(
		i_bin_1		:	IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
		i_bin_2		:	IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
		i_bin_3		:	IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
		i_posx		:	IN	STD_LOGIC_VECTOR(9 DOWNTO 0);
		o_prescaler	:	OUT	STD_LOGIC_VECTOR(15 DOWNTO 0);

		sample_clk			:	IN	STD_LOGIC;
		o_set_values_flag	:	OUT STD_LOGIC := '0';
		o_val				:	OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
		);
end freqs_display;

architecture Behavior of freqs_display is
signal		r_counter	:	UNSIGNED(15 DOWNTO 0):="0000000000000000";
constant	bin_width	:	INTEGER	:=	sc_width/bins;
begin
	process(i_posx) is
	begin
		o_prescaler <= std_logic_vector(to_unsigned(num_samples,16));
		if(to_integer(unsigned(i_posx)) < bin_width) then
			o_val	<=	i_bin_1;
		elsif ( to_integer(unsigned(i_posx)) < bin_width*2 ) then
			o_val	<=	i_bin_2;
		elsif ( to_integer(unsigned(i_posx)) < bin_width*3 ) then
			o_val	<=	i_bin_3;
		else
			o_val	<=	i_bin_1;
		end if;
	end process;

	process(sample_clk) is
	begin
		if(sample_clk'EVENT and sample_clk = '1') then
			if	(r_counter = to_unsigned(num_samples,16)) then
				o_set_values_flag <= '1';
				r_counter <= to_unsigned(0,16);
			else
				r_counter <= r_counter + 1;
				o_set_values_flag <= '0';
			end if;
		end if;	
	end process;

end Behavior;