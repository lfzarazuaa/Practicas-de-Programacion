----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:53:06 04/06/2017 
-- Design Name: 
-- Module Name:    Principal - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use work.costal.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Principal is
       Port ( clk_nexys : in  STD_LOGIC;
              RX_Data : in  STD_LOGIC;
			     Data_Tx : out  STD_LOGIC;
              Sal_Motor: out  STD_LOGIC_VECTOR (3 downto 0);
              Salidas_7segc : out  STD_LOGIC_VECTOR (7 downto 0);
			     Control_Disp_7segc: out  STD_LOGIC_VECTOR (3 downto 0));
              
end Principal;

architecture Behavioral of Principal is
signal ready_xd,fec: std_logic;
signal rx_datac: std_logic_vector(7 downto 0);
signal Data_0 : STD_LOGIC_VECTOR (7 downto 0);
signal Data_1 : STD_LOGIC_VECTOR (7 downto 0);
signal Data_2 : STD_LOGIC_VECTOR (7 downto 0);
signal Datos_Rxc : STD_LOGIC_VECTOR (7 downto 0);
signal Display_1c,Display_2c,Display_3c,Display_4c: STD_LOGIC_VECTOR (7 downto 0);
signal dsalida :  STD_LOGIC;
signal auxclk1,auxclk2,auxclk3: std_logic;
signal Act_Pasosc,Giroc:  STD_LOGIC;
signal Pasosc :  STD_LOGIC_VECTOR (4 downto 0);
signal Velocidadc :  STD_LOGIC_VECTOR (3 downto 0);
signal Sal_Posicionc : STD_LOGIC_VECTOR (4 downto 0);
signal Inicioc,tdrec: std_logic;
signal tx_datac: std_logic_vector(7 downto 0);
signal Sal_Motorc:  STD_LOGIC_VECTOR (3 downto 0);
constant Var_logica: std_logic_vector(3 downto 0):=X"2";
begin
     Sal_Motor<=Sal_Motorc;
     Display_1c<=(auxclk1&auxclk2&auxclk3&"0"&Sal_Motorc);
	  Display_2c<=Data_1;--rx_datac;
	  Display_3c<="000"&Sal_Posicionc;--Data_2;--Data_0;
	  Display_4c<="0000"&Velocidadc;--rx_datac;--Datos_Rxc;
	  --bloque Transmision Serial
u1: uartrx port map( rxd => RX_Data,--Entrada serial de 1 bit.
                     clk => clk_nexys,--Reloj de entrada.
                     clr => Var_logica(0),--Cero_logico en el clr.
                     rdrf_clr => Var_logica(0),--Cero lógico en el clear de bit de recepción.
                     rdrf => ready_xd,--Señal de recepción de reloj.
                     fe => fec,--Error en el frame.
                     rx_data => rx_datac);--Salida que indica en que posición se encuentra(8 bits).
	--bloque de Memoria de 3 bytes					 
u2: Almc_FFD port map(clk => ready_xd,--Reloj para actualizar Flip Flop D.
                      condicional => fec,--Condicional si hay error en el dato.
                      Din => rx_datac,--Dato de entrada (Byte).
                      D2 => Data_2,--Tercer Dato Recibido.
                      D1 => Data_1,--Segundo Dato Recibido.
                      D0 => Data_0,--Primer Dato Recibido.
                      dout => dsalida);
							 
u3: Decodificador_Serial port map( clk => clk_nexys,--Reloj de la Nexys.
                                   clr => Var_logica(0),--Clear.
                                   Lectura => ready_xd,--Bit de inicio de Lectura de datos.
                                   Reg1 => Data_2,--Byte de Unidades.
                                   Reg2 => Data_1,--Byte de Decenas.
                                   Reg3 => Data_0,--Byte de Opción.
                                   Giro => Giroc,--Bit de salida que indica el giro.
                                   act_pasos => Act_Pasosc ,--Señal de guardado de pasos(Salida).
                                   Pasos=> Pasosc,--Salida de Número de pasos a avanzar (5 bits).
                                   Sal_Velocidad=> Velocidadc,--Salida de 4 bits para elegir la velocidad.
								           Datos=> Datos_Rxc);--Datos recibidos.
	--Circuito de muestreo de Leds
u4: Leds_Display_7 port map( clkin => clk_nexys,
	                          Entrada_Disp_1 => Display_1c,
                             Entrada_Disp_2 => Display_2c,
                             Entrada_Disp_3 => Display_3c,
                             Entrada_Disp_4 => Display_4c,
                             Salidas_7seg => Salidas_7segc,
                             Control_Disp_7seg => Control_Disp_7segc);
	--bloque divisor					 
u5: Selector_Velocidad port map( clk => clk_nexys,--Reloj de la Nexys.
                                 Selector => Velocidadc,--Entrada de 4 bits para elegir la velocidad.
                                 clksal => auxclk1);--Reloj de salida con la frecuencia requerida.
	--bloque comparador para saber cuantos pasos queremos.
u6: Contador_Comparador port map( clk=> auxclk1,--Reloj de entrada con la frecuencia requerida.
                                  Numero=> Pasosc,--Entrada de Número de pasos a avanzar (5 bits).
                                  Actualizar=> Act_Pasosc,--Señal de guardado de pasos (Entrada).
                                  clksal=>auxclk2,--Reloj de salida con la frecuencia requerida y los pasos deseados(TX1).
											 clksal2=>auxclk3);--Reloj de salida con la frecuencia requerida y los pasos deseados(TX10).
	  --bloque Driver_Motor
u7: Driver_Motor port map( clk_M =>auxclk2,--Reloj del Contador del Motor.
	                       clk_P =>auxclk3,--Reloj del contador de Posición. 
                           --clk =>auxclk2,--Reloj de entrada con la frecuencia requerida y los pasos deseados.
                           selector =>Giroc,--Bit de entrada que indica el giro.
                           reset =>Var_logica(0),--Reset del contador en 0.
                           Salida =>Sal_Motorc,--Salida al motor.
                           Cuenta =>Sal_Posicionc);--Salida que indica en que posición se encuentra el motor.

	  --bloque Transmision Serial
u8: Decodificador_Tx_Serial port map( clk => clk_nexys,--Reloj de la Nexys.
	                                   clr => Var_logica(0),--Clear del decodificador en 0.
                                      Enviar => auxclk3,--Reloj de entrada con la frecuencia requerida y los pasos deseados.
                                      Entrada => Sal_Posicionc,--Entrada que indica en que posición se encuentra el motor.
                                      tdrel => tdrec,--Señal que indica que se puede transmitir otra vez.
                                      Registro_Tx => tx_datac,--Registro que manda el byte.
                                      Inicio => Inicioc);--Señal que indica cuando puede empezar a transmitir.
	--bloque de Memoria de 3 bytes					 
u9: Transmisor_Serial port map( clk => clk_nexys,--Señal de reloj de entrada.
                                clr => Var_logica(0),--Clear del transmisor serial.
                                tx_data  => tx_datac,--Registro de donde se toma el byte.
			                    outp => Inicioc,--Señal que indica cuando puede empezar a transmitir (Activa la transmisiòn en alto).
                                tdre => tdrec,--Bit que indica que se envió el dato completo o que el dispositivo puede transmitir(1).
                                txd => Data_Tx);--Salida del transmisor serial.
end Behavioral;