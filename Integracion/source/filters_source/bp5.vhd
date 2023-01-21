-- -------------------------------------------------------------
--
-- Module: bp5
-- Generated by MATLAB(R) 9.12 and Filter Design HDL Coder 3.1.11.
-- Generated on: 2023-01-17 17:21:09
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- HDL Code Generation Options:
--
-- TargetLanguage: VHDL
-- Name: bp5
-- TestBenchStimulus: step ramp chirp 

-- Filter Specifications:
--
-- Sample Rate            : N/A (normalized frequency)
-- Response               : Bandpass
-- Specification          : Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2
-- Second Stopband Edge   : 0.026875
-- First Stopband Edge    : 0.0089583
-- Second Stopband Atten. : 20 dB
-- Passband Ripple        : 1 dB
-- First Passband Edge    : 0.013417
-- First Stopband Atten.  : 20 dB
-- Second Passband Edge   : 0.022375
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
-- Number of Sections  : 4
-- Stable              : Yes
-- Linear Phase        : No
-- Arithmetic          : fixed
-- Numerator           : s16,14 -> [-2 2)
-- Denominator         : s16,14 -> [-2 2)
-- Scale Values        : s16,15 -> [-1 1)
-- Input               : s12,15 -> [-6.250000e-02 6.250000e-02)
-- Section Input       : s16,10 -> [-32 32)
-- Section Output      : s16,11 -> [-16 16)
-- Output              : s29,24 -> [-16 16)
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

ENTITY bp5 IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         filter_in                       :   IN    std_logic_vector(11 DOWNTO 0); -- sfix12_En15
         filter_out                      :   OUT   std_logic_vector(28 DOWNTO 0)  -- sfix29_En24
         );

END bp5;


