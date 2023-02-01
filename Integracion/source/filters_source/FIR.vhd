-- -------------------------------------------------------------
--
-- Module: FIR_IAN
-- Generated by MATLAB(R) 9.12 and Filter Design HDL Coder 3.1.11.
-- Generated on: 2023-01-31 20:15:15
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- HDL Code Generation Options:
--
-- TargetLanguage: VHDL
-- Name: FIR_IAN
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
-- Filter Length     : 10
-- Stable            : Yes
-- Linear Phase      : Yes (Type 2)
-- Arithmetic        : fixed
-- Numerator         : s16,16 -> [-5.000000e-01 5.000000e-01)
-- Input             : s16,15 -> [-1 1)
-- Filter Internals  : Full Precision
--   Output          : s33,31 -> [-2 2)  (auto determined)
--   Product         : s31,31 -> [-5.000000e-01 5.000000e-01)  (auto determined)
--   Accumulator     : s33,31 -> [-2 2)  (auto determined)
--   Round Mode      : No rounding
--   Overflow Mode   : No overflow
-- -------------------------------------------------------------



LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY FIR_IAN IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         filter_in                       :   IN    std_logic_vector(11 DOWNTO 0); -- sfix16_En15
         filter_out                      :   OUT   std_logic_vector(28 DOWNTO 0)  -- sfix33_En31
         );

END FIR_IAN;


