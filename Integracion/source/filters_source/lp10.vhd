-- -------------------------------------------------------------
--
-- Module: lp10
-- Generated by MATLAB(R) 9.12 and Filter Design HDL Coder 3.1.11.
-- Generated on: 2023-01-17 17:39:22
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- HDL Code Generation Options:
--
-- TargetLanguage: VHDL
-- Name: lp10
-- TestBenchStimulus: step ramp chirp 

-- Filter Specifications:
--
-- Sample Rate     : N/A (normalized frequency)
-- Response        : Lowpass
-- Specification   : Fp,Fst,Ap,Ast
-- Stopband Edge   : 0.91667
-- Passband Ripple : 1 dB
-- Passband Edge   : 0.83333
-- Stopband Atten. : 30 dB
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
-- Number of Sections  : 3
-- Stable              : Yes
-- Linear Phase        : No
-- Arithmetic          : fixed
-- Numerator           : s16,13 -> [-4 4)
-- Denominator         : s16,14 -> [-2 2)
-- Scale Values        : s16,15 -> [-1 1)
-- Input               : s12,15 -> [-6.250000e-02 6.250000e-02)
-- Section Input       : s16,9 -> [-64 64)
-- Section Output      : s16,10 -> [-32 32)
-- Output              : s12,6 -> [-32 32)
-- State               : s16,15 -> [-1 1)
-- Numerator Prod      : s32,28 -> [-8 8)
-- Denominator Prod    : s32,29 -> [-4 4)
-- Numerator Accum     : s34,28 -> [-32 32)
-- Denominator Accum   : s34,29 -> [-16 16)
-- Round Mode          : convergent
-- Overflow Mode       : wrap
-- -------------------------------------------------------------



LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY lp10 IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         filter_in                       :   IN    std_logic_vector(11 DOWNTO 0); -- sfix12_En15
         filter_out                      :   OUT   std_logic_vector(11 DOWNTO 0)  -- sfix12_En6
         );

END lp10;


