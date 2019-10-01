----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:26:57 05/26/2016 
-- Design Name: 
-- Module Name:    Pract7_3 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Pract7_3 is port(
	clk,push: in std_logic;
	senal: out std_logic);
end Pract7_3;

architecture Behavioral of Pract7_3 is
signal state: std_logic;
type track is array(0 to 7) of integer;
signal cont: std_logic_vector(0 to 23);
signal reg: std_logic_vector(0 to 5);
signal x: std_logic_vector(19 downto 0);
signal clkx,clkn: std_logic;
type registros is array(0 to 63) of std_logic_vector(19 downto 0);--Declaración de la memoria con tamaño de dato de 20 bits y 64 registros.
constant regs:registros:=(x"139E0",x"139E0",x"139E0",x"00000",
								  x"107F1",x"107F1",x"107F1",x"00000",
								  x"0EB25",x"0EB25",x"0EB25",x"0EB25",
								  x"0EB25",x"0EB25",x"0EB25",x"00000",
											
											x"0EB25",x"0EB25",x"0EB25",x"0EB25",
											x"0EB25",x"0EB25",x"0EB25",x"00000",
											x"0EB25",x"0EB25",x"00B25",x"00000",
											x"0D17D",x"0D17D",x"0D17D",x"00000",
											
											x"0B028",x"0B028",x"0B028",x"0B028",
											x"0B028",x"0B028",x"0B028",x"00000",
											x"0B028",x"0B028",x"0B028",x"0B028",
											x"0B028",x"0B028",x"0B028",x"00000",
											
											x"0B028",x"0B028",x"0B028",x"00000",
											x"09CF0",x"09CF0",x"09CF0",x"00000",
											x"0D17D",x"0D17D",x"0D17D",x"0D17D",
											x"0D17D",x"0D17D",x"0D17D",x"00000");--Guarda las frecuencias de las canciones.
begin
	process(push)begin
		if(push='1')then--Si el pulsador es apretado se reproduce la canción.
			state<='1';
		else
			state<='0';
		end if;
	end process;

	process(clk,state)begin
		if(rising_edge(clk) and state='1')then--Incrementa el contador con cada pulso de reloj.
			cont<=cont+1;
		end if;
	end process;
	clkx<=cont(0);--Selecciona la fuente de reloj con el bit cero.
	clkn<=cont(19);--Selecciona la fuente de reloj con el bit 19.
	
	process(clkn,state)begin
		if(rising_edge(clkn) and state='1')then--Incrementa la dirección con cada pulso de clkn.
			reg<=reg+1;
		end if;
	end process;
	x<=regs(conv_integer(reg));--Guarda en x en valor de la dirección asignada.

	process(x,clkx,state)
	variable i:integer;
	begin
		if(state='1')then
			if(rising_edge(clkx))then
				i:=i+1;--Incrementa el contador.
				if(i<x)then--Pone en 1 a la salida si es menor que el dato deseado.
					senal<='1';
				elsif(i=x+x)then--Pone en 0 a la salida si es menor que el dato deseado.
					senal<='0';
					i:=0;
				else--En otro caso pone 0 en la salida.
					senal<='0';
				end if;
			end if;
		end if;
	end process;

end Behavioral;