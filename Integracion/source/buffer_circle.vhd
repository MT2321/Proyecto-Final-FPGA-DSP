LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity buffer_circle is
	GENERIC(
		buffer_len	:	INTEGER	:=	800
	);
	PORT(
		i_write_val	:	IN	STD_LOGIC_VECTOR(11 DOWNTO 0);
		i_w_clk		:	IN	STD_LOGIC;
		i_r_clk		:	IN	STD_LOGIC;
		i_rel_addr	:	IN	UNSIGNED(9 DOWNTO 0);
		
		o_data		:	OUT	STD_LOGIC_VECTOR(11 DOWNTO 0):="000000000000";
		o_r_addr	:	BUFFER UNSIGNED(14 DOWNTO 0):="000000000000000";
		o_w_addr	:	BUFFER UNSIGNED(14 DOWNTO 0):="000000000000000"
	);
end buffer_circle;

architecture Behavior of buffer_circle is
signal rel_addr_init:	UNSIGNED(14 DOWNTO 0):="000000000000000";
signal next_av_addr	:	UNSIGNED(14 DOWNTO 0):="000000000000000";
signal initial_sec	:	INTEGER :=	1;
--CONSTANT buffer_len :	INTEGER	:= 800;

begin
	p_write: process(i_w_clk)
	begin
		if(i_w_clk'EVENT and i_w_clk = '1') then
			o_w_addr <= next_av_addr;
			o_data <= i_write_val;
			if( (next_av_addr = rel_addr_init) and (initial_sec = 0) ) then
				rel_addr_init <= rel_addr_init + 1;			-- Incremento el inicial
				if (rel_addr_init = (buffer_len -1)) then	-- Lo reviso cuando da len-1 para que el próximo ya sea 0.
					rel_addr_init <= "000000000000000";
				end if;
			end if;
			
			next_av_addr <= next_av_addr + 1;				-- Incremento el siguiente disponible
			if(next_av_addr = (buffer_len-1)) then			-- Si ya estoy en el último
				next_av_addr <= "000000000000000";			-- El siguiente disponible ya es el 0
			end if;
			
			initial_sec <= 0;
		end if;
		
	end process p_write;
	
	p_read:	process(i_r_clk) 
	begin  
		if(i_r_clk'EVENT and i_r_clk = '1') then
			o_r_addr <= rel_addr_init + i_rel_addr;
			if (o_r_addr >= buffer_len) then
				o_r_addr <= o_r_addr - buffer_len;
			end if;
			
		end if;
	end process p_read;
end Behavior;