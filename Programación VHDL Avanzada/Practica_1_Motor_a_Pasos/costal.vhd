--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
--use work.costal.all;--Toda la biblioteca.
package costal is

component uartrx is
    Port ( rxd : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           rdrf_clr : in  STD_LOGIC;
           rdrf : out  STD_LOGIC;
           fe : out  STD_LOGIC;
           rx_data : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Almc_FFD is
    Port ( clk : in  STD_LOGIC;--Reloj para actualizar Flip Flop D
           condicional : in  STD_LOGIC;--Condicional si hay error en el dato
           Din : in  STD_LOGIC_VECTOR (7 downto 0);--Dato de entrada (Byte).
           D2 : out  STD_LOGIC_VECTOR (7 downto 0);--Tercer Dato Recibido.
           D1 : out  STD_LOGIC_VECTOR (7 downto 0);--Seguundo Dato Recibido.
           D0 : out  STD_LOGIC_VECTOR (7 downto 0);--Primer Dato Recibido.
           dout : out  STD_LOGIC);--Senñal que indica que todos los datos fueron recibidos.
end component;

component Decodificador_Serial is
    Port ( clk : in  STD_LOGIC;--Reloj de la Nexys.
           clr : in  STD_LOGIC;--Clear.
           Lectura : in  STD_LOGIC;--Bit de inicio de Lectura de datos.
           Reg1 : in  STD_LOGIC_VECTOR (7 downto 0);--Byte de Unidades.
           Reg2 : in  STD_LOGIC_VECTOR (7 downto 0);--Byte de Decenas.
           Reg3 : in  STD_LOGIC_VECTOR (7 downto 0);--Byte de Opcion.
           Giro : out  STD_LOGIC;--Bit que indica el giro.
           act_pasos : out  STD_LOGIC;--Señal de guardado de pasos.
           --act_vel : out  STD_LOGIC;--Señal de guardado de velocidad.
           Pasos : out  STD_LOGIC_VECTOR (4 downto 0);--Numero de pasos a avanzar.
           Sal_Velocidad : out  STD_LOGIC_VECTOR (3 downto 0);
		   Datos: out  STD_LOGIC_VECTOR (7 downto 0));--Contenido de los registros.
end component;

component Leds_Display_7 is
    Port ( clkin : in  STD_LOGIC;
	        Entrada_Disp_1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Entrada_Disp_2 : in  STD_LOGIC_VECTOR (7 downto 0);
           Entrada_Disp_3 : in  STD_LOGIC_VECTOR (7 downto 0);
           Entrada_Disp_4 : in  STD_LOGIC_VECTOR (7 downto 0);
           Salidas_7seg : out  STD_LOGIC_VECTOR (7 downto 0);
           Control_Disp_7seg : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Selector_Velocidad is
    Port ( clk : in  STD_LOGIC;
           Selector : in  STD_LOGIC_VECTOR (3 downto 0);
           clksal : out  STD_LOGIC);
end component;
		   
component Contador_Comparador is
    Port ( clk : in  STD_LOGIC;
           Numero : in  STD_LOGIC_VECTOR (4 downto 0);
           Actualizar : in  STD_LOGIC;
           clksal : out  STD_LOGIC;
			  clksal2 : out  STD_LOGIC);
end component;

component Driver_Motor is
    Port ( clk_M : in  STD_LOGIC;--Reloj del Contador del Motor.
	        clk_P : in  STD_LOGIC;--Reloj del contador de Posici�n.
           selector : in  STD_LOGIC;--Selector de giro del motor
           reset : in  STD_LOGIC;--Reset de los contadores
           Salida : out  STD_LOGIC_VECTOR (3 downto 0);--Salida al motor a pasos.
           Cuenta : out  STD_LOGIC_VECTOR (4 downto 0));--Salida que indica en que posicion se encuentra.
end component;

component Decodificador_Tx_Serial
    Port ( clk : in  STD_LOGIC;
	        clr: in  STD_LOGIC;
           Enviar : in  STD_LOGIC;
           Entrada : in  STD_LOGIC_VECTOR (4 downto 0);
           tdrel : in  STD_LOGIC;
           Registro_Tx : inout  STD_LOGIC_VECTOR (7 downto 0):=X"00";
           Inicio : out  STD_LOGIC);
end component;

component Transmisor_Serial
    Port ( clk : in  STD_LOGIC;--Señal de reloj de entrada.
           clr : in  STD_LOGIC;--Clear del transmisor serial.
           tx_data : in  STD_LOGIC_VECTOR (7 downto 0);--Registro de donde se toma el byte.
		     outp: in std_logic;--Señal que indica cuando puede empezar a transmitir (Activa la transmisiòn en alto).
           tdre : out  STD_LOGIC;--Bit que indica que se envió el dato completo o que el dispositivo puede transmitir(1).
           txd : out  STD_LOGIC);--Salida del transmisor serial.
end component;
end costal;
