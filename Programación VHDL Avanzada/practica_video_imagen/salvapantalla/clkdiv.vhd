
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity clkdiv is
   Port ( mclk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  clk190 : out std_logic;
           clk25 : out  STD_LOGIC);
end clkdiv;

architecture Behavioral of clkdiv is
signal q: std_logic_vector(17 downto 0);

begin
   process(mclk,clr)
	begin
      if clr='1' then
         q <= "000000000000000000";
      elsif (mclk'event and mclk='1') then
         q <= q + 1;		
      end if;	
	end process;
	
	
   clk25 <= q(0);
	clk190 <= q(16);
	
end Behavioral;
