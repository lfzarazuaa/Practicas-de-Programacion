----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:32:40 05/19/2017 
-- Design Name: 
-- Module Name:    MUX_Freq_0 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_Freq_0 is
    Port ( Dato : in  STD_LOGIC_VECTOR (15 downto 0);--Dato de la señal generada.
           Freq : in  STD_LOGIC_VECTOR (13 downto 0);--Frecuencia deseada.
           Vout : out  STD_LOGIC_VECTOR (15 downto 0));--Dato de salida.
end MUX_Freq_0;

architecture Behavioral of MUX_Freq_0 is

begin
     process(Freq,Dato)
		begin
       if Freq=0 then
	     Vout<=(others =>'0');
	    else
        Vout<=Dato;
	    end if;
		end process;
end Behavioral;