----------------------------------------------------------------
--Module Architecture: bp5
----------------------------------------------------------------
ARCHITECTURE rtl OF bp5 IS
  -- Local Functions
  -- Type Definitions
  TYPE delay_pipeline_type IS ARRAY (NATURAL range <>) OF signed(15 DOWNTO 0); -- sfix16_En15
  -- Constants
  CONSTANT scaleconst1                    : signed(15 DOWNTO 0) := to_signed(24386, 16); -- sfix16_En15
  CONSTANT coeff_b1_section1              : signed(15 DOWNTO 0) := to_signed(16384, 16); -- sfix16_En14
  CONSTANT coeff_b2_section1              : signed(15 DOWNTO 0) := to_signed(-32749, 16); -- sfix16_En14
  CONSTANT coeff_b3_section1              : signed(15 DOWNTO 0) := to_signed(16384, 16); -- sfix16_En14
  CONSTANT coeff_a2_section1              : signed(15 DOWNTO 0) := to_signed(-32451, 16); -- sfix16_En14
  CONSTANT coeff_a3_section1              : signed(15 DOWNTO 0) := to_signed(16164, 16); -- sfix16_En14
  CONSTANT scaleconst2                    : signed(15 DOWNTO 0) := to_signed(24386, 16); -- sfix16_En15
  CONSTANT coeff_b1_section2              : signed(15 DOWNTO 0) := to_signed(16384, 16); -- sfix16_En14
  CONSTANT coeff_b2_section2              : signed(15 DOWNTO 0) := to_signed(-32643, 16); -- sfix16_En14
  CONSTANT coeff_b3_section2              : signed(15 DOWNTO 0) := to_signed(16384, 16); -- sfix16_En14
  CONSTANT coeff_a2_section2              : signed(15 DOWNTO 0) := to_signed(-32634, 16); -- sfix16_En14
  CONSTANT coeff_a3_section2              : signed(15 DOWNTO 0) := to_signed(16274, 16); -- sfix16_En14
  CONSTANT scaleconst3                    : signed(15 DOWNTO 0) := to_signed(13573, 16); -- sfix16_En15
  CONSTANT coeff_b1_section3              : signed(15 DOWNTO 0) := to_signed(16384, 16); -- sfix16_En14
  CONSTANT coeff_b2_section3              : signed(15 DOWNTO 0) := to_signed(-32762, 16); -- sfix16_En14
  CONSTANT coeff_b3_section3              : signed(15 DOWNTO 0) := to_signed(16384, 16); -- sfix16_En14
  CONSTANT coeff_a2_section3              : signed(15 DOWNTO 0) := to_signed(-31748, 16); -- sfix16_En14
  CONSTANT coeff_a3_section3              : signed(15 DOWNTO 0) := to_signed(15449, 16); -- sfix16_En14
  CONSTANT scaleconst4                    : signed(15 DOWNTO 0) := to_signed(13573, 16); -- sfix16_En15
  CONSTANT coeff_b1_section4              : signed(15 DOWNTO 0) := to_signed(16384, 16); -- sfix16_En14
  CONSTANT coeff_b2_section4              : signed(15 DOWNTO 0) := to_signed(-32406, 16); -- sfix16_En14
  CONSTANT coeff_b3_section4              : signed(15 DOWNTO 0) := to_signed(16384, 16); -- sfix16_En14
  CONSTANT coeff_a2_section4              : signed(15 DOWNTO 0) := to_signed(-32216, 16); -- sfix16_En14
  CONSTANT coeff_a3_section4              : signed(15 DOWNTO 0) := to_signed(15859, 16); -- sfix16_En14
  -- Signals
  SIGNAL input_register                   : signed(11 DOWNTO 0); -- sfix12_En15
  SIGNAL scale1                           : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL mul_temp                         : signed(27 DOWNTO 0); -- sfix28_En30
  SIGNAL scaletypeconvert1                : signed(15 DOWNTO 0); -- sfix16_En10
  -- Section 1 Signals 
  SIGNAL a1sum1                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2sum1                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL b1sum1                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL b2sum1                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL typeconvert1                     : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL delay_section1                   : delay_pipeline_type(0 TO 1); -- sfix16_En15
  SIGNAL inputconv1                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2mul1                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL a3mul1                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b1mul1                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b2mul1                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b3mul1                           : signed(31 DOWNTO 0); -- sfix32_En29
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
  SIGNAL add_cast_2                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast_3                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_temp_1                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL section_result1                  : signed(15 DOWNTO 0); -- sfix16_En11
  SIGNAL scale2                           : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL mul_temp_1                       : signed(31 DOWNTO 0); -- sfix32_En26
  SIGNAL scaletypeconvert2                : signed(15 DOWNTO 0); -- sfix16_En10
  -- Section 2 Signals 
  SIGNAL a1sum2                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2sum2                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL b1sum2                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL b2sum2                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL typeconvert2                     : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL delay_section2                   : delay_pipeline_type(0 TO 1); -- sfix16_En15
  SIGNAL inputconv2                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2mul2                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL a3mul2                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b1mul2                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b2mul2                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b3mul2                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL sub_cast_4                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_5                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_2                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL sub_cast_6                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_7                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_3                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL b1multypeconvert2                : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast_4                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast_5                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_temp_2                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL add_cast_6                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast_7                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_temp_3                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL section_result2                  : signed(15 DOWNTO 0); -- sfix16_En11
  SIGNAL scale3                           : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL mul_temp_2                       : signed(31 DOWNTO 0); -- sfix32_En26
  SIGNAL scaletypeconvert3                : signed(15 DOWNTO 0); -- sfix16_En10
  -- Section 3 Signals 
  SIGNAL a1sum3                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2sum3                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL b1sum3                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL b2sum3                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL typeconvert3                     : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL delay_section3                   : delay_pipeline_type(0 TO 1); -- sfix16_En15
  SIGNAL inputconv3                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2mul3                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL a3mul3                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b1mul3                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b2mul3                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b3mul3                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL sub_cast_8                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_9                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_4                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL sub_cast_10                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_11                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_5                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL b1multypeconvert3                : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast_8                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast_9                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_temp_4                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL add_cast_10                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast_11                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_temp_5                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL section_result3                  : signed(15 DOWNTO 0); -- sfix16_En11
  SIGNAL scale4                           : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL mul_temp_3                       : signed(31 DOWNTO 0); -- sfix32_En26
  SIGNAL scaletypeconvert4                : signed(15 DOWNTO 0); -- sfix16_En10
  -- Section 4 Signals 
  SIGNAL a1sum4                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2sum4                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL b1sum4                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL b2sum4                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL typeconvert4                     : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL delay_section4                   : delay_pipeline_type(0 TO 1); -- sfix16_En15
  SIGNAL inputconv4                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2mul4                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL a3mul4                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b1mul4                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b2mul4                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b3mul4                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL sub_cast_12                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_13                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_6                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL sub_cast_14                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_15                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_7                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL b1multypeconvert4                : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast_12                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast_13                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_temp_6                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL add_cast_14                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_cast_15                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL add_temp_7                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL output_typeconvert               : signed(28 DOWNTO 0); -- sfix29_En24
  SIGNAL output_register                  : signed(28 DOWNTO 0); -- sfix29_En24


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

  b2mul1 <= delay_section1(0) * coeff_b2_section1;

  b3mul1 <= resize(delay_section1(1)(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

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
  add_cast_1 <= resize(b2mul1, 34);
  add_temp <= resize(add_cast, 35) + resize(add_cast_1, 35);
  b2sum1 <= add_temp(33 DOWNTO 0);

  add_cast_2 <= b2sum1;
  add_cast_3 <= resize(b3mul1, 34);
  add_temp_1 <= resize(add_cast_2, 35) + resize(add_cast_3, 35);
  b1sum1 <= add_temp_1(33 DOWNTO 0);

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

  b2mul2 <= delay_section2(0) * coeff_b2_section2;

  b3mul2 <= resize(delay_section2(1)(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  sub_cast_4 <= inputconv2;
  sub_cast_5 <= resize(a2mul2, 34);
  sub_temp_2 <= resize(sub_cast_4, 35) - resize(sub_cast_5, 35);
  a2sum2 <= sub_temp_2(33 DOWNTO 0);

  sub_cast_6 <= a2sum2;
  sub_cast_7 <= resize(a3mul2, 34);
  sub_temp_3 <= resize(sub_cast_6, 35) - resize(sub_cast_7, 35);
  a1sum2 <= sub_temp_3(33 DOWNTO 0);

  b1multypeconvert2 <= resize(b1mul2, 34);

  add_cast_4 <= b1multypeconvert2;
  add_cast_5 <= resize(b2mul2, 34);
  add_temp_2 <= resize(add_cast_4, 35) + resize(add_cast_5, 35);
  b2sum2 <= add_temp_2(33 DOWNTO 0);

  add_cast_6 <= b2sum2;
  add_cast_7 <= resize(b3mul2, 34);
  add_temp_3 <= resize(add_cast_6, 35) + resize(add_cast_7, 35);
  b1sum2 <= add_temp_3(33 DOWNTO 0);

  section_result2 <= resize(shift_right(b1sum2(33 DOWNTO 0) + ( "0" & (b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18) & NOT b1sum2(18))), 18), 16);

  mul_temp_2 <= section_result2 * scaleconst3;
  scale3 <= resize(mul_temp_2(31 DOWNTO 0) & '0' & '0' & '0' & '0', 36);

  scaletypeconvert3 <= resize(shift_right(scale3(35 DOWNTO 0) + ( "0" & (scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20) & NOT scale3(20))), 20), 16);

  --   ------------------ Section 3 ------------------

  typeconvert3 <= resize(shift_right(a1sum3(29 DOWNTO 0) + ( "0" & (a1sum3(14) & NOT a1sum3(14) & NOT a1sum3(14) & NOT a1sum3(14) & NOT a1sum3(14) & NOT a1sum3(14) & NOT a1sum3(14) & NOT a1sum3(14) & NOT a1sum3(14) & NOT a1sum3(14) & NOT a1sum3(14) & NOT a1sum3(14) & NOT a1sum3(14) & NOT a1sum3(14))), 14), 16);

  delay_process_section3 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delay_section3 <= (OTHERS => (OTHERS => '0'));
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        delay_section3(1) <= delay_section3(0);
        delay_section3(0) <= typeconvert3;
      END IF;
    END IF;
  END PROCESS delay_process_section3;

  inputconv3 <= resize(scaletypeconvert3(14 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 34);

  a2mul3 <= delay_section3(0) * coeff_a2_section3;

  a3mul3 <= delay_section3(1) * coeff_a3_section3;

  b1mul3 <= resize(typeconvert3(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  b2mul3 <= delay_section3(0) * coeff_b2_section3;

  b3mul3 <= resize(delay_section3(1)(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  sub_cast_8 <= inputconv3;
  sub_cast_9 <= resize(a2mul3, 34);
  sub_temp_4 <= resize(sub_cast_8, 35) - resize(sub_cast_9, 35);
  a2sum3 <= sub_temp_4(33 DOWNTO 0);

  sub_cast_10 <= a2sum3;
  sub_cast_11 <= resize(a3mul3, 34);
  sub_temp_5 <= resize(sub_cast_10, 35) - resize(sub_cast_11, 35);
  a1sum3 <= sub_temp_5(33 DOWNTO 0);

  b1multypeconvert3 <= resize(b1mul3, 34);

  add_cast_8 <= b1multypeconvert3;
  add_cast_9 <= resize(b2mul3, 34);
  add_temp_4 <= resize(add_cast_8, 35) + resize(add_cast_9, 35);
  b2sum3 <= add_temp_4(33 DOWNTO 0);

  add_cast_10 <= b2sum3;
  add_cast_11 <= resize(b3mul3, 34);
  add_temp_5 <= resize(add_cast_10, 35) + resize(add_cast_11, 35);
  b1sum3 <= add_temp_5(33 DOWNTO 0);

  section_result3 <= resize(shift_right(b1sum3(33 DOWNTO 0) + ( "0" & (b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18) & NOT b1sum3(18))), 18), 16);

  mul_temp_3 <= section_result3 * scaleconst4;
  scale4 <= resize(mul_temp_3(31 DOWNTO 0) & '0' & '0' & '0' & '0', 36);

  scaletypeconvert4 <= resize(shift_right(scale4(35 DOWNTO 0) + ( "0" & (scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20) & NOT scale4(20))), 20), 16);

  --   ------------------ Section 4 ------------------

  typeconvert4 <= resize(shift_right(a1sum4(29 DOWNTO 0) + ( "0" & (a1sum4(14) & NOT a1sum4(14) & NOT a1sum4(14) & NOT a1sum4(14) & NOT a1sum4(14) & NOT a1sum4(14) & NOT a1sum4(14) & NOT a1sum4(14) & NOT a1sum4(14) & NOT a1sum4(14) & NOT a1sum4(14) & NOT a1sum4(14) & NOT a1sum4(14) & NOT a1sum4(14))), 14), 16);

  delay_process_section4 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delay_section4 <= (OTHERS => (OTHERS => '0'));
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        delay_section4(1) <= delay_section4(0);
        delay_section4(0) <= typeconvert4;
      END IF;
    END IF;
  END PROCESS delay_process_section4;

  inputconv4 <= resize(scaletypeconvert4(14 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 34);

  a2mul4 <= delay_section4(0) * coeff_a2_section4;

  a3mul4 <= delay_section4(1) * coeff_a3_section4;

  b1mul4 <= resize(typeconvert4(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  b2mul4 <= delay_section4(0) * coeff_b2_section4;

  b3mul4 <= resize(delay_section4(1)(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  sub_cast_12 <= inputconv4;
  sub_cast_13 <= resize(a2mul4, 34);
  sub_temp_6 <= resize(sub_cast_12, 35) - resize(sub_cast_13, 35);
  a2sum4 <= sub_temp_6(33 DOWNTO 0);

  sub_cast_14 <= a2sum4;
  sub_cast_15 <= resize(a3mul4, 34);
  sub_temp_7 <= resize(sub_cast_14, 35) - resize(sub_cast_15, 35);
  a1sum4 <= sub_temp_7(33 DOWNTO 0);

  b1multypeconvert4 <= resize(b1mul4, 34);

  add_cast_12 <= b1multypeconvert4;
  add_cast_13 <= resize(b2mul4, 34);
  add_temp_6 <= resize(add_cast_12, 35) + resize(add_cast_13, 35);
  b2sum4 <= add_temp_6(33 DOWNTO 0);

  add_cast_14 <= b2sum4;
  add_cast_15 <= resize(b3mul4, 34);
  add_temp_7 <= resize(add_cast_14, 35) + resize(add_cast_15, 35);
  b1sum4 <= add_temp_7(33 DOWNTO 0);

  output_typeconvert <= resize(shift_right(b1sum4(33 DOWNTO 0) + ( "0" & (b1sum4(5) & NOT b1sum4(5) & NOT b1sum4(5) & NOT b1sum4(5) & NOT b1sum4(5))), 5), 29);

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
