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
		  data0 : in std_logic_vector(15 downto 0);
		  addr0 : out std_logic_vector(22 downto 0);
		  red : out std_logic_vector(2 downto 0);
		  green : out std_logic_vector(2 downto 0);
		  blue : out std_logic_vector(1 downto 0));
end vga_ram;

architecture Behavioral of vga_ram is
constant addr_max: std_logic_vector(19 downto 0):=X"25800";
signal pixel,pixelaux: std_logic_vector(7 downto 0);
signal addr_count: std_logic_vector(19 downto 0);
begin
   
	process(clk80,clr)
	begin
	    if clr='1' then
		    addr_count<=(others=>'0');
		 elsif rising_edge(clk80) then
		    if addr_count=addr_max-1 then
			    addr_count<=(others=>'0');
			 else
			   if vidon='1' then
			 	   addr_count<=addr_count+1;
			 	end if;
	       end if;
        end if;
	end process;
	
	--obtienen 2 pixeles por cada direccion
	process(clk40,clk80,clr)
	begin
	        if clr='1' then
		        pixel<="00000000";
			  elsif rising_edge(clk40) then
			     if clk80='1' then
				     pixel<=data0(15 downto 8);
				else
					  pixel<=data0(7 downto 0);
			     end if;
			  end if;  
	end process;
	--pixelaux<=not(pixel);
	process(pixel)
	begin
	     if pixel<="10000000" then
		   pixelaux<="11111100";
		 else
		   pixelaux<="00000000";
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
	addr0 <= "000" & addr_count;
	
end Behavioral;

