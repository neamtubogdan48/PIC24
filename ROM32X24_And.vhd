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
						x"808101",  --  MOV 0x1020, W1     ; INW0 = 12C0, W1 = 12C0
						x"808112",  --  MOV 0x1022, W2     ; INW1 = 12D0, W2 = 12D0
						x"B20011",  --  AND #0x0001, W1    ; Result: W1 = 0x0000, Z = 1, N = 0
						x"B23332",  --  AND #0x0333, W2    ; Result: W2 = 0x0210, Z = 0, N = 0
						x"888121",  --  MOV W1, 0x1024     ; Move W1 (0x0000) to address 0x1024
						x"888122",  --  MOV W2, 0x1024     ; Move W2 (0x0210) to address 0x1024 (overwrites previous value)
						x"37FFF9",  --  BRA Loop
						x"000000",	--7
						x"000000",	--8  
						x"000000",	--9
						x"000000",	--10
						x"000000",	--11
						x"000000",	--12
						x"000000",	--13
						x"000000",	--14
						x"000000",	--15
						x"000000",	--16
						x"000000",	--17
						x"000000",	--18
						x"000000",	--19
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

