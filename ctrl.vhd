----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:39:40 03/18/2024 
-- Design Name: 
-- Module Name:    ctrl - Behavioral 
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

entity ctrl is
    Port ( 
        OPCODE    : in  STD_LOGIC_VECTOR(7 downto 0); -- Opcode
        BaseReg   : out STD_LOGIC; -- Destination for the first operand
        RegDest   : out STD_LOGIC; -- Destination for the second operand
        Branch    : out STD_LOGIC_VECTOR(2 downto 0); -- Detect if the instruction is a branch
        Mem2Reg  : out STD_LOGIC; -- Write from memory to register
        ALUOP     : out STD_LOGIC_VECTOR(2 downto 0); -- Operation code for ALU
        MemWr  : out STD_LOGIC; -- Write to memory
        RegWr  : out STD_LOGIC; -- Write to register
        CE_NF     : out STD_LOGIC; -- Enable Negative Flag modification
        CE_CF     : out STD_LOGIC; -- Enable Carry Flag modification
        CE_ZF     : out STD_LOGIC; -- Enable Zero Flag modification
        CE_OVF    : out STD_LOGIC  -- Enable Overflow Flag modification
    );
end ctrl;

architecture Behavioral of ctrl is
begin


    ALUOP <= "000" when OPCODE(7 downto 3) = "01000" else -- ADD Wb, Ws, Wd
              "001" when OPCODE(7 downto 3) = "01010" else -- SUB Wb, Ws, Wd
              "010" when OPCODE(7 downto 3) = "01100" else -- AND Wb, Ws, Wd
              "011" when OPCODE(7 downto 3) = "01110" else -- IOR Wb, Ws, Wd
				  "100" when OPCODE(7 downto 3) = "01000" else -- ADD Wb,#lit5,Wd
              "101" when OPCODE = "11101010" 			else -- NEG Ws,Wd
              "110" when OPCODE(7 downto 3) = "10110" else -- AND #lit10,Wn
              "111" when OPCODE(7 downto 3) = "11011"	else -- LSR Wb,Wns,Wnd
              "000"; -- Default (no operation)

    -- Negative Flag (N)
    CE_NF <= '1' when OPCODE(7 downto 3) = "01000" 	or -- ADD Wb, Ws, Wd
                      OPCODE(7 downto 3) = "01010" 	or -- SUB Wb, Ws, Wd
                      OPCODE(7 downto 3) = "01100" 	or -- AND Wb, Ws, Wd
                      OPCODE(7 downto 3) = "01110" 	or -- IOR Wb, Ws, Wd
							 OPCODE(7 downto 3) = "10110" 	or -- AND #lit10,Wn
							 OPCODE(7 downto 3) = "11011"  	or	-- LSR Wb,Wns,Wnd
							 OPCODE = "11101010"                -- NEG Ws, Wd
							 else
				 '0';

    -- Carry Flag (C)
    CE_CF <= '1' when OPCODE(7 downto 3) = "01000" or -- ADD Wb, Ws, Wd
                      OPCODE(7 downto 3) = "01010" or -- SUB Wb, Ws, Wd
							  OPCODE = "11101010"			  	-- NEG Ws,Wd
							 else
				 '0';

    -- Zero Flag (Z)
    CE_ZF <= '1' when OPCODE(7 downto 3) = "01000" or -- ADD Wb, Ws, Wd
                     OPCODE(7 downto 3) = "01010" or  -- SUB Wb, Ws, Wd
                     OPCODE(7 downto 3) = "01100" or  -- AND Wb, Ws, Wd
                     OPCODE(7 downto 3) = "01110" or  -- IOR Wb, Ws, Wd
							OPCODE(7 downto 3) = "10110" or  -- AND #lit10,Wn
							OPCODE(7 downto 3) = "11011" or	-- LSR Wb,Wns,Wnd
							 OPCODE = "11101010"				  	-- NEG Ws,Wd
							else
				 '0';

    -- Overflow Flag (OV)
    CE_OVF <= '1' when OPCODE(7 downto 3) = "01000" or -- ADD Wb, Ws, Wd 
                      OPCODE(7 downto 3) = "01010"  or -- SUB Wb, Ws, Wd
							 OPCODE = "11101010"			 	 	 -- NEG Ws,Wd
							 else
				  '0';

    Branch <= "010" when OPCODE = "00110000" else -- BRA OV, Expr
              "011" when OPCODE = "00110001" else -- BRA C, Expr
              "100" when OPCODE = "00110011" else -- BRA N, Expr
              "001" when OPCODE = "00110010" else -- BRA Z, Expr
              "101" when OPCODE = "00110111" else -- BRA Expr
              "000";

    -- BaseReg signal
    BaseReg <= '1' when OPCODE(7 downto 3) = "11011" else -- LSR Wb,Wns,Wnd
						'0'; -- Default (for all other instructions)
    
    -- RegDest signal
    RegDest <= '0' when OPCODE(7 downto 3) = "10000" else -- MOV f, wnd
					'0' when OPCODE(7 downto 3) = "10110" else -- AND #lit10,Wn
                  '1'; -- Default (for all other instructions)
    
    -- Mem2Reg signal
    Mem2Reg <= '1' when OPCODE(7 downto 3) = "10000" else -- MOV f, wnd
                    '0'; -- Default (for all other instructions)

    -- MemWr signal
    MemWr <= '1' when OPCODE(7 downto 3) = "10001" else -- MOV wns, f
                    '0'; -- Default (for all other instructions)
    
    -- RegWr signal
    RegWr <= '1' when OPCODE(7 downto 3) = "01000" or -- ADD Wb, Ws, Wd
								OPCODE(7 downto 3) = "01010" or -- SUB Wb, Ws, Wd
								OPCODE(7 downto 3) = "01100" or -- AND Wb, Ws, Wd
								OPCODE(7 downto 3) = "01110" or -- IOR Wb, Ws, Wd
								OPCODE(7 downto 3) = "10000" or -- Mov f, Wnd
								OPCODE = "11101010"			  or -- NEG Ws,Wd
								OPCODE(7 downto 3)= "10110"  or -- AND #lit10,Wn
								OPCODE(7 downto 3) = "11011"    -- LSR Wb,Wns,Wnd
								else
                   '0'; -- Default (for all other instructions)

end Behavioral;