----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:55:26 03/17/2017 
-- Design Name: 
-- Module Name:    Vga_Imagen - Behavioral 
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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Vga_Imagen is
    Port ( vidon : in  STD_LOGIC;
	        hc : in  STD_LOGIC;
           vc : in  STD_LOGIC_VECTOR (9 downto 0);
           m : in  STD_LOGIC_VECTOR (0 to 31);
           sw : in  STD_LOGIC_VECTOR (7 downto 0);
           rom_addr4 : out  STD_LOGIC_VECTOR (3 downto 0);
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0));
end Vga_Imagen;

architecture Behavioral of Vga_Imagen is
signal C1,R1:std_logic_vector(10 downto 0);
signal rom_addr,rom_pix:std_logic_vector(10 downto 0);
constant	hbp:	std_logic_vector(9 downto 0):="0010010000";	--128 (P) + 16 (BP) pixeles horizontales
constant	vbp:	std_logic_vector(9 downto 0):="0000011111";	--2 (P) + 29 (BP) pixeles verticales
constant w: integer:=32;
constant h: integer:=16;
signal spriteon,R,G,B: std_logic;--spriteon para activar la imagen pequeña.
begin
     --Establecer C1,R1 utilizando switches.
     C1<="00" & sw(3 downto 0) & "00001";--Concatenar.
	  R1<="00" & sw(7 downto 4) & "00001";--Concatenar.
	  rom_addr<=vc-vbp-R1;
	  rom_pix<=hc-hbp-c1;
	  rom_addr4<=rom_addr(3 downto 0);
	  --habilitar spriteon cuando este dentro de la regiòn sprite.
	  spriteon<='1' when (((hc>=C1+hbp) and (hc<C1+hbp+w))
	                and   ((vc>=R1+vbp) and (vc<R1+vbp+h)))
	  				    else '0';
	  process(spriteon,vidon,rom_pix,m)
	  variable j:integer;
	   begin
	       red<="000";
			 green<="000";
			 blue<="00";
			 R<='0';
			 G<='0';
			 B<='0';
	   if spriteon='1' and vidon='1' then
        j:=conv_integer(rom_pix);
		  R<=m(j);
		  G<=m(j);
		  B<=m(j);
		  red<=R & R & R;
		  green<= G & G & G;
      end if;	  
	  end process;
end Behavioral;