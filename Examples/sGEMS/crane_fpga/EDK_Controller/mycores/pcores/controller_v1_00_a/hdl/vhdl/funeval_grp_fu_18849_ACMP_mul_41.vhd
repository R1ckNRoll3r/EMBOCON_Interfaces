-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2012.2
-- Copyright (C) 2012 Xilinx Inc. All rights reserved.
-- 
-- ==============================================================

Library IEEE;
use IEEE.std_logic_1164.all;
Library work;
use work.all;
use work.AESL_components.all;

entity funeval_grp_fu_18849_ACMP_mul_41 is
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER);
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        ce : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR(din0_WIDTH - 1 DOWNTO 0);
        din1 : IN STD_LOGIC_VECTOR(din1_WIDTH - 1 DOWNTO 0);
        dout : OUT STD_LOGIC_VECTOR(dout_WIDTH - 1 DOWNTO 0));
end entity;

architecture arch of funeval_grp_fu_18849_ACMP_mul_41 is
    component ACMP_mul_ss is
        generic (
            ID : INTEGER;
            NUM_STAGE : INTEGER;
            din0_WIDTH : INTEGER;
            din1_WIDTH : INTEGER;
            dout_WIDTH : INTEGER);
        port (
            clk : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            ce : IN STD_LOGIC;
            din0 : IN STD_LOGIC_VECTOR(din0_WIDTH - 1 DOWNTO 0);
            din1 : IN STD_LOGIC_VECTOR(din1_WIDTH - 1 DOWNTO 0);
            dout : OUT STD_LOGIC_VECTOR(dout_WIDTH - 1 DOWNTO 0));
    end component;



begin
    ACMP_mul_ss_U :  component ACMP_mul_ss
    generic map (
        ID => ID,
        NUM_STAGE => 4,
        din0_WIDTH => din0_WIDTH,
        din1_WIDTH => din1_WIDTH,
        dout_WIDTH => dout_WIDTH)
    port map (
        clk => clk,
        reset => reset,
        ce => ce,
        din0 => din0,
        din1 => din1,
        dout => dout);

end architecture;

