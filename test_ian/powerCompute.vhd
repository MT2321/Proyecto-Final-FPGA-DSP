-- -------------------------------------------------------------
--
-- Module: highpass
-- Generated by MATLAB(R) 9.12 and Filter Design HDL Coder 3.1.11.
-- Generated on: 2023-01-15 11:10:34
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- HDL Code Generation Options:
--
-- TargetLanguage: VHDL
-- FIRAdderStyle: tree
-- Name: highpass
-- TestBenchStimulus: impulse step ramp chirp noise 

-- -------------------------------------------------------------
-- HDL Implementation    : Fully parallel
-- Folding Factor        : 1
-- -------------------------------------------------------------
-- Filter Settings:
--
-- Discrete-Time FIR Filter (real)
-- -------------------------------
-- Filter Structure  : Direct-Form FIR
-- Filter Length     : 11
-- Stable            : Yes
-- Linear Phase      : Yes (Type 1)
-- Arithmetic        : fixed
-- Numerator         : s12,12 -> [-5.000000e-01 5.000000e-01)
-- Input             : s12,15 -> [-6.250000e-02 6.250000e-02)
-- Filter Internals  : Specify Precision
--   Output          : s12,27 -> [-1.525879e-05 1.525879e-05)
--   Product         : s27,27 -> [-5.000000e-01 5.000000e-01)
--   Accumulator     : s29,27 -> [-2 2)
--   Round Mode      : convergent
--   Overflow Mode   : wrap
-- -------------------------------------------------------------



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
  -- Local Functions
  -- Type Definitions
  -- Constants



  
  
  
  -- Obtener una señal de comienzo de frame
  -- tomar las muestras de una filtrada
  -- calcular la potencia de todas y sumarla.
  -- Una vez que se calcula la potencia dejarla latcheada hasta que pidan el dato
  -- Fijarse de poder promediar la potencia de varios frames.
  
  

  


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