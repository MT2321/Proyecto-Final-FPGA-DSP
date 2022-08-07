-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "08/07/2022 18:31:47"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	TP_Final_DSP_FPGA IS
    PORT (
	q : OUT std_logic_vector(11 DOWNTO 0);
	wrreq : IN std_logic;
	rdreq : IN std_logic;
	clock : IN std_logic;
	aclr : IN std_logic;
	DATA : IN std_logic_vector(11 DOWNTO 0)
	);
END TP_Final_DSP_FPGA;

-- Design Ports Information
-- q[11]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[10]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[9]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[8]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[7]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[6]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[5]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[4]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[3]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[2]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[1]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[0]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wrreq	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdreq	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[11]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[10]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[9]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[8]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[7]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[6]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[5]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[4]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[3]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[2]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[1]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[0]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- aclr	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF TP_Final_DSP_FPGA IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_q : std_logic_vector(11 DOWNTO 0);
SIGNAL ww_wrreq : std_logic;
SIGNAL ww_rdreq : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_aclr : std_logic;
SIGNAL ww_DATA : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10_PORTBDATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8_PORTBDATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBDATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBDATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBDATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \aclr~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \q[11]~output_o\ : std_logic;
SIGNAL \q[10]~output_o\ : std_logic;
SIGNAL \q[9]~output_o\ : std_logic;
SIGNAL \q[8]~output_o\ : std_logic;
SIGNAL \q[7]~output_o\ : std_logic;
SIGNAL \q[6]~output_o\ : std_logic;
SIGNAL \q[5]~output_o\ : std_logic;
SIGNAL \q[4]~output_o\ : std_logic;
SIGNAL \q[3]~output_o\ : std_logic;
SIGNAL \q[2]~output_o\ : std_logic;
SIGNAL \q[1]~output_o\ : std_logic;
SIGNAL \q[0]~output_o\ : std_logic;
SIGNAL \wrreq~input_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~combout\ : std_logic;
SIGNAL \aclr~input_o\ : std_logic;
SIGNAL \aclr~inputclkctrl_outclk\ : std_logic;
SIGNAL \rdreq~input_o\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita11~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~3_combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~4_combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~3_combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~4_combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\ : std_logic;
SIGNAL \DATA[10]~input_o\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita11~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~combout\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~COUT\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita11~combout\ : std_logic;
SIGNAL \DATA[11]~input_o\ : std_logic;
SIGNAL \DATA[8]~input_o\ : std_logic;
SIGNAL \DATA[9]~input_o\ : std_logic;
SIGNAL \DATA[6]~input_o\ : std_logic;
SIGNAL \DATA[7]~input_o\ : std_logic;
SIGNAL \DATA[4]~input_o\ : std_logic;
SIGNAL \DATA[5]~input_o\ : std_logic;
SIGNAL \DATA[2]~input_o\ : std_logic;
SIGNAL \DATA[3]~input_o\ : std_logic;
SIGNAL \DATA[0]~input_o\ : std_logic;
SIGNAL \DATA[1]~input_o\ : std_logic;
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \ALT_INV_aclr~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

