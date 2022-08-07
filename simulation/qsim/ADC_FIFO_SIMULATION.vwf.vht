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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "08/07/2022 18:31:47"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          TP_Final_DSP_FPGA
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY TP_Final_DSP_FPGA_vhd_vec_tst IS
END TP_Final_DSP_FPGA_vhd_vec_tst;
ARCHITECTURE TP_Final_DSP_FPGA_arch OF TP_Final_DSP_FPGA_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL aclr : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL DATA : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL q : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL rdreq : STD_LOGIC;
SIGNAL wrreq : STD_LOGIC;
COMPONENT TP_Final_DSP_FPGA
	PORT (
	aclr : IN STD_LOGIC;
	clock : IN STD_LOGIC;
	DATA : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
	q : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
	rdreq : IN STD_LOGIC;
	wrreq : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : TP_Final_DSP_FPGA
	PORT MAP (
-- list connections between master ports and signals
	aclr => aclr,
	clock => clock,
	DATA => DATA,
	q => q,
	rdreq => rdreq,
	wrreq => wrreq
	);
-- DATA[11]
t_prcs_DATA_11: PROCESS
BEGIN
	DATA(11) <= '0';
WAIT;
END PROCESS t_prcs_DATA_11;
-- DATA[10]
t_prcs_DATA_10: PROCESS
BEGIN
	DATA(10) <= '1';
	WAIT FOR 30000 ps;
	DATA(10) <= '0';
WAIT;
END PROCESS t_prcs_DATA_10;
-- DATA[9]
t_prcs_DATA_9: PROCESS
BEGIN
	DATA(9) <= '0';
WAIT;
END PROCESS t_prcs_DATA_9;
-- DATA[8]
t_prcs_DATA_8: PROCESS
BEGIN
	DATA(8) <= '0';
WAIT;
END PROCESS t_prcs_DATA_8;
-- DATA[7]
t_prcs_DATA_7: PROCESS
BEGIN
	DATA(7) <= '0';
WAIT;
END PROCESS t_prcs_DATA_7;
-- DATA[6]
t_prcs_DATA_6: PROCESS
BEGIN
	DATA(6) <= '1';
	WAIT FOR 30000 ps;
	DATA(6) <= '0';
WAIT;
END PROCESS t_prcs_DATA_6;
-- DATA[5]
t_prcs_DATA_5: PROCESS
BEGIN
	DATA(5) <= '0';
	WAIT FOR 960000 ps;
	DATA(5) <= '1';
WAIT;
END PROCESS t_prcs_DATA_5;
-- DATA[4]
t_prcs_DATA_4: PROCESS
BEGIN
	DATA(4) <= '1';
	WAIT FOR 30000 ps;
	DATA(4) <= '0';
	WAIT FOR 450000 ps;
	DATA(4) <= '1';
	WAIT FOR 480000 ps;
	DATA(4) <= '0';
WAIT;
END PROCESS t_prcs_DATA_4;
-- DATA[3]
t_prcs_DATA_3: PROCESS
BEGIN
	DATA(3) <= '0';
	WAIT FOR 240000 ps;
	DATA(3) <= '1';
	WAIT FOR 240000 ps;
	DATA(3) <= '0';
	WAIT FOR 240000 ps;
	DATA(3) <= '1';
	WAIT FOR 240000 ps;
	DATA(3) <= '0';
WAIT;
END PROCESS t_prcs_DATA_3;
-- DATA[2]
t_prcs_DATA_2: PROCESS
BEGIN
	DATA(2) <= '1';
	WAIT FOR 30000 ps;
	DATA(2) <= '0';
	WAIT FOR 90000 ps;
	DATA(2) <= '1';
	WAIT FOR 120000 ps;
	FOR i IN 1 TO 3
	LOOP
		DATA(2) <= '0';
		WAIT FOR 120000 ps;
		DATA(2) <= '1';
		WAIT FOR 120000 ps;
	END LOOP;
	DATA(2) <= '0';
WAIT;
END PROCESS t_prcs_DATA_2;
-- DATA[1]
t_prcs_DATA_1: PROCESS
BEGIN
	DATA(1) <= '1';
	WAIT FOR 30000 ps;
	DATA(1) <= '0';
	WAIT FOR 30000 ps;
	DATA(1) <= '1';
	WAIT FOR 60000 ps;
	FOR i IN 1 TO 7
	LOOP
		DATA(1) <= '0';
		WAIT FOR 60000 ps;
		DATA(1) <= '1';
		WAIT FOR 60000 ps;
	END LOOP;
	DATA(1) <= '0';
WAIT;
END PROCESS t_prcs_DATA_1;
-- DATA[0]
t_prcs_DATA_0: PROCESS
BEGIN
	DATA(0) <= '1';
	WAIT FOR 60000 ps;
	DATA(0) <= '0';
	WAIT FOR 30000 ps;
	DATA(0) <= '1';
	WAIT FOR 30000 ps;
	FOR i IN 1 TO 14
	LOOP
		DATA(0) <= '0';
		WAIT FOR 30000 ps;
		DATA(0) <= '1';
		WAIT FOR 30000 ps;
	END LOOP;
	DATA(0) <= '0';
	WAIT FOR 30000 ps;
	DATA(0) <= '1';
WAIT;
END PROCESS t_prcs_DATA_0;

-- rdreq
t_prcs_rdreq: PROCESS
BEGIN
	rdreq <= '0';
	WAIT FOR 530000 ps;
	rdreq <= '1';
	WAIT FOR 460000 ps;
	rdreq <= '0';
WAIT;
END PROCESS t_prcs_rdreq;

-- wrreq
t_prcs_wrreq: PROCESS
BEGIN
	wrreq <= '1';
	WAIT FOR 500000 ps;
	wrreq <= '0';
WAIT;
END PROCESS t_prcs_wrreq;

-- clock
t_prcs_clock: PROCESS
BEGIN
	FOR i IN 1 TO 33
	LOOP
		clock <= '0';
		WAIT FOR 15000 ps;
		clock <= '1';
		WAIT FOR 15000 ps;
	END LOOP;
	clock <= '0';
WAIT;
END PROCESS t_prcs_clock;

-- aclr
t_prcs_aclr: PROCESS
BEGIN
	aclr <= '0';
WAIT;
END PROCESS t_prcs_aclr;
END TP_Final_DSP_FPGA_arch;
