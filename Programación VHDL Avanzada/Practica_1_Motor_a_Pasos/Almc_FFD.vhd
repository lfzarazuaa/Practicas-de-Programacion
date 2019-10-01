----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:42:58 03/29/2017 
-- Design Name: 
-- Module Name:    Almc_FFD - Behavioral 
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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Almc_FFD is
    Port ( clk : in  STD_LOGIC;--Reloj para actualizar Flip Flop D
           condicional : in  STD_LOGIC;--Condicional si hay error en el dato
           Din : in  STD_LOGIC_VECTOR (7 downto 0);--Dato de entrada (Byte).
           D2 : out  STD_LOGIC_VECTOR (7 downto 0);--Tercer Dato Recibido.
           D1 : out  STD_LOGIC_VECTOR (7 downto 0);--Seguundo Dato Recibido.
           D0 : out  STD_LOGIC_VECTOR (7 downto 0);--Primer Dato Recibido.
           dout : out  STD_LOGIC);--Senñal que indica que todos los datos fueron recibidos.
end Almc_FFD;

architecture Behavioral of Almc_FFD is
signal permiso: STD_LOGIC;
signal Flancos: STD_LOGIC_VECTOR (3 downto 0):=x"0";
signal XD0,XD1,XD2: STD_LOGIC_VECTOR (7 downto 0):=x"00";
begin
     process(clk,condicional,Din,permiso,XD0,XD1,XD2)
	  begin
	       --if (rising_edge(clk) or falling_edge(clk)) then
			 if (rising_edge(clk)) then 
			     if condicional='0' then--Si no hay error recibe datos.
				     XD0<=XD1;
				     XD1<=XD2;
				     XD2<=Din;
					 if Flancos<x"4" then
				     Flancos<=Flancos+1;
				    else
				     Flancos<=x"0";
				    end if;
				  	 if Flancos=x"3" then
				  	  permiso<='1';
				  	 else
				     permiso<='0';
				    end if;
				  end if;				  
		    end if;
			 D0<=XD0;
			 D1<=XD1;
			 D2<=XD2;
			 dout<=permiso and clk;
	  end process;
end Behavioral;