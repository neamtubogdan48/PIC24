----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:23:02 03/22/2020 
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

		x"808101", -- mov 0x1020, w1 ;INW0=7Aff
		x"808112", -- mov 0x1022, w2 ;INW1=0501
		x"410382", -- add w2,w2,w7 ; 0A02, OV=0
		x"300002", -- BRA OV, STOP ;no jump
		x"408182", -- add w1,w2,w3 ;8000, OV=1
		x"300001", -- bra OV, END ;jump to END
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

