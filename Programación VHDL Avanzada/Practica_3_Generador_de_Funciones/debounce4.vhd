----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:59:18 04/01/2013 
-- Design Name: 
-- Module Name:    debounce4 - Behavioral 
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

entity debounce4 is
    Port ( clr : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           inp : in  STD_LOGIC_VECTOR(3 downto 0);
           outp : out  STD_LOGIC_VECTOR(3 downto 0));
end debounce4;

architecture Behavioral of debounce4 is
signal delay1,delay2,delay3: std_logic_vector(3 downto 0);
signal clkdiv: std_logic_vector(17 downto 0);
begin
   process(clk)
	begin
	     if rising_edge(clk) then
			clkdiv <= clkdiv +1;
		end if;
	end process;
	
   process(clr,clkdiv(17))
	begin
	   if clr = '1' then
		    delay1 <= "0000";
			 delay2 <= "0000";
			 delay3 <= "0000";
		elsif rising_edge(clkdiv(17)) then
		    delay1 <= inp;
			 delay2 <= delay1;
			 delay3 <= delay2;
		end if;
	end process;
   outp <= delay1 and delay2 and delay3;
end Behavioral;

