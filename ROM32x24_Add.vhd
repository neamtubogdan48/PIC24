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
						x"808101",	-- mov 0x1020, w1  ; Move the value at address 0x1020 to register W1 (INW0=7FFF)
						x"808112",	-- mov 0x1022, w2  ; Move the value at address 0x1024 to register W3 (INW1=FFFF)
						x"4082E5",	-- add w1, #5, w5  ; Result: 0x8004, N=1, Z=0, OV=1, C=0
						x"410365",	-- add w2, #5, w6  ; Result: 0x0004 (with carry out), N=0, Z=0, OV=0, C=1
						x"2FFFB2",	-- mov #0xFFFB, w2 ; Move the value #0xFFFB to register W2 (INW1=FFFB)
						x"4103E5",	-- add w2, #5, w7  ; Result: 0x0000, N=0, Z=1, OV=0, C=1
						x"888125",	-- mov w5, 0x1024  ; Store the result of ADD W1 by 5 to address 0x1024
						x"888126",	-- mov w6, 0x1024  ; Store the result of ADD W2 by 5 to address 0x1024
						x"888127",	-- mov w7, 0x1024  ; Store the result of ADD W3 by 5 to address 0x1024
						x"37FFF6",	-- bra LOOP        ; Branch to label LOOP, creating an infinite loop
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

