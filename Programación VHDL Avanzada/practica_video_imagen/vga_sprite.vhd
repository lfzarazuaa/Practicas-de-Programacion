----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:30:30 03/05/2013 
-- Design Name: 
-- Module Name:    vga_sprite - Behavioral 
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

entity vga_sprite is
    Port ( vidon : in  STD_LOGIC;
           hc : in  STD_LOGIC_VECTOR (9 downto 0);
           vc : in  STD_LOGIC_VECTOR (9 downto 0);
           M : in  STD_LOGIC_VECTOR (7 downto 0);
           sw : in  STD_LOGIC_VECTOR (7 downto 0);
           rom_addr : out  STD_LOGIC_VECTOR (15 downto 0);  
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0));
end vga_sprite;

architecture Behavioral of vga_sprite is
constant hbp: std_logic_vector(9 downto 0):="0010010000"; -- 128+16=144
constant vbp: std_logic_vector(9 downto 0):="0000011111"; -- 2+29=31
constant w: integer :=    ;
constant h: integer :=    ;
signal xpix,ypix: std_logic_vector(9 downto 0);
signal C1,R1: std_logic_vector (9 downto 0);
signal spriteon, R, G, B: std_logic;

begin
   --establece C1 y R1 utilizando switches
	C1 <= '0' & sw(3 downto 0) & "00001";
	R1 <= '0' & sw(7 downto 4) & "00001";
	
	ypix <= vc - vbp - R1;
	xpix <= hc - hbp - C1;
	
	--habilita sprite video out cuando este dento de la region sprite 
	spriteon <= '1' when ((hc >= C1+hbp) and (hc < C1 + hbp + w) and
	            ((vc >= R1 + vbp) and (vc < R1 + vbp + h))) else '0';
					
	process(xpix,ypix)
	variable rom_addr1,rom_addr2: std_logic_vector (16 downto 0);
	begin
	   rom_addr1 :=  
	
	   rom_addr2 :=  
		rom_addr <= rom_addr2 (15 downto 0);
		
		
	end process;
	
	process(spriteon,vidon,M)
	variable j: integer;
	begin
	  red <= "000";
	  green <= "000";
	  blue <= "00";
	  
	  if spriteon = '1' and vidon = '1' then
	     red <= M(7 downto 5);
		  green <= M(4 downto 2);
		  blue <= M(1 downto 0);
	  end if;
	
	end process;

end Behavioral;

