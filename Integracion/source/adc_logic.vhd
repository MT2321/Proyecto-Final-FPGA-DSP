LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity adc_logic is
    PORT(
        clk   :   IN  STD_LOGIC;
        cs_n  :   IN  STD_LOGIC;
		       
        adc_cs_n:   OUT STD_LOGIC;
        adc_saddr:  OUT STD_LOGIC := '0';
        adc_sdat:   IN  STD_LOGIC;
		
        o_ready	:   OUT STD_LOGIC := '0';
        o_one   :   OUT STD_LOGIC := '1';
        o_data  :   OUT STD_LOGIC_VECTOR(11 DOWNTO 0):= "000000000000"
    	);

end adc_logic;

architecture Behavior of adc_logic is
	signal r_counter: integer := 0;
begin
    p_data: process(clk)
	begin
		-- Synchronous operations
        if(clk'EVENT and clk = '0') THEN
			-- Run internal counter	
			if (cs_n = '0') THEN -- Run counter only if cs_n = 0
                r_counter <= r_counter + 1;
            else				   -- Else reset everything
                r_counter <= 0;
                o_ready <= '0';
				o_data <= "000000000000";
            end if;
			
			if(r_counter = 15) then-- Reset counter upon reaching top
				r_counter <= 0;
				o_ready <= '0';
			end if;

	        case r_counter is
				when  4 => o_data(11) <= adc_sdat;
	            when  5 => o_data(10) <= adc_sdat;
	            when  6 => o_data(9) <= adc_sdat;
	            when  7 => o_data(8) <= adc_sdat;
	            when  8 => o_data(7) <= adc_sdat;
	            when  9 => o_data(6) <= adc_sdat;
	            when 10 => o_data(5) <= adc_sdat;
	            when 11 => o_data(4) <= adc_sdat;
	            when 12 => o_data(3) <= adc_sdat;
	            when 13 => o_data(2) <= adc_sdat;
	            when 14 => o_data(1) <= adc_sdat;
	            when 15 => o_data(0) <= adc_sdat;	o_ready <= '1';
	            when others => o_ready <= '0';
	        end case;
        end if;
    end process;
end Behavior;