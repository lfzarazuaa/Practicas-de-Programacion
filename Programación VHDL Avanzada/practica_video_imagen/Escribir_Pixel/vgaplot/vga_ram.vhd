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
constant addr_max: std_logic_vector(19 downto 0):=X"25800"; --340x480
signal pixel: std_logic_vector(7 downto 0);
signal sal: std_logic_vector (2 downto 0);
signal addr_count: std_logic_vector(19 downto 0);
begin
   --contador para el bus de direcciones, se incrementa cada 80ns
	process(clk80,clr)
	begin
	  if clr='1' then
	     addr_count <= (others =>'0');
	  elsif (clk80'event and clk80='1') then
	    if addr_count = addr_max - 1 then
		    addr_count <= (others =>'0');
		 else
	       if vidon='1' then
             addr_count <= addr_count + 1;
          end if;
       end if;			 
	  end if;
	end process;
	
	--obtienene 2 pixeles por direccion de memoria
	process(clk40,clr)
	begin
	   if (clr='1') then
		   pixel <= X"00";
		elsif (clk40'event and clk40='1') then
	      if clk80='1' then
              pixel <= data0(15 downto 8);
           
	 else
             
             pixel <= data0(7 downto 0);
							
			end if;
		end if;
	end process;

  
   process(vidon,pixel)
	begin
	   red <= "000";
		green <= "000";
		blue <= "00";
		if vidon = '1' then
		   red <= pixel(7 downto 5);
			green <= pixel(4 downto 2);
			blue <= pixel(1 downto 0);
		end if;
	end process;
	
	addr0 <= "000" & addr_count;
	
end Behavioral;

