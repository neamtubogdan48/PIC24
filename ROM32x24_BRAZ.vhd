----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:02 03/17/2024
-- Design Name: 
-- Module Name:    ROM32x32 - Behavioral 
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

entity ROM32x24 is
    Port ( Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Data : out  STD_LOGIC_VECTOR (23 downto 0));
end ROM32x24;

architecture Behavioral of ROM32x24 is

type tROM is array ( 0 to 31) of std_logic_vector(23 downto 0);
constant ROM : tROM := (

		x"808101", -- mov 0x1020, w1 ;INW0=ffff
		x"808112", -- mov 0x1022, w2 ;INW1=0001
		x"410382", -- add w2,w2,w7 ;0002, Z=0
		x"320002", -- BRA Z, STOP ;no jump
		x"408182", -- add w1,w2,w3 ;0000, Z=1
		x"320001", -- bra Z, END ;jump to END
		x"37FFFF", -- STOP: bra STOP ;infinite loop
		x"37FFF8", -- END: bra LOOP ;return to start
		x"000000", --8
		x"000000", --9
		x"000000", --10
		x"000000", --11
		x"000000", --12
		x"000000", --13
		x"000000", --14
		x"000000", --15
		x"000000", --16
		x"000000", --17
		x"000000", --18
		x"000000", --19
		x"000000", --20
		x"000000", --21
		x"000000", --22
		x"000000", --23
		x"000000", --24
		x"000000", --25
		x"000000", --26
		x"000000", --27
		x"000000", --28
		x"000000", --29
		x"000000", --30
		x"000000"  --31
		);
		
begin

Data <= ROM(conv_integer(Addr));

end Behavioral;

