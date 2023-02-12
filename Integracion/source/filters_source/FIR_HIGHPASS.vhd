
 -- FIR_HIGHPASS.vhd
 -- 2023-02-05 18:08:53.884888
 -- This filter has 45 taps
 -- The number of bits for the coefficients is 8
 -- The number of bits for the samples is 12
 -- The number of bits for the multiplications is 20
 -- The number of bits for the output is 63
 
 
 LIBRARY IEEE;
 USE IEEE.std_logic_1164.all;
 USE IEEE.numeric_std.ALL;
 
 entity FIR_HIGHPASS is
     Port ( clk : in std_logic;
            reset : in std_logic; 
            clk_enable : in std_logic;
            filter_in : in signed(11 downto 0);
            filter_out : out signed(11 downto 0));
 end FIR_HIGHPASS;
 
 architecture rtl of FIR_HIGHPASS is
 
     -- Signals
     TYPE delay_pipeline_type IS ARRAY (NATURAL range <>) OF signed(11 DOWNTO 0); -- sfix16_En15
     
     CONSTANT coeff1                         : signed(7 DOWNTO 0) := to_signed(-1, 8);
 CONSTANT coeff2                         : signed(7 DOWNTO 0) := to_signed(-1, 8);
 CONSTANT coeff3                         : signed(7 DOWNTO 0) := to_signed(-1, 8);
 CONSTANT coeff4                         : signed(7 DOWNTO 0) := to_signed(-1, 8);
 CONSTANT coeff5                         : signed(7 DOWNTO 0) := to_signed(0, 8);
 CONSTANT coeff6                         : signed(7 DOWNTO 0) := to_signed(-1, 8);
 CONSTANT coeff7                         : signed(7 DOWNTO 0) := to_signed(-2, 8);
 CONSTANT coeff8                         : signed(7 DOWNTO 0) := to_signed(-2, 8);
 CONSTANT coeff9                         : signed(7 DOWNTO 0) := to_signed(0, 8);
 CONSTANT coeff10                         : signed(7 DOWNTO 0) := to_signed(1, 8);
 CONSTANT coeff11                         : signed(7 DOWNTO 0) := to_signed(-1, 8);
 CONSTANT coeff12                         : signed(7 DOWNTO 0) := to_signed(-4, 8);
 CONSTANT coeff13                         : signed(7 DOWNTO 0) := to_signed(-3, 8);
 CONSTANT coeff14                         : signed(7 DOWNTO 0) := to_signed(3, 8);
 CONSTANT coeff15                         : signed(7 DOWNTO 0) := to_signed(5, 8);
 CONSTANT coeff16                         : signed(7 DOWNTO 0) := to_signed(-3, 8);
 CONSTANT coeff17                         : signed(7 DOWNTO 0) := to_signed(-11, 8);
 CONSTANT coeff18                         : signed(7 DOWNTO 0) := to_signed(-4, 8);
 CONSTANT coeff19                         : signed(7 DOWNTO 0) := to_signed(13, 8);
 CONSTANT coeff20                         : signed(7 DOWNTO 0) := to_signed(15, 8);
 CONSTANT coeff21                         : signed(7 DOWNTO 0) := to_signed(-18, 8);
 CONSTANT coeff22                         : signed(7 DOWNTO 0) := to_signed(-68, 8);
 CONSTANT coeff23                         : signed(7 DOWNTO 0) := to_signed(127, 8);
 CONSTANT coeff24                         : signed(7 DOWNTO 0) := to_signed(-68, 8);
 CONSTANT coeff25                         : signed(7 DOWNTO 0) := to_signed(-18, 8);
 CONSTANT coeff26                         : signed(7 DOWNTO 0) := to_signed(15, 8);
 CONSTANT coeff27                         : signed(7 DOWNTO 0) := to_signed(13, 8);
 CONSTANT coeff28                         : signed(7 DOWNTO 0) := to_signed(-4, 8);
 CONSTANT coeff29                         : signed(7 DOWNTO 0) := to_signed(-11, 8);
 CONSTANT coeff30                         : signed(7 DOWNTO 0) := to_signed(-3, 8);
 CONSTANT coeff31                         : signed(7 DOWNTO 0) := to_signed(5, 8);
 CONSTANT coeff32                         : signed(7 DOWNTO 0) := to_signed(3, 8);
 CONSTANT coeff33                         : signed(7 DOWNTO 0) := to_signed(-3, 8);
 CONSTANT coeff34                         : signed(7 DOWNTO 0) := to_signed(-4, 8);
 CONSTANT coeff35                         : signed(7 DOWNTO 0) := to_signed(-1, 8);
 CONSTANT coeff36                         : signed(7 DOWNTO 0) := to_signed(1, 8);
 CONSTANT coeff37                         : signed(7 DOWNTO 0) := to_signed(0, 8);
 CONSTANT coeff38                         : signed(7 DOWNTO 0) := to_signed(-2, 8);
 CONSTANT coeff39                         : signed(7 DOWNTO 0) := to_signed(-2, 8);
 CONSTANT coeff40                         : signed(7 DOWNTO 0) := to_signed(-1, 8);
 CONSTANT coeff41                         : signed(7 DOWNTO 0) := to_signed(0, 8);
 CONSTANT coeff42                         : signed(7 DOWNTO 0) := to_signed(-1, 8);
 CONSTANT coeff43                         : signed(7 DOWNTO 0) := to_signed(-1, 8);
 CONSTANT coeff44                         : signed(7 DOWNTO 0) := to_signed(-1, 8);
 CONSTANT coeff45                         : signed(7 DOWNTO 0) := to_signed(-1, 8);
 
     signal delay_pipeline : delay_pipeline_type(0 to 44);
     
     SIGNAL product0                         : signed(19 DOWNTO 0);
 SIGNAL product1                         : signed(19 DOWNTO 0);
 SIGNAL product2                         : signed(19 DOWNTO 0);
 SIGNAL product3                         : signed(19 DOWNTO 0);
 SIGNAL product4                         : signed(19 DOWNTO 0);
 SIGNAL product5                         : signed(19 DOWNTO 0);
 SIGNAL product6                         : signed(19 DOWNTO 0);
 SIGNAL product7                         : signed(19 DOWNTO 0);
 SIGNAL product8                         : signed(19 DOWNTO 0);
 SIGNAL product9                         : signed(19 DOWNTO 0);
 SIGNAL product10                         : signed(19 DOWNTO 0);
 SIGNAL product11                         : signed(19 DOWNTO 0);
 SIGNAL product12                         : signed(19 DOWNTO 0);
 SIGNAL product13                         : signed(19 DOWNTO 0);
 SIGNAL product14                         : signed(19 DOWNTO 0);
 SIGNAL product15                         : signed(19 DOWNTO 0);
 SIGNAL product16                         : signed(19 DOWNTO 0);
 SIGNAL product17                         : signed(19 DOWNTO 0);
 SIGNAL product18                         : signed(19 DOWNTO 0);
 SIGNAL product19                         : signed(19 DOWNTO 0);
 SIGNAL product20                         : signed(19 DOWNTO 0);
 SIGNAL product21                         : signed(19 DOWNTO 0);
 SIGNAL product22                         : signed(19 DOWNTO 0);
 SIGNAL product23                         : signed(19 DOWNTO 0);
 SIGNAL product24                         : signed(19 DOWNTO 0);
 SIGNAL product25                         : signed(19 DOWNTO 0);
 SIGNAL product26                         : signed(19 DOWNTO 0);
 SIGNAL product27                         : signed(19 DOWNTO 0);
 SIGNAL product28                         : signed(19 DOWNTO 0);
 SIGNAL product29                         : signed(19 DOWNTO 0);
 SIGNAL product30                         : signed(19 DOWNTO 0);
 SIGNAL product31                         : signed(19 DOWNTO 0);
 SIGNAL product32                         : signed(19 DOWNTO 0);
 SIGNAL product33                         : signed(19 DOWNTO 0);
 SIGNAL product34                         : signed(19 DOWNTO 0);
 SIGNAL product35                         : signed(19 DOWNTO 0);
 SIGNAL product36                         : signed(19 DOWNTO 0);
 SIGNAL product37                         : signed(19 DOWNTO 0);
 SIGNAL product38                         : signed(19 DOWNTO 0);
 SIGNAL product39                         : signed(19 DOWNTO 0);
 SIGNAL product40                         : signed(19 DOWNTO 0);
 SIGNAL product41                         : signed(19 DOWNTO 0);
 SIGNAL product42                         : signed(19 DOWNTO 0);
 SIGNAL product43                         : signed(19 DOWNTO 0);
 SIGNAL product44                         : signed(19 DOWNTO 0);
     
     SIGNAL mul_temp                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_1                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_2                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_3                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_4                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_5                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_6                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_7                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_8                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_9                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_10                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_11                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_12                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_13                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_14                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_15                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_16                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_17                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_18                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_19                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_20                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_21                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_22                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_23                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_24                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_25                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_26                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_27                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_28                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_29                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_30                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_31                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_32                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_33                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_34                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_35                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_36                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_37                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_38                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_39                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_40                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_41                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_42                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_43                         : signed(19 DOWNTO 0);
 SIGNAL mul_temp_44                         : signed(19 DOWNTO 0);
     
     SIGNAL sum1                             : signed(20 DOWNTO 0);
 SIGNAL sum2                             : signed(21 DOWNTO 0);
 SIGNAL sum3                             : signed(22 DOWNTO 0);
 SIGNAL sum4                             : signed(23 DOWNTO 0);
 SIGNAL sum5                             : signed(24 DOWNTO 0);
 SIGNAL sum6                             : signed(25 DOWNTO 0);
 SIGNAL sum7                             : signed(26 DOWNTO 0);
 SIGNAL sum8                             : signed(27 DOWNTO 0);
 SIGNAL sum9                             : signed(28 DOWNTO 0);
 SIGNAL sum10                             : signed(29 DOWNTO 0);
 SIGNAL sum11                             : signed(30 DOWNTO 0);
 SIGNAL sum12                             : signed(31 DOWNTO 0);
 SIGNAL sum13                             : signed(32 DOWNTO 0);
 SIGNAL sum14                             : signed(33 DOWNTO 0);
 SIGNAL sum15                             : signed(34 DOWNTO 0);
 SIGNAL sum16                             : signed(35 DOWNTO 0);
 SIGNAL sum17                             : signed(36 DOWNTO 0);
 SIGNAL sum18                             : signed(37 DOWNTO 0);
 SIGNAL sum19                             : signed(38 DOWNTO 0);
 SIGNAL sum20                             : signed(39 DOWNTO 0);
 SIGNAL sum21                             : signed(40 DOWNTO 0);
 SIGNAL sum22                             : signed(41 DOWNTO 0);
 SIGNAL sum23                             : signed(42 DOWNTO 0);
 SIGNAL sum24                             : signed(43 DOWNTO 0);
 SIGNAL sum25                             : signed(44 DOWNTO 0);
 SIGNAL sum26                             : signed(45 DOWNTO 0);
 SIGNAL sum27                             : signed(46 DOWNTO 0);
 SIGNAL sum28                             : signed(47 DOWNTO 0);
 SIGNAL sum29                             : signed(48 DOWNTO 0);
 SIGNAL sum30                             : signed(49 DOWNTO 0);
 SIGNAL sum31                             : signed(50 DOWNTO 0);
 SIGNAL sum32                             : signed(51 DOWNTO 0);
 SIGNAL sum33                             : signed(52 DOWNTO 0);
 SIGNAL sum34                             : signed(53 DOWNTO 0);
 SIGNAL sum35                             : signed(54 DOWNTO 0);
 SIGNAL sum36                             : signed(55 DOWNTO 0);
 SIGNAL sum37                             : signed(56 DOWNTO 0);
 SIGNAL sum38                             : signed(57 DOWNTO 0);
 SIGNAL sum39                             : signed(58 DOWNTO 0);
 SIGNAL sum40                             : signed(59 DOWNTO 0);
 SIGNAL sum41                             : signed(60 DOWNTO 0);
 SIGNAL sum42                             : signed(61 DOWNTO 0);
 SIGNAL sum43                             : signed(62 DOWNTO 0);
 SIGNAL sum44                             : signed(63 DOWNTO 0);
     
     SIGNAL add_temp                             : signed(20 DOWNTO 0);
 SIGNAL add_temp_1                             : signed(21 DOWNTO 0);
 SIGNAL add_temp_2                             : signed(22 DOWNTO 0);
 SIGNAL add_temp_3                             : signed(23 DOWNTO 0);
 SIGNAL add_temp_4                             : signed(24 DOWNTO 0);
 SIGNAL add_temp_5                             : signed(25 DOWNTO 0);
 SIGNAL add_temp_6                             : signed(26 DOWNTO 0);
 SIGNAL add_temp_7                             : signed(27 DOWNTO 0);
 SIGNAL add_temp_8                             : signed(28 DOWNTO 0);
 SIGNAL add_temp_9                             : signed(29 DOWNTO 0);
 SIGNAL add_temp_10                             : signed(30 DOWNTO 0);
 SIGNAL add_temp_11                             : signed(31 DOWNTO 0);
 SIGNAL add_temp_12                             : signed(32 DOWNTO 0);
 SIGNAL add_temp_13                             : signed(33 DOWNTO 0);
 SIGNAL add_temp_14                             : signed(34 DOWNTO 0);
 SIGNAL add_temp_15                             : signed(35 DOWNTO 0);
 SIGNAL add_temp_16                             : signed(36 DOWNTO 0);
 SIGNAL add_temp_17                             : signed(37 DOWNTO 0);
 SIGNAL add_temp_18                             : signed(38 DOWNTO 0);
 SIGNAL add_temp_19                             : signed(39 DOWNTO 0);
 SIGNAL add_temp_20                             : signed(40 DOWNTO 0);
 SIGNAL add_temp_21                             : signed(41 DOWNTO 0);
 SIGNAL add_temp_22                             : signed(42 DOWNTO 0);
 SIGNAL add_temp_23                             : signed(43 DOWNTO 0);
 SIGNAL add_temp_24                             : signed(44 DOWNTO 0);
 SIGNAL add_temp_25                             : signed(45 DOWNTO 0);
 SIGNAL add_temp_26                             : signed(46 DOWNTO 0);
 SIGNAL add_temp_27                             : signed(47 DOWNTO 0);
 SIGNAL add_temp_28                             : signed(48 DOWNTO 0);
 SIGNAL add_temp_29                             : signed(49 DOWNTO 0);
 SIGNAL add_temp_30                             : signed(50 DOWNTO 0);
 SIGNAL add_temp_31                             : signed(51 DOWNTO 0);
 SIGNAL add_temp_32                             : signed(52 DOWNTO 0);
 SIGNAL add_temp_33                             : signed(53 DOWNTO 0);
 SIGNAL add_temp_34                             : signed(54 DOWNTO 0);
 SIGNAL add_temp_35                             : signed(55 DOWNTO 0);
 SIGNAL add_temp_36                             : signed(56 DOWNTO 0);
 SIGNAL add_temp_37                             : signed(57 DOWNTO 0);
 SIGNAL add_temp_38                             : signed(58 DOWNTO 0);
 SIGNAL add_temp_39                             : signed(59 DOWNTO 0);
 SIGNAL add_temp_40                             : signed(60 DOWNTO 0);
 SIGNAL add_temp_41                             : signed(61 DOWNTO 0);
 SIGNAL add_temp_42                             : signed(62 DOWNTO 0);
 SIGNAL add_temp_43                             : signed(63 DOWNTO 0);
     
     SIGNAL output_typeconvert               : signed(63 DOWNTO 0);
     
     SIGNAL output_register               : signed(63 DOWNTO 0);
 
 begin
 
     -- Block Statements
     
   -- Block Statements
   Delay_Pipeline_process : PROCESS (clk, reset)
   BEGIN
     IF reset = '1' THEN
       delay_pipeline(0 TO 44) <= (OTHERS => (OTHERS => '0'));
     ELSIF clk'event AND clk = '1' THEN
       IF clk_enable = '1' THEN
         delay_pipeline(0) <= signed(filter_in);
         delay_pipeline(1 TO 44) <= delay_pipeline(0 TO 43);
       END IF;
     END IF; 
   END PROCESS Delay_Pipeline_process;
   
 
     -- Multiplications
     mul_temp <= delay_pipeline(44) * coeff45; 
 product44 <= resize(mul_temp, 20); 
 
 mul_temp_1 <= delay_pipeline(43) * coeff44; 
 product43 <= resize(mul_temp_1, 20); 
 
 mul_temp_2 <= delay_pipeline(42) * coeff43; 
 product42 <= resize(mul_temp_2, 20); 
 
 mul_temp_3 <= delay_pipeline(41) * coeff42; 
 product41 <= resize(mul_temp_3, 20); 
 
 mul_temp_4 <= delay_pipeline(40) * coeff41; 
 product40 <= resize(mul_temp_4, 20); 
 
 mul_temp_5 <= delay_pipeline(39) * coeff40; 
 product39 <= resize(mul_temp_5, 20); 
 
 mul_temp_6 <= delay_pipeline(38) * coeff39; 
 product38 <= resize(mul_temp_6, 20); 
 
 mul_temp_7 <= delay_pipeline(37) * coeff38; 
 product37 <= resize(mul_temp_7, 20); 
 
 mul_temp_8 <= delay_pipeline(36) * coeff37; 
 product36 <= resize(mul_temp_8, 20); 
 
 mul_temp_9 <= delay_pipeline(35) * coeff36; 
 product35 <= resize(mul_temp_9, 20); 
 
 mul_temp_10 <= delay_pipeline(34) * coeff35; 
 product34 <= resize(mul_temp_10, 20); 
 
 mul_temp_11 <= delay_pipeline(33) * coeff34; 
 product33 <= resize(mul_temp_11, 20); 
 
 mul_temp_12 <= delay_pipeline(32) * coeff33; 
 product32 <= resize(mul_temp_12, 20); 
 
 mul_temp_13 <= delay_pipeline(31) * coeff32; 
 product31 <= resize(mul_temp_13, 20); 
 
 mul_temp_14 <= delay_pipeline(30) * coeff31; 
 product30 <= resize(mul_temp_14, 20); 
 
 mul_temp_15 <= delay_pipeline(29) * coeff30; 
 product29 <= resize(mul_temp_15, 20); 
 
 mul_temp_16 <= delay_pipeline(28) * coeff29; 
 product28 <= resize(mul_temp_16, 20); 
 
 mul_temp_17 <= delay_pipeline(27) * coeff28; 
 product27 <= resize(mul_temp_17, 20); 
 
 mul_temp_18 <= delay_pipeline(26) * coeff27; 
 product26 <= resize(mul_temp_18, 20); 
 
 mul_temp_19 <= delay_pipeline(25) * coeff26; 
 product25 <= resize(mul_temp_19, 20); 
 
 mul_temp_20 <= delay_pipeline(24) * coeff25; 
 product24 <= resize(mul_temp_20, 20); 
 
 mul_temp_21 <= delay_pipeline(23) * coeff24; 
 product23 <= resize(mul_temp_21, 20); 
 
 mul_temp_22 <= delay_pipeline(22) * coeff23; 
 product22 <= resize(mul_temp_22, 20); 
 
 mul_temp_23 <= delay_pipeline(21) * coeff22; 
 product21 <= resize(mul_temp_23, 20); 
 
 mul_temp_24 <= delay_pipeline(20) * coeff21; 
 product20 <= resize(mul_temp_24, 20); 
 
 mul_temp_25 <= delay_pipeline(19) * coeff20; 
 product19 <= resize(mul_temp_25, 20); 
 
 mul_temp_26 <= delay_pipeline(18) * coeff19; 
 product18 <= resize(mul_temp_26, 20); 
 
 mul_temp_27 <= delay_pipeline(17) * coeff18; 
 product17 <= resize(mul_temp_27, 20); 
 
 mul_temp_28 <= delay_pipeline(16) * coeff17; 
 product16 <= resize(mul_temp_28, 20); 
 
 mul_temp_29 <= delay_pipeline(15) * coeff16; 
 product15 <= resize(mul_temp_29, 20); 
 
 mul_temp_30 <= delay_pipeline(14) * coeff15; 
 product14 <= resize(mul_temp_30, 20); 
 
 mul_temp_31 <= delay_pipeline(13) * coeff14; 
 product13 <= resize(mul_temp_31, 20); 
 
 mul_temp_32 <= delay_pipeline(12) * coeff13; 
 product12 <= resize(mul_temp_32, 20); 
 
 mul_temp_33 <= delay_pipeline(11) * coeff12; 
 product11 <= resize(mul_temp_33, 20); 
 
 mul_temp_34 <= delay_pipeline(10) * coeff11; 
 product10 <= resize(mul_temp_34, 20); 
 
 mul_temp_35 <= delay_pipeline(9) * coeff10; 
 product9 <= resize(mul_temp_35, 20); 
 
 mul_temp_36 <= delay_pipeline(8) * coeff9; 
 product8 <= resize(mul_temp_36, 20); 
 
 mul_temp_37 <= delay_pipeline(7) * coeff8; 
 product7 <= resize(mul_temp_37, 20); 
 
 mul_temp_38 <= delay_pipeline(6) * coeff7; 
 product6 <= resize(mul_temp_38, 20); 
 
 mul_temp_39 <= delay_pipeline(5) * coeff6; 
 product5 <= resize(mul_temp_39, 20); 
 
 mul_temp_40 <= delay_pipeline(4) * coeff5; 
 product4 <= resize(mul_temp_40, 20); 
 
 mul_temp_41 <= delay_pipeline(3) * coeff4; 
 product3 <= resize(mul_temp_41, 20); 
 
 mul_temp_42 <= delay_pipeline(2) * coeff3; 
 product2 <= resize(mul_temp_42, 20); 
 
 mul_temp_43 <= delay_pipeline(1) * coeff2; 
 product1 <= resize(mul_temp_43, 20); 
 
 mul_temp_44 <= delay_pipeline(0) * coeff1; 
 product0 <= resize(mul_temp_44, 20); 
 
     
     -- Sums
     add_temp <= resize(product0, 21) + resize(product1, 21); 
 sum1 <= resize(add_temp, 21); 
 
 add_temp_1 <= resize(sum1, 22) + resize(product2, 22); 
 sum2 <= resize(add_temp_1, 22); 
 
 add_temp_2 <= resize(sum2, 23) + resize(product3, 23); 
 sum3 <= resize(add_temp_2, 23); 
 
 add_temp_3 <= resize(sum3, 24) + resize(product4, 24); 
 sum4 <= resize(add_temp_3, 24); 
 
 add_temp_4 <= resize(sum4, 25) + resize(product5, 25); 
 sum5 <= resize(add_temp_4, 25); 
 
 add_temp_5 <= resize(sum5, 26) + resize(product6, 26); 
 sum6 <= resize(add_temp_5, 26); 
 
 add_temp_6 <= resize(sum6, 27) + resize(product7, 27); 
 sum7 <= resize(add_temp_6, 27); 
 
 add_temp_7 <= resize(sum7, 28) + resize(product8, 28); 
 sum8 <= resize(add_temp_7, 28); 
 
 add_temp_8 <= resize(sum8, 29) + resize(product9, 29); 
 sum9 <= resize(add_temp_8, 29); 
 
 add_temp_9 <= resize(sum9, 30) + resize(product10, 30); 
 sum10 <= resize(add_temp_9, 30); 
 
 add_temp_10 <= resize(sum10, 31) + resize(product11, 31); 
 sum11 <= resize(add_temp_10, 31); 
 
 add_temp_11 <= resize(sum11, 32) + resize(product12, 32); 
 sum12 <= resize(add_temp_11, 32); 
 
 add_temp_12 <= resize(sum12, 33) + resize(product13, 33); 
 sum13 <= resize(add_temp_12, 33); 
 
 add_temp_13 <= resize(sum13, 34) + resize(product14, 34); 
 sum14 <= resize(add_temp_13, 34); 
 
 add_temp_14 <= resize(sum14, 35) + resize(product15, 35); 
 sum15 <= resize(add_temp_14, 35); 
 
 add_temp_15 <= resize(sum15, 36) + resize(product16, 36); 
 sum16 <= resize(add_temp_15, 36); 
 
 add_temp_16 <= resize(sum16, 37) + resize(product17, 37); 
 sum17 <= resize(add_temp_16, 37); 
 
 add_temp_17 <= resize(sum17, 38) + resize(product18, 38); 
 sum18 <= resize(add_temp_17, 38); 
 
 add_temp_18 <= resize(sum18, 39) + resize(product19, 39); 
 sum19 <= resize(add_temp_18, 39); 
 
 add_temp_19 <= resize(sum19, 40) + resize(product20, 40); 
 sum20 <= resize(add_temp_19, 40); 
 
 add_temp_20 <= resize(sum20, 41) + resize(product21, 41); 
 sum21 <= resize(add_temp_20, 41); 
 
 add_temp_21 <= resize(sum21, 42) + resize(product22, 42); 
 sum22 <= resize(add_temp_21, 42); 
 
 add_temp_22 <= resize(sum22, 43) + resize(product23, 43); 
 sum23 <= resize(add_temp_22, 43); 
 
 add_temp_23 <= resize(sum23, 44) + resize(product24, 44); 
 sum24 <= resize(add_temp_23, 44); 
 
 add_temp_24 <= resize(sum24, 45) + resize(product25, 45); 
 sum25 <= resize(add_temp_24, 45); 
 
 add_temp_25 <= resize(sum25, 46) + resize(product26, 46); 
 sum26 <= resize(add_temp_25, 46); 
 
 add_temp_26 <= resize(sum26, 47) + resize(product27, 47); 
 sum27 <= resize(add_temp_26, 47); 
 
 add_temp_27 <= resize(sum27, 48) + resize(product28, 48); 
 sum28 <= resize(add_temp_27, 48); 
 
 add_temp_28 <= resize(sum28, 49) + resize(product29, 49); 
 sum29 <= resize(add_temp_28, 49); 
 
 add_temp_29 <= resize(sum29, 50) + resize(product30, 50); 
 sum30 <= resize(add_temp_29, 50); 
 
 add_temp_30 <= resize(sum30, 51) + resize(product31, 51); 
 sum31 <= resize(add_temp_30, 51); 
 
 add_temp_31 <= resize(sum31, 52) + resize(product32, 52); 
 sum32 <= resize(add_temp_31, 52); 
 
 add_temp_32 <= resize(sum32, 53) + resize(product33, 53); 
 sum33 <= resize(add_temp_32, 53); 
 
 add_temp_33 <= resize(sum33, 54) + resize(product34, 54); 
 sum34 <= resize(add_temp_33, 54); 
 
 add_temp_34 <= resize(sum34, 55) + resize(product35, 55); 
 sum35 <= resize(add_temp_34, 55); 
 
 add_temp_35 <= resize(sum35, 56) + resize(product36, 56); 
 sum36 <= resize(add_temp_35, 56); 
 
 add_temp_36 <= resize(sum36, 57) + resize(product37, 57); 
 sum37 <= resize(add_temp_36, 57); 
 
 add_temp_37 <= resize(sum37, 58) + resize(product38, 58); 
 sum38 <= resize(add_temp_37, 58); 
 
 add_temp_38 <= resize(sum38, 59) + resize(product39, 59); 
 sum39 <= resize(add_temp_38, 59); 
 
 add_temp_39 <= resize(sum39, 60) + resize(product40, 60); 
 sum40 <= resize(add_temp_39, 60); 
 
 add_temp_40 <= resize(sum40, 61) + resize(product41, 61); 
 sum41 <= resize(add_temp_40, 61); 
 
 add_temp_41 <= resize(sum41, 62) + resize(product42, 62); 
 sum42 <= resize(add_temp_41, 62); 
 
 add_temp_42 <= resize(sum42, 63) + resize(product43, 63); 
 sum43 <= resize(add_temp_42, 63); 
 
 add_temp_43 <= resize(sum43, 64) + resize(product44, 64); 
 sum44 <= resize(add_temp_43, 64); 
 
 
     -- Output
     output_typeconvert <= sum44;
 
     -- Output Process
     
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
 
     filter_out <= resize(output_register/180,12);--std_logic_vector(output_register);
 
 end rtl;
