-- -------------------------------------------------------------
--
-- Module: filter
-- Generated by MATLAB(R) 9.12 and Filter Design HDL Coder 3.1.11.
-- Generated on: 2023-01-17 17:37:27
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- HDL Code Generation Options:
--
-- TargetLanguage: VHDL
-- TargetDirectory: bp2
-- TestBenchStimulus: step ramp chirp 

-- Filter Specifications:
--
-- Sample Rate            : N/A (normalized frequency)
-- Response               : Bandpass
-- Specification          : Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2
-- Second Stopband Edge   : 0.00375
-- First Stopband Edge    : 4.1667e-05
-- Second Stopband Atten. : 10 dB
-- Passband Ripple        : 1 dB
-- First Passband Edge    : 0.00125
-- First Stopband Atten.  : 10 dB
-- Second Passband Edge   : 0.0025
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- HDL Implementation    : Fully parallel
-- Folding Factor        : 1
-- -------------------------------------------------------------
-- Filter Settings:
--
-- Discrete-Time IIR Filter (real)
-- -------------------------------
-- Filter Structure    : Direct-Form II, Second-Order Sections
-- Number of Sections  : 2
-- Stable              : Yes
-- Linear Phase        : No
-- Arithmetic          : fixed
-- Numerator           : s16,14 -> [-2 2)
-- Denominator         : s16,14 -> [-2 2)
-- Scale Values        : s16,15 -> [-1 1)
-- Input               : s12,15 -> [-6.250000e-02 6.250000e-02)
-- Section Input       : s16,10 -> [-32 32)
-- Section Output      : s16,11 -> [-16 16)
-- Output              : s12,7 -> [-16 16)
-- State               : s16,15 -> [-1 1)
-- Numerator Prod      : s32,29 -> [-4 4)
-- Denominator Prod    : s32,29 -> [-4 4)
-- Numerator Accum     : s34,29 -> [-16 16)
-- Denominator Accum   : s34,29 -> [-16 16)
-- Round Mode          : convergent
-- Overflow Mode       : wrap
-- -------------------------------------------------------------



LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY bp2 IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         filter_in                       :   IN    std_logic_vector(11 DOWNTO 0); -- sfix12_En15
         filter_out                      :   OUT   std_logic_vector(11 DOWNTO 0)  -- sfix12_En7
         );

END bp2;