----------------------------------------------------------------
--Module Architecture: FIR_IAN
----------------------------------------------------------------
ARCHITECTURE rtl OF FIR_IAN IS
  -- Local Functions
  -- Type Definitions
  TYPE delay_pipeline_type IS ARRAY (NATURAL range <>) OF signed(11 DOWNTO 0); -- sfix16_En15
  -- Constants
  CONSTANT coeff1                         : signed(7 DOWNTO 0) := to_signed(ian, 8); -- sfix16_En16
  CONSTANT coeff2                         : signed(7 DOWNTO 0) := to_signed(ian, 8); -- sfix16_En16
  CONSTANT coeff3                         : signed(7 DOWNTO 0) := to_signed(ian, 8); -- sfix16_En16
  CONSTANT coeff4                         : signed(7 DOWNTO 0) := to_signed(ian, 8); -- sfix16_En16
  CONSTANT coeff5                         : signed(7 DOWNTO 0) := to_signed(ian, 8); -- sfix16_En16
  CONSTANT coeff6                         : signed(7 DOWNTO 0) := to_signed(ian, 8); -- sfix16_En16
  CONSTANT coeff7                         : signed(7 DOWNTO 0) := to_signed(ian, 8); -- sfix16_En16
  CONSTANT coeff8                         : signed(7 DOWNTO 0) := to_signed(ian, 8); -- sfix16_En16
  CONSTANT coeff9                         : signed(7 DOWNTO 0) := to_signed(ian, 8); -- sfix16_En16
  CONSTANT coeff10                        : signed(7 DOWNTO 0) := to_signed(ian, 8); -- sfix16_En16

  -- Signals
  SIGNAL delay_pipeline                   : delay_pipeline_type(0 TO 9); -- sfix16_En15
  SIGNAL product9                         : signed(19 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp                         : signed(19 DOWNTO 0); -- sfix32_En31
  SIGNAL product8                         : signed(19 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_1                       : signed(19 DOWNTO 0); -- sfix32_En31
  SIGNAL product7                         : signed(19 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_2                       : signed(19 DOWNTO 0); -- sfix32_En31
  SIGNAL product6                         : signed(19 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_3                       : signed(19 DOWNTO 0); -- sfix32_En31
  SIGNAL product5                         : signed(19 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_4                       : signed(19 DOWNTO 0); -- sfix32_En31
  SIGNAL product4                         : signed(19 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_5                       : signed(19 DOWNTO 0); -- sfix32_En31
  SIGNAL product3                         : signed(19 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_6                       : signed(19 DOWNTO 0); -- sfix32_En31
  SIGNAL product2                         : signed(19 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_7                       : signed(19 DOWNTO 0); -- sfix32_En31
  SIGNAL product1                         : signed(19 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_8                       : signed(19 DOWNTO 0); -- sfix32_En31
  SIGNAL product0                         : signed(19 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_9                       : signed(19 DOWNTO 0); -- sfix32_En31
  SIGNAL sum1                             : signed(20 DOWNTO 0); -- sfix33_En31
  SIGNAL add_temp                         : signed(20 DOWNTO 0); -- sfix32_En31
  SIGNAL sum2                             : signed(21 DOWNTO 0); -- sfix33_En31
  SIGNAL add_temp_1                       : signed(21 DOWNTO 0); -- sfix34_En31
  SIGNAL sum3                             : signed(22 DOWNTO 0); -- sfix33_En31
  SIGNAL add_temp_2                       : signed(22 DOWNTO 0); -- sfix34_En31
  SIGNAL sum4                             : signed(23 DOWNTO 0); -- sfix33_En31
  SIGNAL add_temp_3                       : signed(23 DOWNTO 0); -- sfix34_En31
  SIGNAL sum5                             : signed(24 DOWNTO 0); -- sfix33_En31
  SIGNAL add_temp_4                       : signed(24 DOWNTO 0); -- sfix34_En31
  SIGNAL sum6                             : signed(25 DOWNTO 0); -- sfix33_En31
  SIGNAL add_temp_5                       : signed(25 DOWNTO 0); -- sfix34_En31
  SIGNAL sum7                             : signed(26 DOWNTO 0); -- sfix33_En31
  SIGNAL add_temp_6                       : signed(26 DOWNTO 0); -- sfix34_En31
  SIGNAL sum8                             : signed(27 DOWNTO 0); -- sfix33_En31
  SIGNAL add_temp_7                       : signed(27 DOWNTO 0); -- sfix34_En31
  SIGNAL sum9                             : signed(28 DOWNTO 0); -- sfix33_En31
  SIGNAL add_temp_8                       : signed(28 DOWNTO 0); -- sfix34_En31
  SIGNAL output_typeconvert               : signed(28 DOWNTO 0); -- sfix33_En31
  SIGNAL output_register                  : signed(28 DOWNTO 0); -- sfix33_En31


BEGIN

  -- Block Statements
  Delay_Pipeline_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delay_pipeline(0 TO 9) <= (OTHERS => (OTHERS => '0'));
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        delay_pipeline(0) <= signed(filter_in);
        delay_pipeline(1 TO 9) <= delay_pipeline(0 TO 8);
      END IF;
    END IF; 
  END PROCESS Delay_Pipeline_process;

  mul_temp <= delay_pipeline(9) * coeff10;
  product9 <= resize(mul_temp,20);

  mul_temp_1 <= delay_pipeline(8) * coeff9;
  product8 <= resize(mul_temp_1,20);

  mul_temp_2 <= delay_pipeline(7) * coeff8;
  product7 <= resize(mul_temp_2,20);

  mul_temp_3 <= delay_pipeline(6) * coeff7;
  product6 <= resize(mul_temp_3,20);

  mul_temp_4 <= delay_pipeline(5) * coeff6;
  product5 <= resize(mul_temp_4,20);

  mul_temp_5 <= delay_pipeline(4) * coeff5;
  product4 <= resize(mul_temp_5,20);

  mul_temp_6 <= delay_pipeline(3) * coeff4;
  product3 <= resize(mul_temp_6,20);

  mul_temp_7 <= delay_pipeline(2) * coeff3;
  product2 <= resize(mul_temp_7,20);

  mul_temp_8 <= delay_pipeline(1) * coeff2;
  product1 <= resize(mul_temp_8,20);

  mul_temp_9 <= delay_pipeline(0) * coeff1;
  product0 <= resize(mul_temp_9,20);


  add_temp <= resize(product0, 21) + resize(product1, 21);
  sum1 <= resize(add_temp, 21);

  add_temp_1 <= resize(sum1, 22) + resize(product2, 22);
  sum2 <= resize(add_temp_1,22);

  add_temp_2 <= resize(sum2, 23) + resize(product3, 23);
  sum3 <= resize(add_temp_2,23);

  add_temp_3 <= resize(sum3, 24) + resize(product4, 24);
  sum4 <= resize(add_temp_3,24);

  add_temp_4 <= resize(sum4, 25) + resize(product5, 25);
  sum5 <= resize(add_temp_4,25);

  add_temp_5 <= resize(sum5, 26) + resize(product6, 26);
  sum6 <= resize(add_temp_5,26);

  add_temp_6 <= resize(sum6, 27) + resize(product7, 27);
  sum7 <= resize(add_temp_6,27);

  add_temp_7 <= resize(sum7, 28) + resize(product8, 28);
  sum8 <= resize(add_temp_7,28);

  add_temp_8 <= resize(sum8, 29) + resize(product9, 29);
   sum9 <= resize(add_temp_8,29);

  output_typeconvert <= sum9;

  Output_Register_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      output_register <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        output_register <= output_typeconvert;
      END IF;
    END IF; 
  END PROCESS Output_Register_process;

  -- Assignment Statements
  filter_out <= std_logic_vector(output_register);
END rtl;
