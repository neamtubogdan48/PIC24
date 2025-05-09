	----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:48:41 03/18/2024 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( RdData1 : in  STD_LOGIC_VECTOR (15 downto 0);
           RdData2 : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (2 downto 0);
           CE_N : in  STD_LOGIC;
			  CE_Z : in  STD_LOGIC;
			  CE_OV : in  STD_LOGIC;
			  CE_C : in  STD_LOGIC;
			  ZF : out STD_LOGIC;
			  C: out STD_LOGIC;
			  OV: out STD_LOGIC;
			  N : out STD_LOGIC;
			  Y : out STD_LOGIC_VECTOR(15 downto 0);
			  Clk: in STD_LOGIC;
			  Lit5: in STD_LOGIC_VECTOR (4 downto 0);
			  Lit10: in STD_LOGIC_VECTOR (9 downto 0)
			  );
end ALU;

architecture Behavioral of ALU is

	signal OP1: STD_LOGIC_VECTOR(15 downto 0);
	signal OP2: STD_LOGIC_VECTOR(15 downto 0);
	signal sY: STD_LOGIC_VECTOR(16 downto 0); 
	signal AND_lit10: STD_LOGIC_VECTOR(16 downto 0); 
	signal tempC: STD_LOGIC;
	signal tempN: STD_LOGIC;
	signal tempOV: STD_LOGIC;
	signal tempZ: STD_LOGIC; 
	signal LSR_Result : std_logic_vector(15 downto 0);
	signal nOP2: STD_LOGIC_VECTOR(15 downto 0);

begin

	OP1 <= RdData1;
	OP2 <= RdData2;
				
	

	with ALUOP select sY <=      ('0'& OP1) + ('0'& OP2)      				when "000", -- ADD with carry extension affects all flags
                                ('0'& OP1) - ('1'& OP2)      				when "001", -- SUB with carry extension affects all flags
                                ('0'& OP1) and ('0'& OP2)    				when "010", -- AND affects N and Z flags
                                ('0'& OP1) or ('0'& OP2)		 				when "011", -- OR affects N and Z flags
										  ('0' & OP1) + ("00000000000" & lit5) 	when "100", -- ADD Wb,#lit5,Wd
										  ('0' & nOP2) + "00000000000000001"		when "101", -- NEG Ws,Wd
										  AND_lit10										  	when "110", -- AND #lit10,Wn
										  ('0' & LSR_Result)       					when "111", -- LSR Wb,Wns,Wnd
										  (others => '0')									when others; -- Default case
											
	AND_lit10 <= '0'&OP2(15 downto 0) and "0000000"&lit10;
	
	nOP2 <= not OP2;
		
	
-- LSR Operation using Wns (OP2)
    LSR_Result <= "0" & OP1(15 downto 1) when OP2(3 downto 0) = "0001" else
                  "00" & OP1(15 downto 2) when OP2(3 downto 0) = "0010" else
                  "000" & OP1(15 downto 3) when OP2(3 downto 0) = "0011" else
                  "0000" & OP1(15 downto 4) when OP2(3 downto 0) = "0100" else
                  "00000" & OP1(15 downto 5) when OP2(3 downto 0) = "0101" else
                  "000000" & OP1(15 downto 6) when OP2(3 downto 0) = "0110" else
                  "0000000" & OP1(15 downto 7) when OP2(3 downto 0) = "0111" else
                  "00000000" & OP1(15 downto 8) when OP2(3 downto 0) = "1000" else
                  "000000000" & OP1(15 downto 9) when OP2(3 downto 0) = "1001" else
                  "0000000000" & OP1(15 downto 10) when OP2(3 downto 0) = "1010" else
                  "00000000000" & OP1(15 downto 11) when OP2(3 downto 0) = "1011" else
                  "000000000000" & OP1(15 downto 12) when OP2(3 downto 0) = "1100" else
                  "0000000000000" & OP1(15 downto 13) when OP2(3 downto 0) = "1101" else
                  "00000000000000" & OP1(15 downto 14) when OP2(3 downto 0) = "1110" else
                  "000000000000000" & OP1(15 downto 15) when OP2(3 downto 0) = "1111" else
                  OP1; -- Default: No shift (OP2(3 downto 0) = "0000")
	
	tempN <= sY(15);
	N<= tempN when rising_edge(Clk) and CE_N='1';
	
	
	tempC <= sY(16);
	C <= tempC when rising_edge(Clk) and CE_C = '1';
	
	
	tempOV <= '1' when (ALUOP="000" and OP1(15)= OP2(15) and OP1(15)/=sY(15))or
							(ALUOP="001" and OP1(15)/=OP2(15) and OP2(15) = sY(15)) else
					'0';
	OV <= tempOV when rising_edge(Clk) and CE_OV = '1';
							
	
	
	tempZ <= '1' when sY(15 downto 0) = x"0000" else '0';
	

	ZF <= tempZ when rising_edge(Clk) and CE_Z='1';
	
	Y <= sY(15 downto 0);

end Behavioral;

