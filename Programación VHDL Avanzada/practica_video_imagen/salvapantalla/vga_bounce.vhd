----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:08:07 10/17/2013 
-- Design Name: 
-- Module Name:    vga_bounce - Behavioral 
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


entity vga_bounce is
    Port ( cclk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           go : in  STD_LOGIC;
           c1 : out  STD_LOGIC_VECTOR (9 downto 0);
           r1 : out  STD_LOGIC_VECTOR (9 downto 0));
end vga_bounce;

architecture Behavioral of vga_bounce is

begin
   process(cclk,clr)
	variable c1v,r1v: STD_LOGIC_VECTOR (9 DOWNTO 0);
   variable dcv,drv: STD_LOGIC_VECTOR (9 DOWNTO 0);
   variable calc: STD_LOGIC;
   constant c1max: integer:= 440;--440;
	constant r1max: integer:= 320;--320
   begin
     if clr='1' then
	     c1v:="0001010000";--80 320;--"0001110100";--
        r1v:="0010001100";--140 320--"0000000000";--
        dcv:="0000000001";-- +1
        drv:="1111111111";-- -1
        calc:='0';
	  elsif rising_edge(cclk) then--Empieza a moverse la imagen.
	     if go='1' then
		     calc:='1';--Enclavar calc.
	     elsif calc='1' then
	        c1v:=c1v + dcv;
			  r1v:=r1v + drv;
			  if c1v<0 or c1v>=c1max then
			     dcv:=0-dcv;
			  end if;
			  if r1v<0 or r1v>=r1max then
			     drv:=0-drv;
			  end if;
	     end if;
	  end if;
	  c1<=c1v;
	  r1<=r1v;
	end process;
end Behavioral;