q <= ww_q;
ww_wrreq <= wrreq;
ww_rdreq <= rdreq;
ww_clock <= clock;
ww_aclr <= aclr;
ww_DATA <= DATA;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10_PORTADATAIN_bus\ <= (\DATA[11]~input_o\ & \DATA[10]~input_o\);

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10_PORTAADDR_bus\ <= (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10_PORTBADDR_bus\ <= (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(10) <= \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10_PORTBDATAOUT_bus\(0);
\inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(11) <= \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10_PORTBDATAOUT_bus\(1);

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8_PORTADATAIN_bus\ <= (\DATA[9]~input_o\ & \DATA[8]~input_o\);

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8_PORTAADDR_bus\ <= (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8_PORTBADDR_bus\ <= (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(8) <= \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8_PORTBDATAOUT_bus\(0);
\inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(9) <= \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8_PORTBDATAOUT_bus\(1);

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTADATAIN_bus\ <= (\DATA[7]~input_o\ & \DATA[6]~input_o\);

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTAADDR_bus\ <= (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBADDR_bus\ <= (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(6) <= \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBDATAOUT_bus\(0);
\inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(7) <= \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBDATAOUT_bus\(1);

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTADATAIN_bus\ <= (\DATA[5]~input_o\ & \DATA[4]~input_o\);

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTAADDR_bus\ <= (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBADDR_bus\ <= (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(4) <= \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBDATAOUT_bus\(0);
\inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(5) <= \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBDATAOUT_bus\(1);

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTADATAIN_bus\ <= (\DATA[3]~input_o\ & \DATA[2]~input_o\);

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTAADDR_bus\ <= (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBADDR_bus\ <= (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(2) <= \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBDATAOUT_bus\(0);
\inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(3) <= \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBDATAOUT_bus\(1);

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\ <= (\DATA[1]~input_o\ & \DATA[0]~input_o\);

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\ <= (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & 
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\ <= (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & 
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

\inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(0) <= \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(0);
\inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(1) <= \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(1);

\aclr~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \aclr~input_o\);

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);
\ALT_INV_aclr~inputclkctrl_outclk\ <= NOT \aclr~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X20_Y34_N9
\q[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(11),
	devoe => ww_devoe,
	o => \q[11]~output_o\);

-- Location: IOOBUF_X16_Y34_N2
\q[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(10),
	devoe => ww_devoe,
	o => \q[10]~output_o\);

-- Location: IOOBUF_X29_Y34_N16
\q[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(9),
	devoe => ww_devoe,
	o => \q[9]~output_o\);

-- Location: IOOBUF_X18_Y34_N2
\q[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(8),
	devoe => ww_devoe,
	o => \q[8]~output_o\);

-- Location: IOOBUF_X43_Y34_N16
\q[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(7),
	devoe => ww_devoe,
	o => \q[7]~output_o\);

-- Location: IOOBUF_X38_Y34_N16
\q[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(6),
	devoe => ww_devoe,
	o => \q[6]~output_o\);

-- Location: IOOBUF_X14_Y34_N16
\q[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(5),
	devoe => ww_devoe,
	o => \q[5]~output_o\);

-- Location: IOOBUF_X43_Y34_N23
\q[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(4),
	devoe => ww_devoe,
	o => \q[4]~output_o\);

-- Location: IOOBUF_X16_Y34_N9
\q[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(3),
	devoe => ww_devoe,
	o => \q[3]~output_o\);

-- Location: IOOBUF_X31_Y34_N2
\q[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(2),
	devoe => ww_devoe,
	o => \q[2]~output_o\);

-- Location: IOOBUF_X31_Y34_N9
\q[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(1),
	devoe => ww_devoe,
	o => \q[1]~output_o\);

-- Location: IOOBUF_X34_Y34_N16
\q[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(0),
	devoe => ww_devoe,
	o => \q[0]~output_o\);

-- Location: IOIBUF_X0_Y16_N22
\wrreq~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wrreq,
	o => \wrreq~input_o\);

-- Location: IOIBUF_X0_Y16_N8
\clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G2
\clock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: LCCOMB_X30_Y30_N8
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~combout\ = \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0) $ (((VCC) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)))
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ = CARRY(\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ $ 
-- (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110011001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0),
	datad => VCC,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\);

-- Location: IOIBUF_X0_Y16_N15
\aclr~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_aclr,
	o => \aclr~input_o\);

-- Location: CLKCTRL_G4
\aclr~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \aclr~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \aclr~inputclkctrl_outclk\);

-- Location: IOIBUF_X23_Y34_N22
\rdreq~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdreq,
	o => \rdreq~input_o\);

-- Location: LCCOMB_X30_Y30_N10
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1) $ (((\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\) # (VCC))))) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ & (((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1)) # (GND))))
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ $ 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1))) # (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\);

-- Location: FF_X30_Y30_N11
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1));

