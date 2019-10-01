
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity vga_640x480 is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC;
           hc : out  STD_LOGIC_VECTOR (9 downto 0);--Contador de pixeles(0-800).
           vc : out  STD_LOGIC_VECTOR (9 downto 0);--Contador de lineas horizontales(0-520).
           vidon : out  STD_LOGIC);
end vga_640x480;

architecture Behavioral of vga_640x480 is

constant		hpixels:		std_logic_vector(9 downto 0):="1100100000";	--800 pixeles horizontales
constant		vlines:		std_logic_vector(9 downto 0):="1000001001";	--521 pixeles verticales
constant		hbp:			std_logic_vector(9 downto 0):="0010010000";	--128 (SP) + 16 (BP) pixeles horizontales
constant		hfp:			std_logic_vector(9 downto 0):="1100010000";	--128 (SP) + 16 (FP) + 640 (Línea horizontal) pixeles horizontales
constant		vbp:			std_logic_vector(9 downto 0):="0000011111";	--2 (SP) + 29 (BP) pixeles verticales
constant		vfp:			std_logic_vector(9 downto 0):="0111111111";	--2 (SP) + 29 (FP) + 480 (Línea horizontal) pixeles verticales

signal		hcs,vcs:		std_logic_vector(9 downto 0);						--Contadores
signal		vsenable:	std_logic;--Activador vertical de señal.

begin
----CONTADOR PARA LA SEÑAL DE SINCRONIA HORIZONTAL
	process(clk,clr)
	begin
		if 	clr='1' then
			hcs	<="0000000000";--Si clear es igual a 1 se resetea el contador horizontal de pixeles.
		elsif	rising_edge(clk) then
			if	hcs =	hpixels-1 then --Si llego a 799(800 pixeles) resetea la señal
				hcs		<="0000000000";
				vsenable	<='1';--Si llego a la cuenta maxima activa la señal.
			else
				hcs		<=hcs+1;--Incrementa el contador en 1.
				vsenable	<='0';--Desactiva la señal
			end if;
		end if;
	end process;
	
	hsync		<=	'0'	when	hcs	< 128 else	'1';							--Genera el pulso de activación para la siguiente línea.

----CONTADOR PARA LA SEÑAL DE SINCRONIA VERTICAL
	process(clk,clr)
	begin
		if 	clr='1' then
			vcs	<="0000000000";
		elsif	(rising_edge(clk) and vsenable ='1') then
			if vcs= vlines-1 then
				vcs	<="0000000000";
			else 
				vcs	<=vcs+1;
			end if;
		end if;
	end process;

vsync	<='0'	when	vcs	<2	else	'1'	;										--Las dos primeras lineas son ceros, para estabilizar

vidon	<='1' when	(((hcs<hfp) and (hcs>hbp))									--Establece los límites donde se vera el video tanto vertical como horizontalmete.
					and ((vcs<vfp) and (vcs>vbp))) else '0';
						
hc		<=hcs;
vc		<=vcs;
						

end Behavioral;

