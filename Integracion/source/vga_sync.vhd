LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.math_real.all;

ENTITY vga_sync IS
	GENERIC(
		pix_clk	: INTEGER := 40000000;	-- Hz
		width	: INTEGER := 800;	-- px
		h_fp	: INTEGER := 40;
		h_sp	: INTEGER := 128;
		h_bp	: INTEGER := 88;
		height	: INTEGER := 600;	-- px
		v_fp	: INTEGER := 1;
		v_sp	: INTEGER := 4;
		v_bp	: INTEGER := 23
		);
	PORT(
		clock	: IN STD_LOGIC;
		hsync: OUT STD_LOGIC;
		HE: OUT STD_LOGIC;
		vsync: OUT STD_LOGIC;
		VE: OUT STD_LOGIC;
		x: OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		y: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
		);
END vga_sync;

ARCHITECTURE Behavior OF vga_sync IS
BEGIN
	
	PROCESS(clock)
		CONSTANT line_vis	: INTEGER := width;
		CONSTANT line_fp	: INTEGER := width + h_fp;
		CONSTANT line_sync	: INTEGER := width + h_fp + h_sp;
		CONSTANT line_end	: INTEGER := width + h_fp + h_sp + h_bp;
		CONSTANT frame_vis	: INTEGER := height;
		CONSTANT frame_fp	: INTEGER := height + v_fp;
		CONSTANT frame_sync	: INTEGER := height + v_fp + v_sp;
		CONSTANT frame_end	: INTEGER := height + v_fp + v_sp + v_bp;
		VARIABLE h_pos: INTEGER := 0;	-- Horizontal pixel counter
		VARIABLE v_pos: INTEGER := 0;	-- Vertical pixel counter
	BEGIN
		IF(clock'EVENT and clock = '1') THEN
			-- Avanzo contadores
			h_pos := (h_pos + 1);
			IF(h_pos = line_end) THEN
				v_pos := (v_pos + 1) mod frame_end;
				h_pos := 0;						  
			END IF;
			
			-- Act�o respecto los contadores H
			IF (h_pos < line_vis) THEN
				hsync <= '1';
				HE	<= '1';
			ELSIF (h_pos < line_fp) THEN
				hsync <= '1';
				HE <= '0';
			ELSIF (h_pos < line_sync) THEN
				hsync <='0';
				HE <= '0';
			ELSIF (h_pos < line_end) THEN
				hsync <= '1';
				HE <= '0';
			END IF;
			
			-- Act�o respecto los contadores V
			IF (v_pos < frame_vis) THEN
				vsync <= '1';
				VE	<= '1';
			ELSIF (v_pos < frame_fp) THEN
				vsync <= '1';
				VE <= '0';
			ELSIF (v_pos < frame_sync) THEN
				vsync <='0';
				VE <= '0';
			ELSIF (v_pos < frame_end) THEN
				vsync <= '1';
				VE <= '0';
			END IF;
			
			-- Devuelvo la posicion x,y
			x <= STD_LOGIC_VECTOR(to_unsigned(h_pos, x'length));
			y <= STD_LOGIC_VECTOR(to_unsigned(v_pos, y'length));
		END IF;
	END PROCESS;
END Behavior;