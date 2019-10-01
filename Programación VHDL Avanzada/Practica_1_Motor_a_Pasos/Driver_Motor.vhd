----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:57:33 03/12/2017 
-- Design Name: 
-- Module Name:    Driver_Motor - Behavioral 
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

entity Driver_Motor is
    Port ( clk_M : in  STD_LOGIC;--Reloj del Contador del Motor.
	        clk_P : in  STD_LOGIC;--Reloj del contador de Posiciòn.
           selector : in  STD_LOGIC;--Selector de giro del motor
           reset : in  STD_LOGIC;--Reset de los contadores
           Salida : out  STD_LOGIC_VECTOR (3 downto 0);--Salida al motor a pasos.
           Cuenta : out  STD_LOGIC_VECTOR (4 downto 0));--Salida que indica en que posicion se encuentra.
end Driver_Motor;

architecture Behavioral of Driver_Motor is
signal Contador1:STD_LOGIC_VECTOR (1 downto 0):="00";--Contador para bobinas del motor a pasos.
signal Contador2:STD_LOGIC_VECTOR (4 downto 0):="00000";--Contador para las 20 posiciones del motor a pasos.
begin
     --Generación de los contadores para el motor a pasos y su posición.
     process(clk_M,selector,reset)
	  begin
	      if reset='1' then
			Contador1<= (others => '0');
			elsif rising_edge(clk_M) then
				if selector='1' then--Giro Horario.
				   Contador1<=Contador1+1;
				else--Giro Antihorario.
				   Contador1<=Contador1-1;
				end if;
			end if;
	  end process;
	  process(clk_P,selector,reset)
	  begin
	      if reset='1' then
			Contador2<= (others => '0');
			elsif rising_edge(clk_P) then
				if selector='1' then--Giro Horario.
				   if Contador2>=19 then--Si excede en 20 se resetea.
					   Contador2<=(others=>'0');--Resetea el registro.  
					else
					   Contador2<=Contador2+1;--Incrementa si es menor a 20.
					end if;
				else--Giro Antihorario.
				   if Contador2=0 then--Si el contador es igual a 0 resetea en 19.
					   Contador2<="10011";--Resetea la contador en 19=10011.
					else
					   Contador2<=Contador2-1;--Decrementa si es distinto de 0.
					end if;
				end if;
			end if;
	  end process;
	  --Decodificacion del conteo para generar la señal que va a al motor a pasos.
	  process(Contador1)
	  begin
	     case Contador1 is--Elegir Contador1 como señal para hacer la decodificación.
          when "00" => Salida<="1010";--"0001";--Primera posición del motor a pasos.
          when "01" => Salida<="1001";--"0010";--Segunda posición del motor a pasos.
          when "10" => Salida<="0101";--"0100";--Tercera posición del motor a pasos.
		  when others  => Salida<="0110";--"1000";--Cuarta posición del motor a pasos.
         end case;
	  end process;
	  process(Contador2) begin
	      Cuenta<=Contador2;
	  end process;
end Behavioral;

