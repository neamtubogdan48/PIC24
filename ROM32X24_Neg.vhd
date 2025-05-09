
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:02 03/17/2024 
-- Design Name: 
-- Module Name:    ROM32X32 - Behavioral 
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

entity ROM32X24 is
    Port ( Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Data : out  STD_LOGIC_VECTOR (23 downto 0));
end ROM32X24;

architecture Behavioral of ROM32X24 is
	type tROM is array (0 to 31) of std_logic_vector(23 downto 0);
	
	constant ROM : tROM :=(
						--test
						x"808101",	-- mov 0x0000, w1         ; w1 = 0x0000 (0)
						x"808112",	-- mov 0x8000, w2         ; w2 = 0x8000 (32768)
						x"508202",	-- sub w1, w2, w4         ; w4 = w1 - w2 = 0x0000 - 0x8000 = -32768 (0xFFFF8000)
						x"EA0182",	-- neg w2, w3             ; w3 = -w2 = -0x8000 = -32768 (0xFFFF8000); Z = 0
						x"EA0181",	-- neg w1, w3             ; w3 = -w1 = -0 = 0; Z = 1
						x"320001",	-- bra Z, AfterFirstStop  ; Branch to AfterFirstStop if Z flag is set
						x"37000C",	-- bra STOP               ; Branch to STOP
						x"EA0283",	-- neg w3, w5             ; w5 = -w3 = 0; N = 0
						x"EA0202",	-- neg w2, w4             ; w4 = -w2 = -32768 (0xFFFF8000); N = 1
						x"330001",	-- bra N, AfterSecondStop ; Branch to AfterSecondStop if N flag is set
						x"370008",	-- bra STOP               ; Branch to STOP
						x"EA0284",	-- neg w4, w5             ; w5 = -w4 = 32768 (0x8000); C = 0
						x"EA0181",	-- neg w1, w3             ; w3 = -w1 = 0; C = 1
						x"310001",	-- bra C, AfterThirdStop  ; Branch to AfterThirdStop if C flag is set
						x"370004",	-- bra STOP               ; Branch to STOP
						x"EA0201",	-- neg w1, w4             ; w4 = -w1 = 0; OV = 0
						x"EA0182",	-- neg w2, w3             ; w3 = -w2 = -32768 (0xFFFF8000); OV = 1
						x"30FFEE",	-- bra OV, LOOP           ; Branch to LOOP if OV flag is set
						x"370000",	-- bra STOP               ; Branch to STOP
						x"37FFFF",	-- bra STOP               ; Infinite loop at STOP                                     
						x"000000",	--20
						x"000000",	--21
						x"000000",	--22
						x"000000",	--23
						x"000000",	--24
						x"000000",	--25
						x"000000",	--26
						x"000000",	--27
						x"000000",	--28
						x"000000",	--29
						x"000000",	--30
						x"000000"	--31
						);
begin
	Data <= ROM(conv_integer(Addr));

end Behavioral;

