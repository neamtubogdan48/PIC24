--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2.04i
--  \   \         Application : ISE
--  /   /         Filename : tbw_Neg.vhw
-- /___/   /\     Timestamp : Fri Jan 10 20:23:31 2025
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: tbw_Neg
--Device: Xilinx
--

library UNISIM;
use UNISIM.Vcomponents.ALL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

ENTITY tbw_Neg IS
END tbw_Neg;

ARCHITECTURE testbench_arch OF tbw_Neg IS
    COMPONENT PIC24
        PORT (
            Clk : In std_logic;
            INW1 : In std_logic_vector (15 DownTo 0);
            IWN0 : In std_logic_vector (15 DownTo 0);
            C : Out std_logic;
            N : Out std_logic;
            OUTW0 : Out std_logic_vector (15 DownTo 0);
            OV : Out std_logic;
            ZF : Out std_logic
        );
    END COMPONENT;

    SIGNAL Clk : std_logic := '0';
    SIGNAL INW1 : std_logic_vector (15 DownTo 0) := "0000000000000000";
    SIGNAL IWN0 : std_logic_vector (15 DownTo 0) := "0000000000000000";
    SIGNAL C : std_logic := '0';
    SIGNAL N : std_logic := '0';
    SIGNAL OUTW0 : std_logic_vector (15 DownTo 0) := "0000000000000000";
    SIGNAL OV : std_logic := '0';
    SIGNAL ZF : std_logic := '0';

    constant PERIOD : time := 20 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : PIC24
        PORT MAP (
            Clk => Clk,
            INW1 => INW1,
            IWN0 => IWN0,
            C => C,
            N => N,
            OUTW0 => OUTW0,
            OV => OV,
            ZF => ZF
        );

        PROCESS    -- clock process for Clk
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                Clk <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                Clk <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                INW1 <= "1000000000000000";
                -- -------------------------------------
                WAIT FOR 920 ns;

            END PROCESS;

    END testbench_arch;