----------------------------------------------------------------
--Module Architecture: lp10
----------------------------------------------------------------
ARCHITECTURE rtl OF lp10 IS
  -- Local Functions
  -- Type Definitions
  TYPE delay_pipeline_type IS ARRAY (NATURAL range <>) OF signed(15 DOWNTO 0); -- sfix16_En15
  -- Constants
  CONSTANT scaleconst1                    : signed(15 DOWNTO 0) := to_signed(27864, 16); -- sfix16_En15
  CONSTANT coeff_b1_section1              : signed(15 DOWNTO 0) := to_signed(8192, 16); -- sfix16_En13
  CONSTANT coeff_b2_section1              : signed(15 DOWNTO 0) := to_signed(16384, 16); -- sfix16_En13
  CONSTANT coeff_b3_section1              : signed(15 DOWNTO 0) := to_signed(8192, 16); -- sfix16_En13
  CONSTANT coeff_a2_section1              : signed(15 DOWNTO 0) := to_signed(26337, 16); -- sfix16_En14
  CONSTANT coeff_a3_section1              : signed(15 DOWNTO 0) := to_signed(13007, 16); -- sfix16_En14
  CONSTANT scaleconst2                    : signed(15 DOWNTO 0) := to_signed(23644, 16); -- sfix16_En15
  CONSTANT coeff_b1_section2              : signed(15 DOWNTO 0) := to_signed(8192, 16); -- sfix16_En13
  CONSTANT coeff_b2_section2              : signed(15 DOWNTO 0) := to_signed(16384, 16); -- sfix16_En13
  CONSTANT coeff_b3_section2              : signed(15 DOWNTO 0) := to_signed(8192, 16); -- sfix16_En13
  CONSTANT coeff_a2_section2              : signed(15 DOWNTO 0) := to_signed(22349, 16); -- sfix16_En14
  CONSTANT coeff_a3_section2              : signed(15 DOWNTO 0) := to_signed(8556, 16); -- sfix16_En14
  CONSTANT scaleconst3                    : signed(15 DOWNTO 0) := to_signed(21743, 16); -- sfix16_En15
  CONSTANT coeff_b1_section3              : signed(15 DOWNTO 0) := to_signed(8192, 16); -- sfix16_En13
  CONSTANT coeff_b2_section3              : signed(15 DOWNTO 0) := to_signed(16384, 16); -- sfix16_En13
  CONSTANT coeff_b3_section3              : signed(15 DOWNTO 0) := to_signed(8192, 16); -- sfix16_En13
  CONSTANT coeff_a2_section3              : signed(15 DOWNTO 0) := to_signed(20552, 16); -- sfix16_En14
  CONSTANT coeff_a3_section3              : signed(15 DOWNTO 0) := to_signed(6551, 16); -- sfix16_En14
  -- Signals
  SIGNAL input_register                   : signed(11 DOWNTO 0); -- sfix12_En15
  SIGNAL scale1                           : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL mul_temp                         : signed(27 DOWNTO 0); -- sfix28_En30
  SIGNAL scaletypeconvert1                : signed(15 DOWNTO 0); -- sfix16_En9
  -- Section 1 Signals 
  SIGNAL a1sum1                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2sum1                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL b1sum1                           : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL b2sum1                           : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL typeconvert1                     : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL delay_section1                   : delay_pipeline_type(0 TO 1); -- sfix16_En15
  SIGNAL inputconv1                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2mul1                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL a3mul1                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b1mul1                           : signed(31 DOWNTO 0); -- sfix32_En28
  SIGNAL b2mul1                           : signed(31 DOWNTO 0); -- sfix32_En28
  SIGNAL b3mul1                           : signed(31 DOWNTO 0); -- sfix32_En28
  SIGNAL sub_cast                         : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_1                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp                         : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL sub_cast_2                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_3                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_1                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL b1multypeconvert1                : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_cast                         : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_cast_1                       : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_temp                         : signed(34 DOWNTO 0); -- sfix35_En28
  SIGNAL add_cast_2                       : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_cast_3                       : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_temp_1                       : signed(34 DOWNTO 0); -- sfix35_En28
  SIGNAL section_result1                  : signed(15 DOWNTO 0); -- sfix16_En10
  SIGNAL scale2                           : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL mul_temp_1                       : signed(31 DOWNTO 0); -- sfix32_En25
  SIGNAL scaletypeconvert2                : signed(15 DOWNTO 0); -- sfix16_En9
  -- Section 2 Signals 
  SIGNAL a1sum2                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2sum2                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL b1sum2                           : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL b2sum2                           : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL typeconvert2                     : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL delay_section2                   : delay_pipeline_type(0 TO 1); -- sfix16_En15
  SIGNAL inputconv2                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2mul2                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL a3mul2                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b1mul2                           : signed(31 DOWNTO 0); -- sfix32_En28
  SIGNAL b2mul2                           : signed(31 DOWNTO 0); -- sfix32_En28
  SIGNAL b3mul2                           : signed(31 DOWNTO 0); -- sfix32_En28
  SIGNAL sub_cast_4                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_5                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_2                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL sub_cast_6                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_7                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_3                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL b1multypeconvert2                : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_cast_4                       : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_cast_5                       : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_temp_2                       : signed(34 DOWNTO 0); -- sfix35_En28
  SIGNAL add_cast_6                       : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_cast_7                       : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_temp_3                       : signed(34 DOWNTO 0); -- sfix35_En28
  SIGNAL section_result2                  : signed(15 DOWNTO 0); -- sfix16_En10
  SIGNAL scale3                           : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL mul_temp_2                       : signed(31 DOWNTO 0); -- sfix32_En25
  SIGNAL scaletypeconvert3                : signed(15 DOWNTO 0); -- sfix16_En9
  -- Section 3 Signals 
  SIGNAL a1sum3                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2sum3                           : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL b1sum3                           : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL b2sum3                           : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL typeconvert3                     : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL delay_section3                   : delay_pipeline_type(0 TO 1); -- sfix16_En15
  SIGNAL inputconv3                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL a2mul3                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL a3mul3                           : signed(31 DOWNTO 0); -- sfix32_En29
  SIGNAL b1mul3                           : signed(31 DOWNTO 0); -- sfix32_En28
  SIGNAL b2mul3                           : signed(31 DOWNTO 0); -- sfix32_En28
  SIGNAL b3mul3                           : signed(31 DOWNTO 0); -- sfix32_En28
  SIGNAL sub_cast_8                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_9                       : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_4                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL sub_cast_10                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_cast_11                      : signed(33 DOWNTO 0); -- sfix34_En29
  SIGNAL sub_temp_5                       : signed(34 DOWNTO 0); -- sfix35_En29
  SIGNAL b1multypeconvert3                : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_cast_8                       : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_cast_9                       : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_temp_4                       : signed(34 DOWNTO 0); -- sfix35_En28
  SIGNAL add_cast_10                      : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_cast_11                      : signed(33 DOWNTO 0); -- sfix34_En28
  SIGNAL add_temp_5                       : signed(34 DOWNTO 0); -- sfix35_En28
  SIGNAL output_typeconvert               : signed(11 DOWNTO 0); -- sfix12_En6
  SIGNAL output_register                  : signed(11 DOWNTO 0); -- sfix12_En6


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
  scale1 <= resize(mul_temp, 37);

  scaletypeconvert1 <= resize(shift_right(scale1(36 DOWNTO 0) + ( "0" & (scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21) & NOT scale1(21))), 21), 16);

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

  inputconv1 <= resize(scaletypeconvert1(13 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 34);

  a2mul1 <= delay_section1(0) * coeff_a2_section1;

  a3mul1 <= delay_section1(1) * coeff_a3_section1;

  b1mul1 <= resize(typeconvert1(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  b2mul1 <= resize(delay_section1(0)(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  b3mul1 <= resize(delay_section1(1)(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

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
  scale2 <= resize(mul_temp_1(31 DOWNTO 0) & '0' & '0' & '0' & '0' & '0', 37);

  scaletypeconvert2 <= resize(shift_right(scale2(36 DOWNTO 0) + ( "0" & (scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21) & NOT scale2(21))), 21), 16);

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

  inputconv2 <= resize(scaletypeconvert2(13 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 34);

  a2mul2 <= delay_section2(0) * coeff_a2_section2;

  a3mul2 <= delay_section2(1) * coeff_a3_section2;

  b1mul2 <= resize(typeconvert2(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  b2mul2 <= resize(delay_section2(0)(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  b3mul2 <= resize(delay_section2(1)(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

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
  scale3 <= resize(mul_temp_2(31 DOWNTO 0) & '0' & '0' & '0' & '0' & '0', 37);

  scaletypeconvert3 <= resize(shift_right(scale3(36 DOWNTO 0) + ( "0" & (scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21) & NOT scale3(21))), 21), 16);

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

  inputconv3 <= resize(scaletypeconvert3(13 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 34);

  a2mul3 <= delay_section3(0) * coeff_a2_section3;

  a3mul3 <= delay_section3(1) * coeff_a3_section3;

  b1mul3 <= resize(typeconvert3(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  b2mul3 <= resize(delay_section3(0)(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

  b3mul3 <= resize(delay_section3(1)(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);

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

  output_typeconvert <= resize(shift_right(b1sum3(33 DOWNTO 0) + ( "0" & (b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22) & NOT b1sum3(22))), 22), 12);

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
