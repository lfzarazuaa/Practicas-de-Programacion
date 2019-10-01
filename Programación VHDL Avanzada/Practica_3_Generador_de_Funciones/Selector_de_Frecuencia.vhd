----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:27 05/20/2017 
-- Design Name: 
-- Module Name:    Selector_de_Frecuencia - Behavioral 
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

entity Selector_de_Frecuencia is
    Port ( clk_in : in  STD_LOGIC;
        	  Escala : in  STD_LOGIC_VECTOR (1 downto 0);
           Boton_Subida : in  STD_LOGIC;
           Boton_Bajada : in  STD_LOGIC;
           Frecuencia : inout  STD_LOGIC_VECTOR (13 downto 0):="00000000000000");
end Selector_de_Frecuencia;

architecture Behavioral of Selector_de_Frecuencia is
signal Contador,Contador2: SIGNED(14 downto 0);--14 Signo 13-0 Dato.
signal Cantidad: SIGNED(10 downto 0);--10 Signo 9-0 Dato.
type state_type is (Inicio,Reposo,Verificacion_1,Esperar_1,Verificacion_2,Esperar_2,Cargar_Frecuencia);
signal state: state_type;
signal clkdiv: std_logic_vector(0 downto 0);
begin
--Divisor de Frecuencia
   process(clk_in)
	 begin
		if rising_edge(clk_in) then
			clkdiv <= clkdiv +1;
		end if;
	end process;
	--Selector de Factor
    with Escala select
    Cantidad <=  "00000000001" when "00",--Declaración del factor X1.
                 "00000001010" when "01",--Declaración del factor X10.
			     "00001100100" when "10",--Declaración del factor X100.
                 "01111101000" when others;--Declaración del factor X1000.
 --Màquina de Estados.	
 process(clkdiv(0),Boton_Subida,Boton_Bajada,Cantidad)
	begin
		if rising_edge(clkdiv(0)) then--Elige como reloj de la máquina de estados a clkdiv.
			case state is
				when  Inicio =>--Estado de Inicio
				      Frecuencia<="00001111101000";--Frecuencia Inicial de 1000Hz.
						Contador<="000001111101000";
						state <=Reposo;
				when  Reposo =>--Estado de Inicio
				      if Boton_Subida='1' then
							Contador2<=Contador+Cantidad;
						   state <=Verificacion_1;
						elsif Boton_Bajada='1' then
						   Contador2<=Contador-Cantidad;
						   state <=Verificacion_2;
						else
						   --Contador2<=Contador2;
						   state <=Reposo;
						end if;
				when  Verificacion_1 =>--Estado de Verificación
				      if Contador2>9999 then
						   Contador<=Contador;
						else
						   Contador<=Contador2;
						end if;
						state<=Esperar_1;
				when  Esperar_1 =>--Estado de Espera_1
				      if Boton_Subida='0' then
						   state<=Cargar_Frecuencia;
						else
						   state<=Esperar_1;
						end if;
				when  Verificacion_2 =>--Estado de Inicio
				      if Contador2<=0 then
						   if Contador2=0 then
						      Contador<=(others =>'0');
							else
								Contador<=Contador;
						   end if;
						else
						   Contador<=Contador2;
						end if;
						state<=Esperar_2;
				when  Esperar_2 =>--Estado de Inicio
				      if Boton_Bajada='0' then
						   state<=Cargar_Frecuencia;
						else
						   state<=Esperar_2;
						end if;
				when  Cargar_Frecuencia =>--Estado de Inicio
				      Frecuencia<=std_logic_vector(Contador(13 downto 0));
						state <=Reposo;
			end case;
		end if;
	end process;
end Behavioral;