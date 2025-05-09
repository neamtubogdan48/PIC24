--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2.04i
--  \   \         Application : sch2vhdl
--  /   /         Filename : PIC24.vhf
-- /___/   /\     Timestamp : 01/10/2025 20:35:33
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx92i\bin\nt\sch2vhdl.exe -intstyle ise -family spartan3 -flat -suppress -w C:/pic24nou1/PIC24.sch PIC24.vhf
--Design Name: PIC24
--Device: spartan3
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity PIC24 is
   port ( Clk   : in    std_logic; 
          INW1  : in    std_logic_vector (15 downto 0); 
          IWN0  : in    std_logic_vector (15 downto 0); 
          C     : out   std_logic; 
          N     : out   std_logic; 
          OUTW0 : out   std_logic_vector (15 downto 0); 
          OV    : out   std_logic; 
          ZF    : out   std_logic);
end PIC24;

architecture BEHAVIORAL of PIC24 is
   signal ALUOP    : std_logic_vector (2 downto 0);
   signal Base     : std_logic_vector (3 downto 0);
   signal Branch   : std_logic_vector (2 downto 0);
   signal CE_CF    : std_logic;
   signal CE_NF    : std_logic;
   signal CE_OVF   : std_logic;
   signal CE_ZF    : std_logic;
   signal Instr    : std_logic_vector (23 downto 0);
   signal MemOut   : std_logic_vector (15 downto 0);
   signal MemWr    : std_logic;
   signal Mem2Reg  : std_logic;
   signal New_PC   : std_logic_vector (5 downto 0);
   signal PC       : std_logic_vector (5 downto 0);
   signal RdData1  : std_logic_vector (15 downto 0);
   signal RdData2  : std_logic_vector (15 downto 0);
   signal RegBase  : std_logic;
   signal RegDest  : std_logic;
   signal RegWr    : std_logic;
   signal WrData   : std_logic_vector (15 downto 0);
   signal WrReg    : std_logic_vector (3 downto 0);
   signal Y        : std_logic_vector (15 downto 0);
   signal OV_DUMMY : std_logic;
   signal C_DUMMY  : std_logic;
   signal N_DUMMY  : std_logic;
   signal ZF_DUMMY : std_logic;
   component ALU
      port ( CE_N    : in    std_logic; 
             CE_Z    : in    std_logic; 
             CE_OV   : in    std_logic; 
             CE_C    : in    std_logic; 
             Clk     : in    std_logic; 
             RdData1 : in    std_logic_vector (15 downto 0); 
             RdData2 : in    std_logic_vector (15 downto 0); 
             ALUOP   : in    std_logic_vector (2 downto 0); 
             Lit5    : in    std_logic_vector (4 downto 0); 
             Lit10   : in    std_logic_vector (9 downto 0); 
             ZF      : out   std_logic; 
             C       : out   std_logic; 
             OV      : out   std_logic; 
             N       : out   std_logic; 
             Y       : out   std_logic_vector (15 downto 0));
   end component;
   
   component ctrl
      port ( OPCODE  : in    std_logic_vector (7 downto 0); 
             BaseReg : out   std_logic; 
             RegDest : out   std_logic; 
             Mem2Reg : out   std_logic; 
             MemWr   : out   std_logic; 
             RegWr   : out   std_logic; 
             CE_NF   : out   std_logic; 
             CE_CF   : out   std_logic; 
             CE_ZF   : out   std_logic; 
             CE_OVF  : out   std_logic; 
             Branch  : out   std_logic_vector (2 downto 0); 
             ALUOP   : out   std_logic_vector (2 downto 0));
   end component;
   
   component DataMem
      port ( Clk     : in    std_logic; 
             Wr      : in    std_logic; 
             INW0    : in    std_logic_vector (15 downto 0); 
             INW1    : in    std_logic_vector (15 downto 0); 
             Addr    : in    std_logic_vector (4 downto 0); 
             DataIn  : in    std_logic_vector (15 downto 0); 
             OUTW0   : out   std_logic_vector (15 downto 0); 
             DataOut : out   std_logic_vector (15 downto 0));
   end component;
   
   component File_Regs
      port ( Clk     : in    std_logic; 
             WrEn    : in    std_logic; 
             RdReg1  : in    std_logic_vector (3 downto 0); 
             RdReg2  : in    std_logic_vector (3 downto 0); 
             WrReg   : in    std_logic_vector (3 downto 0); 
             WrData  : in    std_logic_vector (15 downto 0); 
             RdData1 : out   std_logic_vector (15 downto 0); 
             RdData2 : out   std_logic_vector (15 downto 0));
   end component;
   
   component MUX2V4
      port ( Sel : in    std_logic; 
             I0  : in    std_logic_vector (3 downto 0); 
             I1  : in    std_logic_vector (3 downto 0); 
             Y   : out   std_logic_vector (3 downto 0));
   end component;
   
   component MUX2V16
      port ( Sel : in    std_logic; 
             Y   : out   std_logic_vector (15 downto 0); 
             I1  : in    std_logic_vector (15 downto 0); 
             I0  : in    std_logic_vector (15 downto 0));
   end component;
   
   component PC_Update
      port ( Offset : in    std_logic_vector (4 downto 0); 
             PC     : in    std_logic_vector (5 downto 0); 
             New_PC : out   std_logic_vector (5 downto 0); 
             ZF     : in    std_logic; 
             OVF    : in    std_logic; 
             CF     : in    std_logic; 
             NF     : in    std_logic; 
             Branch : in    std_logic_vector (2 downto 0));
   end component;
   
   component ProgCnt
      port ( Clk    : in    std_logic; 
             New_PC : in    std_logic_vector (5 downto 0); 
             PC     : out   std_logic_vector (5 downto 0));
   end component;
   
   component ROM32X24
      port ( Addr : in    std_logic_vector (4 downto 0); 
             Data : out   std_logic_vector (23 downto 0));
   end component;
   