----------------------------------------------------------------
--Module Architecture: bp2
----------------------------------------------------------------
ARCHITECTURE rtl OF bp2 IS
  -- Local Functions
  -- Type Definitions
  TYPE delay_pipeline_type IS ARRAY (NATURAL range <>) OF signed(15 DOWNTO 0); -- sfix16_En15
  -- Constants
  CONSTANT scaleconst1                    : signed(15 DOWNTO 0) := to_signed(67, 16); -- sfix16_En15
  CONSTANT coeff_b1_section1              : signed(15 DOWNTO 0) := to_signed(16384, 16); -- sfix16_En14
  CONSTANT coeff_b2_section1              : signed(15 DOWNTO 0) := to_signed(0, 16); -- sfix16_En14
  CONSTANT coeff_b3_section1              : signed(15 DOWNTO 0) := to_signed(-16384, 16); -- sfix16_En14
  CONSTANT coeff_a2_section1              : signed(15 DOWNTO 0) := to_signed(-32721, 16); -- sfix16_En14
  CONSTANT coeff_a3_section1              : signed(15 DOWNTO 0) := to_signed(16338, 16); -- sfix16_En14
  CONSTANT scaleconst2                    : signed(15 DOWNTO 0) := to_signed(67, 16); -- sfix16_En15
  CONSTANT coeff_b1_section2              : signed(15 DOWNTO 0) := to_signed(16384, 16); -- sfix16_En14
  CONSTANT coeff_b2_section2              : signed(15 DOWNTO 0) := to_signed(0, 16); -- sfix16_En14
  CONSTANT coeff_b3_section2              : signed(15 DOWNTO 0) := to_signed(-16384, 16); -- sfix16_En14
  CONSTANT coeff_a2_section2              : signed(15 DOWNTO 0) := to_signed(-32743, 16); -- sfix16_En14
  CONSTANT coeff_a3_section2              : signed(15 DOWNTO 0) := to_signed(16360, 16); -- sfix16_En14
  CONSTANT scaleconst3                    : signed(15 DOWNTO 0) := to_signed(29205, 16); -- sfix16_En15
  -- Signals
  SIGNAL input_register                   : signed(11 DOWNTO 0); -- sfix12_En15
  SIGNAL scale1                           : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL mul_temp                         : signed(27 DOWNTO 0); -- sfix28_En30
  SIGNAL scaletypeconvert1                : signed(15 DOWNTO 0); -- sfix16_En10
  -- Section 1 Signals 
  SIGNAL a1sum1                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2sum1                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL b1sum1                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL typeconvert1                     : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL delay_section1                   : delay_pipeline_type(0 TO 1); -- sfix16_En15
  SIGNAL inputconv1                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2mul1                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL a3mul1                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b1mul1                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b3mul1                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL unaryminus_temp                  : signed(16 DOWNTO 0); -- sfix17_En15
  SIGNAL sub_cast                         : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_1                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp                         : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL sub_cast_2                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_3                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_1                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL b1multypeconvert1                : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast                         : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast_1                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_temp                         : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL section_result1                  : signed(15 DOWNTO 0); -- sfix16_En11
  SIGNAL scale2                           : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL mul_temp_1                       : signed(31 DOWNTO 0); -- sfix32_En26
  SIGNAL scaletypeconvert2                : signed(15 DOWNTO 0); -- sfix16_En10
  -- Section 2 Signals 
  SIGNAL a1sum2                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2sum2                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL b1sum2                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL typeconvert2                     : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL delay_section2                   : delay_pipeline_type(0 TO 1); -- sfix16_En15
  SIGNAL inputconv2                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2mul2                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL a3mul2                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b1mul2                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b3mul2                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL unaryminus_temp_1                : signed(16 DOWNTO 0); -- sfix17_En15
  SIGNAL sub_cast_4                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_5                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_2                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL sub_cast_6                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_7                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_3                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL b1multypeconvert2                : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast_2                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast_3                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_temp_1                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL section_result2                  : signed(15 DOWNTO 0); -- sfix16_En11
  SIGNAL scale3                           : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL mul_temp_2                       : signed(31 DOWNTO 0); -- sfix32_En26
  SIGNAL output_typeconvert               : signed(11 DOWNTO 0); -- sfix12_En7
  SIGNAL output_register                  : signed(11 DOWNTO 0); -- sfix12_En7


