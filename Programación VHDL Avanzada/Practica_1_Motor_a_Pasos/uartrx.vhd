----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:39:15 03/03/2017 
-- Design Name: 
-- Module Name:    uartrx - Behavioral 
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

entity uartrx is
    Port ( rxd : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           rdrf_clr : in  STD_LOGIC;
           rdrf : out  STD_LOGIC;
           fe : out  STD_LOGIC;
           rx_data : out  STD_LOGIC_VECTOR (7 downto 0));
end uartrx;

architecture Behavioral of uartrx is
type state_type is (mark,start,delay,shift,stop);
signal state: state_type;
signal rxbuff: std_logic_vector(7 downto 0);
signal baud_count: std_logic_vector(11 downto 0);
signal bit_count: std_logic_vector(3 downto 0);
constant bit_time: std_logic_vector(11 downto 0):=X"A28";
constant half_bit_time: std_logic_vector(11 downto 0):=X"514";
signal clkdiv: std_logic_vector(0 downto 0);
signal contador: std_logic_vector(3 downto 0):="0000";
begin 
	process(clk)
	begin
		if rising_edge(clk) then
			clkdiv <= clkdiv +1;
		end if;
	end process; 
	
	process(clkdiv(0),clr,rdrf_clr)
	begin
		if clr ='1' then--Si el reset esta activo carga configuración inicial.
			state <= mark;--Regresa al estado de mark.
			rxbuff <="00000000";--Carga el buffer con 0.
			baud_count <=x"000";--Contador de clk para los bauds en 0.
			bit_count <= "0000";--Contador de bits en 0.
			rdrf <= '0';--Bit de recepción con 0.
			fe <= '0';--Bit de error de frame en 0.
		elsif rdrf_clr = '1' then--Si hay un clr en rdrf_clr.
			rdrf <= '0';--Resetea a rdrf.
		elsif rising_edge(clkdiv(0)) then--Elige como reloj de la máquina de estados a clkdiv.
			case state is
				when mark =>--Estado de espera de dato.
					baud_count <=x"000";--Contador de clk para los bauds en 0.
					bit_count <= "0000";--Contador de bits en 0.
					rdrf <='0';
						if rxd = '1' then--Si esta en estado de reposos.
							state <= mark;--Continua en el estado de espera.
						else--En caso contrario.
							state <= start;--Pasa a estado de inicio de detección de bits.
							fe <= '0';--Bit de error de frame en 0.
						end if;
						
				when start =>--Estado de inicio.
					if baud_count >= half_bit_time then--Si el conteo de bauds es mayor a half_bit_time lee el dato.
						baud_count <= x"000";--Contador de clk para los bauds en 0.
						state <= delay;--Pasa al estado de delay.
					else--En caso contrario sigue contando.
						baud_count <= baud_count + 1;--Incrementa en 1 baud_count para seguir con el conteo.
						state <= start;--Continua en el estado de inicio.
					end if;
					
				when delay =>--Estado de delay(Tiempo de espera hasta completar la trama).
					if baud_count>= bit_time then--Si baud_count es mayor a bit time lee el bit.
						baud_count <= x"000";--Contador de clk para los bauds en 0.
							if bit_count < "1000" then--Si no han completado los 8 bits.
								state<= shift;--Pasa al estado de shift.
							else--Si se completo la cuenta de bits carga a rx_data con lo que hay en el buffer.
								rx_data <= rxbuff;--Carga a rx_data con lo que hay en el buffer.
								state <= stop;--Pasa al estado de stop.
							end if;
					else
						baud_count <= baud_count +1;--Incrementa en 1 baud_count para seguir con el conteo.
						state <= delay;--Continua en el estado de delay.
					end if;
					
				when shift =>--Estado de recorrimiento.
					rxbuff(7) <= rxd;--Carga al bit 7 lo que hay en el pin rxd.
					rxbuff(6 downto 0) <= rxbuff(7 downto 1);--Realiza un recorrimiento de bits.
					bit_count <= bit_count + 1;--Incrementa en 1 baud_count para seguir con el conteo.
					state <= delay;--Pasa al estado de delay.
					
				when stop =>--Estado de reconocimiento de bit de parada.
					rdrf <= '1';--Bit de recepción con 1.
						if rxd = '0' then--Si el bit de parada en 0 hay un error en la trama.
							fe <= '1';--Bit de error de trama con 1 indicando que hay un error en la trama.
						else--Si el bit de parada es 1 la trama es correcta.
							fe <= '0';--Bit de error de trama con 0 indicando que la trama es correcta.
						end if;
					if contador<=9 then
					 contador<=contador+1;
					 state <=stop;--Pasa al estado de mark(estado de reposo o espera).
					else
					 contador<="0000";
					 state <= mark;--Pasa al estado de mark(estado de reposo o espera).
					end if;
			end case;
		end if;
	end process;
end Behavioral;