-- Location: LCCOMB_X30_Y30_N12
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ & 
-- (((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2) & VCC)))) # (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2) $ (((VCC) # (!\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)))))
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ $ (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\);

-- Location: FF_X30_Y30_N13
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2));

-- Location: LCCOMB_X30_Y30_N14
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3) $ (((\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\) # (VCC))))) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ & (((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3)) # (GND))))
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ $ 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3))) # (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\);

-- Location: FF_X30_Y30_N15
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3));

-- Location: LCCOMB_X30_Y30_N16
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ & 
-- (((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4) & VCC)))) # (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4) $ (((VCC) # (!\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)))))
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ $ (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\);

-- Location: FF_X30_Y30_N17
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4));

-- Location: LCCOMB_X30_Y30_N18
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5) $ (((\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\) # (VCC))))) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ & (((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5)) # (GND))))
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ $ 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5))) # (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\);

-- Location: FF_X30_Y30_N19
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5));

-- Location: LCCOMB_X30_Y30_N20
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ & 
-- (((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6) & VCC)))) # (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6) $ (((VCC) # (!\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)))))
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ $ (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\);

-- Location: FF_X30_Y30_N21
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6));

-- Location: LCCOMB_X30_Y30_N22
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7) $ (((\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\) # (VCC))))) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\ & ((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7)) # ((GND))))
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7) $ 
-- (\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)) # (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7),
	datab => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\);

-- Location: FF_X30_Y30_N23
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7));

-- Location: LCCOMB_X30_Y30_N24
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ & 
-- (((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8) & VCC)))) # (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8) $ (((VCC) # (!\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)))))
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ $ (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\);

-- Location: FF_X30_Y30_N25
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8));

-- Location: LCCOMB_X30_Y30_N2
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7)) # 
-- ((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8)) # ((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6)) # 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7),
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8),
	datac => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6),
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5),
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\);

-- Location: LCCOMB_X30_Y30_N26
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9) $ (((\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\) # (VCC))))) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\ & ((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9)) # ((GND))))
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9) $ 
-- (\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)) # (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9),
	datab => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\);

-- Location: FF_X30_Y30_N27
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9));

-- Location: LCCOMB_X30_Y30_N28
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\ & 
-- (((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10) & VCC)))) # (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10) $ (((VCC) # (!\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)))))
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\ & 
-- (\inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ $ (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~COUT\);

-- Location: FF_X30_Y30_N29
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10));

-- Location: LCCOMB_X30_Y30_N30
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita11~combout\ = \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~COUT\ $ 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11),
	cin => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita11~combout\);

-- Location: FF_X30_Y30_N31
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita11~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11));

-- Location: LCCOMB_X29_Y30_N30
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\ = ((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9)) # 
-- ((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11)) # (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10)))) # (!\rdreq~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rdreq~input_o\,
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9),
	datac => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11),
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10),
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\);

-- Location: LCCOMB_X29_Y30_N0
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3)) # 
-- ((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1)) # ((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2)) # 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3),
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1),
	datac => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2),
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4),
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\);

-- Location: LCCOMB_X29_Y30_N6
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~3_combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\) # (((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\) # 
-- (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\)) # (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\,
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0),
	datac => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\,
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~3_combout\);

-- Location: LCCOMB_X29_Y30_N20
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~4_combout\ = (\wrreq~input_o\) # ((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\) # ((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ & 
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wrreq~input_o\,
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\,
	datac => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\,
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~3_combout\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~4_combout\);

-- Location: FF_X29_Y30_N21
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~4_combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\);

-- Location: LCCOMB_X29_Y30_N16
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\ = (\rdreq~input_o\ & (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ $ (((\wrreq~input_o\ & 
-- !\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\))))) # (!\rdreq~input_o\ & (\wrreq~input_o\ & (!\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rdreq~input_o\,
	datab => \wrreq~input_o\,
	datac => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\,
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\);

-- Location: FF_X30_Y30_N9
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0));

-- Location: LCCOMB_X29_Y30_N28
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6) & (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5) 
-- & (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3) & \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6),
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5),
	datac => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3),
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4),
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\);

