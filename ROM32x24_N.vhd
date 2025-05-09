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
						x"808101",	-- mov 0x1020, w1	;INW0=7fff
						x"808112",	-- mov 0x1022, w2	;INW1=0001 
						x"408182",	-- add w1, w2, w3	;8000, N=1 
						x"418183",	-- add w3, w3, w3	;0000, N=0
						x"518202",	-- sub w3, w2, w4	;ffff, N=1
						x"520184",	-- sub w4, w4, w3	;0000, N=0 
						x"620284",	-- and w4, w4, w5	;ffff, N=1 
						x"620282",	-- and w4, w2, w5	;0001, N=0 
						x"720301",	-- ior w4, w1, w6	;ffff, N=1
						x"708301",	-- ior w1, w1, w6	;7fff, N=0 
						x"888121",	-- mov w1, 0x1024
						x"888122",	-- mov w2, 0x1024
						x"888123",	-- mov w3, 0x1024
						x"888124",	-- mov w4, 0x1024
						x"888125",	-- mov w5, 0x1024
						x"888126",	-- mov w6, 0x1024
						x"37FFEF",	-- bra LOOP
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

