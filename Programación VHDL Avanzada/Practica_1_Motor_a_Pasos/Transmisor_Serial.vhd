----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:37:34 03/31/2017 
-- Design Name: 
-- Module Name:    Transmisor_Serial - Behavioral 
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

entity Transmisor_Serial is
    Port ( clk : in  STD_LOGIC;--Señal de reloj de entrada.
           clr : in  STD_LOGIC;--Clear del transmisor serial.
           tx_data : in  STD_LOGIC_VECTOR (7 downto 0);--Registro de donde se toma el byte.
		     outp: in std_logic;--Señal que indica cuando puede empezar a transmitir (Activa la transmisiòn en alto).
           tdre : out  STD_LOGIC;--Bit que indica que se envió el dato completo o que el dispositivo puede transmitir(1).
           txd : out  STD_LOGIC);--Salida del transmisor serial.
end Transmisor_Serial;

architecture Behavioral of Transmisor_Serial is
type state_type is (mark,start,delay,shift,stop); --Máquina de estados
signal state: state_type;
signal txbuff: std_logic_vector(7 downto 0);--Buffer donde se guarda el dato a transmitir y que se recorre serialmente.
signal baud_count: std_logic_vector(11 downto 0);--Contador de tiempo para lograr los bauds requeridos.
signal bit_count: std_logic_vector(3 downto 0);--Contador de bits que se han transmitido por byte.
constant bit_time: std_logic_vector(11 downto 0) := X"a28";--Constante de tiempo equivalente a 9600 bauds.
signal clkdiv: std_logic_vector(0 downto 0);--Divisor de reloj.
--signal outp: std_logic;--Señal que indica cuando empezar a transmitir.
begin
 -- Señal de reloj
    process(clk)
    begin
	    if rising_edge(clk) then
		       clkdiv <= clkdiv +1;--Incrementa el contador en 1.
		  end if;
	end process;
	
	--Máquina de estados
	process(clkdiv(0),clr,outp)
	begin
	     if clr='1' then--Si el reset esta inactivo carga configuración inicial.
		     state <=mark;--Estado siguiente es mark.
			  txbuff<="00000000";--Limpia el buffer de datos.
			  baud_count<=X"000";--Contador de clk para los bauds en 0.
			  bit_count<="0000";--Contador de bits en 0.
			  txd<='1';--Transmisor serial es 1 que indica estado de reposo.
		 elsif rising_edge(clkdiv(0)) then--Elige clk como reloj de la máquina de estados.
			  case state is
			    when mark=>--Cuando se encuentra en mark(estado de inicio y espera).
	  			   bit_count<="0000";--Pone la cuenta de bits recorridos en 0.
				   tdre<='1';--El serial se encuentra listo o ya fue cargado en otro dispositivo.
				  if outp='0' then--Si no se quiere empezar a mandar un dato. 
				   state<=mark;--Asigna como estado siguiente a mark.
				   txbuff<=tx_data;--Carga el buffer con el registro de datos.
				  else--En caso que se quiera iniciar a mandar un dato se ejecuta.
					baud_count<=X"000";--Inicia la cuenta del tiempo de bauds requeridos en 0.
					state<=start;--Estado siguiente start.
				  end if;
				  
				when start=>--Cuando se encuentra en start(Estado de comienzo de comunicación serial).
				   baud_count<=X"000";--Inicia la cuenta del tiempo de bauds requeridos en 0.
					txd<='0';--Manda el bit de inicio.
				   tdre<='0';--Pone el bit de dato listo en 0. 
					state<= delay;--Pasa al siguiente estado "delay".
			
			    when delay=>--Estado de espera de tiempo de bauds
                  tdre<='0';--Pone el bit de dato listo en 0.
                  if baud_count>=bit_time then--Si se supera la cuenta reinicia el contador de bauds.
					   baud_count<=X"000";--Reinicia el contador de bauds.
						if bit_count<"1000" then--Si el conteo de bits es menor a 8.
						   state<=shift;--Asigna como estado siguiente a shift.
						else-- En caso contrario se el corrimiento.
						   state<=stop;--Asigna como estado siguiente a stop.
				        end if;
				  else--Si el contador de bauds es menor al tiempo requerido sigue esperando.
					   baud_count<=baud_count+1;--Aumenta en 1 el contador de bauds.
						state<=delay;--Asigna como siguiente estado a delay.
					end if;
					
				when shift=>--Estado de recorrimiento.
				     tdre<='0';--Pone el bit de dato listo en 0.
					  txd<=txbuff(0);--Carga a la salida el primer bit de txbuff.
					  txbuff(6 downto 0)<=txbuff(7 downto 1);--Hace el recorrimiento del dato.
					  bit_count<=bit_count+1;--Incrementa en 1 el conteo de bits enviados.
					  state<=delay;--Asigna como siguiente estado a delay.
					  
				when stop=>--Estado de parada.
          	      tdre<='0';--Pone el bit de dato listo en 0.
                  txd<='1';--Envia el bit de parada.
                  if baud_count>= bit_time then--Si se supera la cuenta reinicia el contador de bauds.
                     baud_count<=X"000";--Reinicia el contador de bauds.
					      state<=mark;--Asigna como estado siguiente a mark entrando a modo espera.
                  else--en caso contrario sigue contando.
                     baud_count<= baud_count+1;--Aumenta en 1 el contador de bauds.
                     state<=stop;--Asigna como estado siguiente a stop para seguir enviando el bit de parada.
                  end if;							
			  end case;
			end if;
	end process;
end Behavioral;

