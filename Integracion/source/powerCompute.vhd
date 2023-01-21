LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY powerCompute IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         samples_in                      :   IN    std_logic_vector(11 DOWNTO 0); -- sfix12_En15
         power_out                       :   OUT   std_logic_vector(41 DOWNTO 0);  -- sfix12_En27
			latched_output_power 			  :   OUT   std_logic_vector(41 DOWNTO 0)
         );

END powerCompute;


----------------------------------------------------------------
--Module Architecture: powerCompute
----------------------------------------------------------------
ARCHITECTURE rtl OF powerCompute IS


BEGIN

  -- Block Statements

  Output_Register_process : PROCESS (clk, reset)   
   CONSTANT MAX_SAMPLES     					: signed(15 DOWNTO 0) := to_signed(3, 16); -- sfix12_En12
 
  -- Signals
	  
	  variable mul_temp                         : signed(23 DOWNTO 0); -- sfix24_En27
	  variable output_register                  : signed(31 DOWNTO 0); -- sfix12_En27
	  variable power_output                     : signed(41 DOWNTO 0); -- sfix12_En27
	  variable temp_power 								: signed(41 DOWNTO 0); -- sfix12_En27 
	  
  
  BEGIN
    
	IF clk'event AND clk = '1' THEN
	   mul_temp := signed(samples_in) * signed(samples_in); -- x(n)*x(n)
		IF reset = '1' THEN
			IF clk_enable = '1' THEN		
				temp_power := power_output;
				latched_output_power <= std_logic_vector(temp_power);
				power_output := (OTHERS => '0'); --reset power output
			END IF;
		END IF;
		
	
      IF clk_enable = '1' THEN		
			power_output := power_output + resize(mul_temp, 42);
      END IF;
    END IF; 
	   -- Assignment Statements
  power_out <= std_logic_vector(power_output);
  END PROCESS Output_Register_process;


END rtl;