-- Location: LCCOMB_X29_Y30_N14
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0) & (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2) 
-- & (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1) & \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0),
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2),
	datac => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1),
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\);

-- Location: LCCOMB_X30_Y30_N4
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9) & (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8) 
-- & (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7) & \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9),
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8),
	datac => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7),
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10),
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\);

-- Location: LCCOMB_X29_Y30_N24
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~3_combout\ = (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11) & (\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ & 
-- (\wrreq~input_o\ & \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11),
	datab => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\,
	datac => \wrreq~input_o\,
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~3_combout\);

-- Location: LCCOMB_X30_Y30_N0
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~4_combout\ = (!\rdreq~input_o\ & ((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\) # ((\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\ & 
-- \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\,
	datab => \rdreq~input_o\,
	datac => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\,
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~3_combout\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~4_combout\);

-- Location: FF_X30_Y30_N1
\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~4_combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\);

-- Location: LCCOMB_X30_Y30_N6
\inst|scfifo_component|auto_generated|dpfifo|valid_wreq\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ = (\wrreq~input_o\ & !\inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wrreq~input_o\,
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\);

-- Location: LCCOMB_X29_Y30_N10
\inst|scfifo_component|auto_generated|dpfifo|valid_rreq\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\ = (\rdreq~input_o\ & \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rdreq~input_o\,
	datad => \inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\);

-- Location: IOIBUF_X20_Y34_N22
\DATA[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(10),
	o => \DATA[10]~input_o\);

-- Location: LCCOMB_X31_Y30_N2
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\ = \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0) $ (VCC)
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\ = CARRY(\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0),
	datad => VCC,
	combout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\);

-- Location: FF_X31_Y30_N3
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

-- Location: LCCOMB_X31_Y30_N4
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\)) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & ((\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\) # (GND)))
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\) # (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\);

-- Location: FF_X31_Y30_N5
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1));

-- Location: LCCOMB_X31_Y30_N6
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ $ (GND))) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ & VCC))
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & !\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\);

-- Location: FF_X31_Y30_N7
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2));

-- Location: LCCOMB_X31_Y30_N8
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\)) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & ((\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\) # (GND)))
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\) # (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\);

-- Location: FF_X31_Y30_N9
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3));

-- Location: LCCOMB_X31_Y30_N10
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ $ (GND))) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ & VCC))
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & !\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\);

-- Location: FF_X31_Y30_N11
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4));

-- Location: LCCOMB_X31_Y30_N12
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\)) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & ((\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\) # (GND)))
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\) # (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\);

-- Location: FF_X31_Y30_N13
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5));

-- Location: LCCOMB_X31_Y30_N14
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ $ (GND))) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ & VCC))
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & !\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\);

-- Location: FF_X31_Y30_N15
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6));

-- Location: LCCOMB_X31_Y30_N16
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\)) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & ((\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\) # (GND)))
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\) # (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\);

-- Location: FF_X31_Y30_N17
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7));

-- Location: LCCOMB_X31_Y30_N18
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\ $ (GND))) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\ & VCC))
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & !\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\);

-- Location: FF_X31_Y30_N19
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8));

-- Location: LCCOMB_X31_Y30_N20
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\)) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & ((\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\) # (GND)))
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\) # (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\);

-- Location: FF_X31_Y30_N21
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9));

-- Location: LCCOMB_X31_Y30_N22
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\ $ (GND))) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & (!\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\ & VCC))
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & !\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~COUT\);

-- Location: FF_X31_Y30_N23
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10));

-- Location: LCCOMB_X31_Y30_N24
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita11~combout\ = \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~COUT\ $ (\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11),
	cin => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita11~combout\);

-- Location: FF_X31_Y30_N25
\inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita11~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11));

-- Location: LCCOMB_X28_Y30_N2
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~combout\ = \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0) $ (VCC)
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\ = CARRY(\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0),
	datad => VCC,
	combout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\);

-- Location: FF_X28_Y30_N3
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

