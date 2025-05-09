----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:02:46 03/17/2024 
-- Design Name: 
-- Module Name:    PC_Update - Behavioral 
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

entity PC_Update is
    Port ( 
		Offset : in STD_LOGIC_VECTOR (4 downto 0);
		Branch: in STD_LOGIC_VECTOR(2 downto 0);
		PC : in  STD_LOGIC_VECTOR (5 downto 0);
      New_PC : out  STD_LOGIC_VECTOR (5 downto 0);
		ZF: in STD_LOGIC;
		OVF: in STD_LOGIC;
		CF: in STD_LOGIC;
		NF: in STD_LOGIC
		);
end PC_Update;

architecture Behavioral of PC_Update is
	signal PC_p4 : std_logic_vector (5 downto 0);
	signal depl : std_logic_vector (5 downto 0);
begin
	
	PC_p4 <= PC+2;
	depl(0) <= '0';
	depl(5 downto 1) <= Offset;
	
	New_PC <= PC_p4 + depl when (Branch = "001" and ZF = '1') or (Branch = "010" and OVF = '1') or 
										(Branch = "011" and CF = '1') or (Branch = "100" and NF = '1') or (Branch = "101") else PC_p4;
	
end Behavioral;