begin
   C <= C_DUMMY;
   N <= N_DUMMY;
   OV <= OV_DUMMY;
   ZF <= ZF_DUMMY;
   U_ALU : ALU
      port map (ALUOP(2 downto 0)=>ALUOP(2 downto 0),
                CE_C=>CE_CF,
                CE_N=>CE_NF,
                CE_OV=>CE_OVF,
                CE_Z=>CE_ZF,
                Clk=>Clk,
                Lit5(4 downto 0)=>Instr(4 downto 0),
                Lit10(9 downto 0)=>Instr(13 downto 4),
                RdData1(15 downto 0)=>RdData1(15 downto 0),
                RdData2(15 downto 0)=>RdData2(15 downto 0),
                C=>C_DUMMY,
                N=>N_DUMMY,
                OV=>OV_DUMMY,
                Y(15 downto 0)=>Y(15 downto 0),
                ZF=>ZF_DUMMY);
   
   U_CTRL : ctrl
      port map (OPCODE(7 downto 0)=>Instr(23 downto 16),
                ALUOP(2 downto 0)=>ALUOP(2 downto 0),
                BaseReg=>RegBase,
                Branch(2 downto 0)=>Branch(2 downto 0),
                CE_CF=>CE_CF,
                CE_NF=>CE_NF,
                CE_OVF=>CE_OVF,
                CE_ZF=>CE_ZF,
                MemWr=>MemWr,
                Mem2Reg=>Mem2Reg,
                RegDest=>RegDest,
                RegWr=>RegWr);
   
   U_DataMem : DataMem
      port map (Addr(4 downto 0)=>Instr(8 downto 4),
                Clk=>Clk,
                DataIn(15 downto 0)=>RdData2(15 downto 0),
                INW0(15 downto 0)=>IWN0(15 downto 0),
                INW1(15 downto 0)=>INW1(15 downto 0),
                Wr=>MemWr,
                DataOut(15 downto 0)=>MemOut(15 downto 0),
                OUTW0(15 downto 0)=>OUTW0(15 downto 0));
   
   U_File_Regs : File_Regs
      port map (Clk=>Clk,
                RdReg1(3 downto 0)=>Base(3 downto 0),
                RdReg2(3 downto 0)=>Instr(3 downto 0),
                WrData(15 downto 0)=>WrData(15 downto 0),
                WrEn=>RegWr,
                WrReg(3 downto 0)=>WrReg(3 downto 0),
                RdData1(15 downto 0)=>RdData1(15 downto 0),
                RdData2(15 downto 0)=>RdData2(15 downto 0));
   
   U_MUX_Baza : MUX2V4
      port map (I0(3 downto 0)=>Instr(18 downto 15),
                I1(3 downto 0)=>Instr(14 downto 11),
                Sel=>RegBase,
                Y(3 downto 0)=>Base(3 downto 0));
   
   U_MUX_Dest : MUX2V4
      port map (I0(3 downto 0)=>Instr(3 downto 0),
                I1(3 downto 0)=>Instr(10 downto 7),
                Sel=>RegDest,
                Y(3 downto 0)=>WrReg(3 downto 0));
   
   U_MUX2V16 : MUX2V16
      port map (I0(15 downto 0)=>Y(15 downto 0),
                I1(15 downto 0)=>MemOut(15 downto 0),
                Sel=>Mem2Reg,
                Y(15 downto 0)=>WrData(15 downto 0));
   
   U_PC_Update : PC_Update
      port map (Branch(2 downto 0)=>Branch(2 downto 0),
                CF=>C_DUMMY,
                NF=>N_DUMMY,
                Offset(4 downto 0)=>Instr(4 downto 0),
                OVF=>OV_DUMMY,
                PC(5 downto 0)=>PC(5 downto 0),
                ZF=>ZF_DUMMY,
                New_PC(5 downto 0)=>New_PC(5 downto 0));
   
   U_ProgCnt : ProgCnt
      port map (Clk=>Clk,
                New_PC(5 downto 0)=>New_PC(5 downto 0),
                PC(5 downto 0)=>PC(5 downto 0));
   
   U_ROM : ROM32X24
      port map (Addr(4 downto 0)=>PC(5 downto 1),
                Data(23 downto 0)=>Instr(23 downto 0));
   
end BEHAVIORAL;


