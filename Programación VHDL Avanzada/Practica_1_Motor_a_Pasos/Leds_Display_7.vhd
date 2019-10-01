----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:59:37 03/30/2017 
-- Design Name: 
-- Module Name:    Leds_Display_7 - Behavioral 
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
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Leds_Display_7 is
    Port ( clkin : in  STD_LOGIC;
	       Entrada_Disp_1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Entrada_Disp_2 : in  STD_LOGIC_VECTOR (7 downto 0);
           Entrada_Disp_3 : in  STD_LOGIC_VECTOR (7 downto 0);
           Entrada_Disp_4 : in  STD_LOGIC_VECTOR (7 downto 0);
           Salidas_7seg : out  STD_LOGIC_VECTOR (7 downto 0);
           Control_Disp_7seg : out  STD_LOGIC_VECTOR (3 downto 0));
end Leds_Display_7;

architecture Behavioral of Leds_Display_7 is
signal clkdiv: STD_LOGIC_VECTOR (16 downto 0);
signal contador_disp: STD_LOGIC_VECTOR (1 downto 0):="00";
begin
     process(clkin)
	  begin 
		if rising_edge(clkin) then
			clkdiv <= clkdiv +1;
		end if;
	  end process;
	  process(clkdiv(16),contador_disp)
	  begin 
      if rising_edge(clkdiv(16)) then
	     contador_disp<=contador_disp+1;
	     if contador_disp=0 then
		     Control_Disp_7seg<="0111";
           Salidas_7seg<=not(Entrada_Disp_1);		  
		  elsif contador_disp=1 then
		     Control_Disp_7seg<="1011";
			  Salidas_7seg<=not(Entrada_Disp_2);	
		  elsif contador_disp=2 then
		     Control_Disp_7seg<="1101";
			  Salidas_7seg<=not(Entrada_Disp_3);	
		  else
		     Control_Disp_7seg<="1110";
			  Salidas_7seg<=not(Entrada_Disp_4);	
		  end if;
	   end if;
	  end process;
end Behavioral;