-- Location: LCCOMB_X28_Y30_N4
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\)) 
-- # (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & ((\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\) # (GND)))
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\);

-- Location: FF_X28_Y30_N5
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1));

-- Location: LCCOMB_X28_Y30_N6
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ $ 
-- (GND))) # (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ & VCC))
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & 
-- !\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\);

-- Location: FF_X28_Y30_N7
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2));

-- Location: LCCOMB_X28_Y30_N8
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\)) 
-- # (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & ((\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\) # (GND)))
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\);

-- Location: FF_X28_Y30_N9
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3));

-- Location: LCCOMB_X28_Y30_N10
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ $ 
-- (GND))) # (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ & VCC))
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & 
-- !\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\);

-- Location: FF_X28_Y30_N11
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4));

-- Location: LCCOMB_X28_Y30_N12
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\)) 
-- # (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & ((\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\) # (GND)))
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\);

-- Location: FF_X28_Y30_N13
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5));

-- Location: LCCOMB_X28_Y30_N14
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ $ 
-- (GND))) # (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ & VCC))
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & 
-- !\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\);

-- Location: FF_X28_Y30_N15
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6));

-- Location: LCCOMB_X28_Y30_N16
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\)) 
-- # (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & ((\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\) # (GND)))
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\);

-- Location: FF_X28_Y30_N17
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7));

-- Location: LCCOMB_X28_Y30_N18
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\ $ 
-- (GND))) # (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\ & VCC))
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & 
-- !\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\);

-- Location: FF_X28_Y30_N19
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8));

-- Location: LCCOMB_X28_Y30_N20
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\)) 
-- # (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & ((\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\) # (GND)))
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\ = CARRY((!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\) # 
-- (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\);

-- Location: FF_X28_Y30_N21
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9));

-- Location: LCCOMB_X28_Y30_N22
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~combout\ = (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\ 
-- $ (GND))) # (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & (!\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\ & VCC))
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~COUT\ = CARRY((\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & 
-- !\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10),
	datad => VCC,
	cin => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~combout\,
	cout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~COUT\);

-- Location: FF_X28_Y30_N23
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10));

-- Location: LCCOMB_X28_Y30_N24
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita11~combout\ = \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~COUT\ $ (\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11),
	cin => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~COUT\,
	combout => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita11~combout\);

-- Location: FF_X28_Y30_N25
\inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita11~combout\,
	clrn => \ALT_INV_aclr~inputclkctrl_outclk\,
	ena => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11));

-- Location: IOIBUF_X9_Y34_N8
\DATA[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(11),
	o => \DATA[11]~input_o\);

-- Location: M9K_X33_Y29_N0
\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "ADC_FIFO:inst|scfifo:scfifo_component|scfifo_hl21:auto_generated|a_dpfifo_or21:dpfifo|altsyncram_ktm1:FIFOram|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 12,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 2,
	port_b_first_address => 0,
	port_b_first_bit_number => 10,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 12,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	portbre => VCC,
	clk0 => \clock~inputclkctrl_outclk\,
	clk1 => \clock~inputclkctrl_outclk\,
	ena0 => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	ena1 => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	portadatain => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10_PORTADATAIN_bus\,
	portaaddr => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10_PORTAADDR_bus\,
	portbaddr => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a10_PORTBDATAOUT_bus\);

-- Location: IOIBUF_X14_Y34_N22
\DATA[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(8),
	o => \DATA[8]~input_o\);

-- Location: IOIBUF_X18_Y34_N22
\DATA[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(9),
	o => \DATA[9]~input_o\);

-- Location: M9K_X33_Y32_N0
\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "ADC_FIFO:inst|scfifo:scfifo_component|scfifo_hl21:auto_generated|a_dpfifo_or21:dpfifo|altsyncram_ktm1:FIFOram|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 12,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 2,
	port_b_first_address => 0,
	port_b_first_bit_number => 8,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 12,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	portbre => VCC,
	clk0 => \clock~inputclkctrl_outclk\,
	clk1 => \clock~inputclkctrl_outclk\,
	ena0 => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	ena1 => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	portadatain => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8_PORTADATAIN_bus\,
	portaaddr => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8_PORTAADDR_bus\,
	portbaddr => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a8_PORTBDATAOUT_bus\);

