
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity vga_stripes is
    Port ( vidon : in  STD_LOGIC;
           hc : in  STD_LOGIC_VECTOR (9 downto 0);
           vc : in  STD_LOGIC_VECTOR (9 downto 0);
			  Selector : in  STD_LOGIC_VECTOR (7 downto 0);
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0));
end vga_stripes;

architecture Behavioral of vga_stripes is
signal pixelaux: STD_LOGIC_VECTOR (7 downto 0);
begin
	process(vidon,vc)
	begin
		red	<="000";
		green	<="000";
		blue	<="00";
      	
			if	vidon='1' then
				--red	<=vc(4)&vc(4)&vc(4);
				--green	<=not(vc(4)&vc(4)&vc(4));
				if vc(4)='1' then
				   pixelaux<=Selector;
				else
				   pixelaux<=not(Selector);
				end if;
				 red<=pixelaux(5)&pixelaux(6)&pixelaux(7);
				 green<=pixelaux(2)&pixelaux(3)&pixelaux(4);
				 blue<=pixelaux(0)&pixelaux(1);
			end if;
	end process;
		
end Behavioral;