BEGIN

  -- Block Statements
  input_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      input_register <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        input_register <= signed(filter_in);
      END IF;
    END IF; 
  END PROCESS input_reg_process;

  mul_temp <= input_register * scaleconst1;
  scale1 <= resize(mul_temp, 36);

  scaletypeconvert1 <= resize(shift_right(scale1(35 DOWNTO 0) + ( "0" & (scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20) & NOT scale1(20))), 20), 16);

  --   ------------------ Section 1 ------------------

  typeconvert1 <= resize(shift_right(a1sum1(29 DOWNTO 0) + ( "0" & (a1sum1(14) & NOT a1sum1(14) & NOT a1sum1(14) & NOT a1sum1(14) & NOT a1sum1(14) & NOT a1sum1(14) & NOT a1sum1(14) & NOT a1sum1(14) & NOT a1sum1(14) & NOT a1sum1(14) & NOT a1sum1(14) & NOT a1sum1(14) & NOT a1sum1(14) & NOT a1sum1(14))), 14), 16);

  delay_process_section1 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delay_section1 <= (OTHERS => (OTHERS => '0'));
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        delay_section1(1) <= delay_section1(0);
        delay_section1(0) <= typeconvert1;
      END IF;
    END IF;
  END PROCESS delay_process_section1;

  inputconv1 <= resize(scaletypeconvert1(14 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 34);

  a2mul1 <= delay_section1(0) * coeff_a2_section1;

  a3mul1 <= delay_section1(1) * coeff_a3_section1;

  b1mul1 <= resize(typeconvert1(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  unaryminus_temp <= ('0' & delay_section1(1)) WHEN delay_section1(1) = "1000000000000000"
      ELSE -resize(delay_section1(1),17);
  b3mul1 <= resize(unaryminus_temp(16 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  sub_cast <= inputconv1;
  sub_cast_1 <= resize(a2mul1, 34);
  sub_temp <= resize(sub_cast, 35) - resize(sub_cast_1, 35);
  a2sum1 <= sub_temp(33 DOWNTO 0);

  sub_cast_2 <= a2sum1;
  sub_cast_3 <= resize(a3mul1, 34);
  sub_temp_1 <= resize(sub_cast_2, 35) - resize(sub_cast_3, 35);
  a1sum1 <= sub_temp_1(33 DOWNTO 0);

  b1multypeconvert1 <= resize(b1mul1, 34);

  add_cast <= b1multypeconvert1;
  add_cast_1 <= resize(b3mul1, 34);
  add_temp <= resize(add_cast, 35) + resize(add_cast_1, 35);
  b1sum1 <= add_temp(33 DOWNTO 0);

  section_result1 <= resize(shift_right(b1sum1(33 DOWNTO 0) + ( "0" & (b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18) & NOT b1sum1(18))), 18), 16);

  mul_temp_1 <= section_result1 * scaleconst2;
  scale2 <= resize(mul_temp_1(31 DOWNTO 0) & '0' & '0' & '0' & '0', 36);

  scaletypeconvert2 <= resize(shift_right(scale2(35 DOWNTO 0) + ( "0" & (scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20) & NOT scale2(20))), 20), 16);

  --   ------------------ Section 2 ------------------

  typeconvert2 <= resize(shift_right(a1sum2(29 DOWNTO 0) + ( "0" & (a1sum2(14) & NOT a1sum2(14) & NOT a1sum2(14) & NOT a1sum2(14) & NOT a1sum2(14) & NOT a1sum2(14) & NOT a1sum2(14) & NOT a1sum2(14) & NOT a1sum2(14) & NOT a1sum2(14) & NOT a1sum2(14) & NOT a1sum2(14) & NOT a1sum2(14) & NOT a1sum2(14))), 14), 16);

  delay_process_section2 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delay_section2 <= (OTHERS => (OTHERS => '0'));
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        delay_section2(1) <= delay_section2(0);
        delay_section2(0) <= typeconvert2;
      END IF;
    END IF;
  END PROCESS delay_process_section2;

  inputconv2 <= resize(scaletypeconvert2(14 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 34);

  a2mul2 <= delay_section2(0) * coeff_a2_section2;

  a3mul2 <= delay_section2(1) * coeff_a3_section2;

  b1mul2 <= resize(typeconvert2(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  unaryminus_temp_1 <= ('0' & delay_section2(1)) WHEN delay_section2(1) = "1000000000000000"
      ELSE -resize(delay_section2(1),17);
  b3mul2 <= resize(unaryminus_temp_1(16 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  sub_cast_4 <= inputconv2;
  sub_cast_5 <= resize(a2mul2, 34);
  sub_temp_2 <= resize(sub_cast_4, 35) - resize(sub_cast_5, 35);
  a2sum2 <= sub_temp_2(33 DOWNTO 0);

  sub_cast_6 <= a2sum2;
  sub_cast_7 <= resize(a3mul2, 34);
  sub_temp_3 <= resize(sub_cast_6, 35) - resize(sub_cast_7, 35);
  a1sum2 <= sub_temp_3(33 DOWNTO 0);

  b1multypeconvert2 <= resize(b1mul2, 34);

  add_cast_2 <= b1multypeconvert2;
  add_cast_3 <= resize(b3mul2, 34);
  add_temp_1 <= resize(add_cast_2, 35) + resize(add_cast_3, 35);
  b1sum2 <= add_temp_1(33 DOWNTO 0);

  section_result2 <= resize(shift_right(b1sum2(33 DOWNTO 0) + ( "0" & (b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18))), 18), 16);

  mul_temp_2 <= section_result2 * scaleconst3;
  scale3 <= resize(mul_temp_2(31 DOWNTO 0) & '0' & '0' & '0' & '0', 36);

  output_typeconvert <= resize(shift_right(scale3(34 DOWNTO 0) + ( "0" & (scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23) & NOT scale3(23))), 23), 12);

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