-- Location: IOIBUF_X34_Y34_N1
\DATA[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(6),
	o => \DATA[6]~input_o\);

-- Location: IOIBUF_X38_Y34_N1
\DATA[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(7),
	o => \DATA[7]~input_o\);

-- Location: M9K_X33_Y28_N0
\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "ADC_FIFO:inst|scfifo:scfifo_component|scfifo_hl21:auto_generated|a_dpfifo_or21:dpfifo|altsyncram_ktm1:FIFOram|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 12,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 2,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 12,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	portbre => VCC,
	clk0 => \clock~inputclkctrl_outclk\,
	clk1 => \clock~inputclkctrl_outclk\,
	ena0 => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	ena1 => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	portadatain => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTAADDR_bus\,
	portbaddr => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBDATAOUT_bus\);

-- Location: IOIBUF_X16_Y34_N15
\DATA[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(4),
	o => \DATA[4]~input_o\);

-- Location: IOIBUF_X20_Y34_N15
\DATA[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(5),
	o => \DATA[5]~input_o\);

-- Location: M9K_X22_Y30_N0
\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "ADC_FIFO:inst|scfifo:scfifo_component|scfifo_hl21:auto_generated|a_dpfifo_or21:dpfifo|altsyncram_ktm1:FIFOram|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 12,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 2,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 12,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	portbre => VCC,
	clk0 => \clock~inputclkctrl_outclk\,
	clk1 => \clock~inputclkctrl_outclk\,
	ena0 => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	ena1 => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	portadatain => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBDATAOUT_bus\);

-- Location: IOIBUF_X23_Y34_N15
\DATA[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(2),
	o => \DATA[2]~input_o\);

-- Location: IOIBUF_X40_Y34_N8
\DATA[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(3),
	o => \DATA[3]~input_o\);

-- Location: M9K_X33_Y30_N0
\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "ADC_FIFO:inst|scfifo:scfifo_component|scfifo_hl21:auto_generated|a_dpfifo_or21:dpfifo|altsyncram_ktm1:FIFOram|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 12,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 2,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 12,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	portbre => VCC,
	clk0 => \clock~inputclkctrl_outclk\,
	clk1 => \clock~inputclkctrl_outclk\,
	ena0 => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	ena1 => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	portadatain => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTAADDR_bus\,
	portbaddr => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBDATAOUT_bus\);

-- Location: IOIBUF_X34_Y34_N8
\DATA[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(0),
	o => \DATA[0]~input_o\);

-- Location: IOIBUF_X40_Y34_N1
\DATA[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(1),
	o => \DATA[1]~input_o\);

-- Location: M9K_X33_Y31_N0
\inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "ADC_FIFO:inst|scfifo:scfifo_component|scfifo_hl21:auto_generated|a_dpfifo_or21:dpfifo|altsyncram_ktm1:FIFOram|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 12,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 2,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 12,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	portbre => VCC,
	clk0 => \clock~inputclkctrl_outclk\,
	clk1 => \clock~inputclkctrl_outclk\,
	ena0 => \inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	ena1 => \inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	portadatain => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\);

ww_q(11) <= \q[11]~output_o\;

ww_q(10) <= \q[10]~output_o\;

ww_q(9) <= \q[9]~output_o\;

ww_q(8) <= \q[8]~output_o\;

ww_q(7) <= \q[7]~output_o\;

ww_q(6) <= \q[6]~output_o\;

ww_q(5) <= \q[5]~output_o\;

ww_q(4) <= \q[4]~output_o\;

ww_q(3) <= \q[3]~output_o\;

ww_q(2) <= \q[2]~output_o\;

ww_q(1) <= \q[1]~output_o\;

ww_q(0) <= \q[0]~output_o\;
END structure;


