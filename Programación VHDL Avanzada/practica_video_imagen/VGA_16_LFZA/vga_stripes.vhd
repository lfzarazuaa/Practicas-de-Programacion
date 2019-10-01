
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity vga_stripes is
    Port ( vidon : in  STD_LOGIC;
           hc : in  STD_LOGIC_VECTOR (9 downto 0);
           vc : in  STD_LOGIC_VECTOR (9 downto 0);
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0));
end vga_stripes;

architecture Behavioral of vga_stripes is

begin
	process(vidon,vc)
	begin
		red	<="000";
		green	<="000";
		blue	<="00";		
			if	vidon='1' then
				red	<=vc(4)&vc(4)&vc(4);
				green	<=not(vc(4)&vc(4)&vc(4));
			end if;
	end process;

end Behavioral;

