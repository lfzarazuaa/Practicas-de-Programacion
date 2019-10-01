----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:28:58 03/11/2013 
-- Design Name: 
-- Module Name:    vgaa_ram - Behavioral 
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

entity vga_ram is
   port(clk40,clk80,clr : in std_logic;
		  vidon : in std_logic;
		  hc : in std_logic_vector(9 downto 0);
		  vc : in std_logic_vector(9 downto 0);
		  selector : in std_logic_vector(2 downto 0);
		  data0 : in std_logic_vector(15 downto 0);--Datos obtenidos de la RAM(16 bits).
		  addr0 : out std_logic_vector(22 downto 0);--Direccion a leer de la RAM.
		  red : out std_logic_vector(2 downto 0);
		  green : out std_logic_vector(2 downto 0);
		  blue : out std_logic_vector(1 downto 0));
end vga_ram;

architecture Behavioral of vga_ram is
constant addr_max: std_logic_vector(19 downto 0):=X"25800";--Ultima direcciòn a leer de la RAM.
signal pixel,pixelaux: std_logic_vector(7 downto 0);--Vectores para tratamiento digital de la Imagen.
signal addr_count: std_logic_vector(19 downto 0);--
signal R1,G1: std_logic_vector(2 downto 0);
signal B1: std_logic_vector(1 downto 0);
begin
   
	process(clk80,clr)
	begin
	    if clr='1' then
		    addr_count<=(others=>'0');--Resetea el contador de direccion
		 elsif rising_edge(clk80) then
		    if addr_count=addr_max-1 then--Si el contador de direccion llega al ultimo byte resetea el contador.
			    addr_count<=(others=>'0');
			 else
			   if vidon='1' then
			 	   addr_count<=addr_count+1;--Si esta en la region activa incrementa el conteo.
			 	end if;
	       end if;
        end if;
	end process;
	
	--obtienen 2 pixeles por cada direccion
	process(clk40,clk80,clr)
	begin
	        if clr='1' then
		        pixel<="00000000";--Si esta en clear resetea la imagen.
			  elsif rising_edge(clk40) then
			     if clk80='1' then--Si esta en la parte alta(1er ciclo de clk40).
				     pixel<=data0(15 downto 8);--Interpreta el primer byte como el pixel a leer.
				  else----Si esta en la parte alta(2do ciclo de clk40).
					  pixel<=data0(7 downto 0);--Interpreta el segundo byte como el pixel a leer.
			     end if;
			  end if;  
	end process;
	--pixelaux<=not(pixel);
	process(pixel)
	begin
	    R1<=pixel(5)&pixel(6)&pixel(7);
		 G1<=pixel(2)&pixel(3)&pixel(4);
		 B1<=pixel(0)&pixel(1);
		 -- & pixel(7 downto 5) & pixel(4 downto 2) & pixel(1 downto 0)
		 if selector=0 then
	      if R1>="100" then
		      pixelaux<="111"& pixel(4 downto 2) & pixel(1 downto 0);
		   else
		      pixelaux<="000"& pixel(4 downto 2) & pixel(1 downto 0);
		   end if;
		 elsif selector=1 then
		   if R1<="100" then
		      pixelaux<="111"& pixel(4 downto 2) & pixel(1 downto 0);
		   else
		      pixelaux<="000"& pixel(4 downto 2) & pixel(1 downto 0);
		   end if;
		 elsif selector=2 then
		   if G1>="100" then
		      pixelaux<=pixel(7 downto 5) & "111" & pixel(1 downto 0);
		   else
		      pixelaux<=pixel(7 downto 5) & "000" & pixel(1 downto 0);
		   end if;
		 elsif selector=3 then
		   if G1<="100" then
		      pixelaux<=pixel(7 downto 5) & "111" & pixel(1 downto 0);
		   else
		      pixelaux<=pixel(7 downto 5) & "000" & pixel(1 downto 0);
		   end if;
		 elsif selector=4 then
		   if B1>="10" then
		      pixelaux<=pixel(7 downto 5) & pixel(4 downto 2) & "11";
		   else
		      pixelaux<=pixel(7 downto 5) & pixel(4 downto 2) & "00";
		   end if;
		 elsif selector=5 then
		   if B1<="10" then
		      pixelaux<=pixel(7 downto 5) & pixel(4 downto 2) & "11";
		   else
		      pixelaux<=pixel(7 downto 5) & pixel(4 downto 2) & "00";
		   end if;
		 elsif selector=6 then
		      pixelaux<=pixel;
		 else
		      pixelaux<=not(pixel);
		 end if;
	end process;
   --Mandar datos a la pantalla
   process(vidon,pixelaux)
	begin
	   red <= "000";
		green <= "000";
		blue <= "00";
		if vidon = '1' then
		   red <= pixelaux(7 downto 5);
			green <= pixelaux(4 downto 2);
			blue <= pixelaux(1 downto 0);
		end if;
	end process;
	addr0 <= "000" & addr_count;--Agrega los ceros para acceder correctamente a la RAM.	
end Behavioral;

