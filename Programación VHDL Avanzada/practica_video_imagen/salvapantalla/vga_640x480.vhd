
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity vga_640x480 is
  port ( clk, clr: in std_logic;
         hsync : out std_logic;
			vsync : out std_logic;
			hc : out std_logic_vector(9 downto 0);
			vc : out std_logic_vector(9 downto 0);
			vidon : out std_logic);
end vga_640x480;

architecture Behavioral of vga_640x480 is
constant hpixels: std_logic_vector (9 downto 0):="1100100000"; --pixeles linea horizontal = 800
constant vlines: std_logic_vector (9 downto 0):="1000001001"; --numero de lineas horizontales del display = 521
constant hbp: std_logic_vector (9 downto 0):="0010010000"; --horizontal back porch =128 + 16
constant hfp: std_logic_vector (9 downto 0):="1100010000"; --horizontal front porch = 128+16+640
constant vbp: std_logic_vector (9 downto 0):="0000011111"; --vertical back porch = 2 + 29
constant vfp: std_logic_vector (9 downto 0):="0111111111"; -- vertical front porch=2+29+480
signal hcs,vcs: std_logic_vector (9 downto 0); --contadores horizontal y vertical
signal vsenable: std_logic; --habilitacion para el contador vertical



begin
--contador para la señal de sync horizontal
   process(clk,clr)
   begin
	   if clr='1' then
		   hcs <= "0000000000";
      elsif (clk'event and clk='1') then
         if hcs=hpixels-1 then --el contador llego al final de la cuenta
			   hcs <= "0000000000"; --reset
				vsenable <= '1'; --habilita vertical counter
			else
			   hcs <= hcs + 1; --incrementa contador horizontal
				vsenable <= '0';  --coloca señal en off
			end if;
      end if;		
	end process;

   hsync <= '0' when hcs < 128 else '1'; --pulso de sync horiz es 0 cuando hc esta entre 0 y 127

   --contadorpara la señal de sync vertical	
   process(clk,clr)
   begin
	   if clr='1' then
		   vcs <= "0000000000";
      elsif (clk'event and clk='1' and vsenable='1') then
         if vcs=vlines - 1  then  --incrementa cuanto esta habilitado
			   vcs <= "0000000000"; --reset
			else
			   vcs <= vcs + 1; --incrementa contador vertical
			end if;
      end if;		
	end process;
	
	vsync <= '0' when vcs < 2 else '1'; --vertycal sync pulse en 0 cuando vc es 0 o 1
	
	vidon <= '1' when (((hcs < hfp) and (hcs >= hbp))
             and ((vcs < vfp) and (vcs >= vbp))) else '0'; --habilita video out cuando esta entre las porches
	
   --salida de los contadores horizontal y vertical
	hc <= hcs;
   vc <= vcs;	
				 
				 
end Behavioral;

