----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:37:25 04/05/2016 
-- Design Name: 
-- Module Name:    File_Regs - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity File_Regs is
    Port ( Clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC; --validare scriere
           RdReg1 : in  STD_LOGIC_VECTOR (3 downto 0); --reg de citit nr 1
           RdReg2 : in  STD_LOGIC_VECTOR (3 downto 0); --reg de citit nr 2
           WrReg : in  STD_LOGIC_VECTOR (3 downto 0); --nr reg de scris
           WRData : in  STD_LOGIC_VECTOR (15 downto 0);-- data de scris
           RdData1 : out  STD_LOGIC_VECTOR (15 downto 0); --continutul registrului 1
           RdData2 : out  STD_LOGIC_VECTOR (15 downto 0)); --continutul registrului 2
end File_Regs;

architecture Behavioral of File_Regs is
type tRegs is array (0 to 15) of std_logic_vector(15 downto 0); --avem 16 registre pe 16 biti
signal s16Regs16: tRegs; 
signal RdData1_lcl :std_logic_vector(15 downto 0); 
signal RdData2_lcl :std_logic_vector(15 downto 0); 
begin

RdData1_lcl <= s16Regs16(conv_integer(RdReg1)); --citirea datei din reg1
RdData2_lcl <= s16Regs16(conv_integer(RdReg2)); --citirea datei din reg2

s16Regs16( conv_integer(WrReg) ) <= WRData when rising_edge(Clk) and WrEn = '1' ;  --scrierea datei in reg destinatie

RdData1 <= RdData1_lcl;
RdData2 <= RdData2_lcl;

end Behavioral;

