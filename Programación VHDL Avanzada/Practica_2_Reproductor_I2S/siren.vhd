----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:24:41 05/06/2013 
-- Design Name: 
-- Module Name:    siren - Behavioral 
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



entity siren is
	Port (   clk_50MHz : in STD_LOGIC; -- system clock (50 MHz)
				dac_MCLK : out STD_LOGIC; -- outputs to PMODI2L DAC Reloj de operaciòn de la DAC.
				dac_LRCK : out STD_LOGIC;--Seleccion del canal.
				dac_SCLK : out STD_LOGIC;--Señal de reloj para sincronizar dato.
				dac_SDIN : out STD_LOGIC;--Salida de dato serial.
				Salidas_7segc : out  STD_LOGIC_VECTOR (7 downto 0);
			   Control_Disp_7segc: out  STD_LOGIC_VECTOR (3 downto 0));
	end siren;
architecture Behavioral of siren is

component Leds_Display_7 is
    Port ( clkin : in  STD_LOGIC;
	        Entrada_Disp_1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Entrada_Disp_2 : in  STD_LOGIC_VECTOR (7 downto 0);
           Entrada_Disp_3 : in  STD_LOGIC_VECTOR (7 downto 0);
           Entrada_Disp_4 : in  STD_LOGIC_VECTOR (7 downto 0);
           Salidas_7seg : out  STD_LOGIC_VECTOR (7 downto 0);
           Control_Disp_7seg : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
--constant wail_speed: UNSIGNED (7 downto 0) := to_unsigned (8, 8); -- sets wailing speed
 
component dac_if is
	Port ( SCLK : in STD_LOGIC;
			 L_start: in STD_LOGIC;
			 R_start: in STD_LOGIC;
			 L_data : in signed (15 downto 0);
			 R_data : in signed (15 downto 0);
			 SDATA : out STD_LOGIC);
end component;

component wail is
   	Port ( wclk : in STD_LOGIC; -- wailing clock (47.6 Hz), duracion base de una nota.
				 audio_clk : in STD_LOGIC; --Frecuencia de muestreo, Reloj de audio a 48,828.125Hz (t=256 veces MCLK),LRCK,equivalente a 1 muestra analogica.
				 M: in  STD_LOGIC_VECTOR (23 downto 0);--Entrada de la memoria.
				 rom_addr : out  STD_LOGIC_VECTOR (7 downto 0);--Direccion a la que se quiere acceder de la memoria.
				 audio_data : out SIGNED (15 downto 0)); -- output audio sequence (wailing tone),Señal de salida.
end component;

component Cancion_ROM is
      Port (clka : IN STD_LOGIC;
            addra : IN STD_LOGIC_VECTOR(7 downto 0);
            douta : OUT STD_LOGIC_VECTOR(23 downto 0));
end component;
signal tcount: unsigned (19 downto 0) := (others=>'0'); -- timing counter
signal data_L, data_R: SIGNED (15 downto 0); -- 16-bit signed audio data
signal dac_load_L, dac_load_R,clk50: STD_LOGIC; -- timing pulses to load DAC shift reg.
signal slo_clk, sclk, audio_CLK: STD_LOGIC;
signal Direccion_ROM :STD_LOGIC_VECTOR(7 downto 0);
signal Salida_ROM: STD_LOGIC_VECTOR(23 downto 0);
signal Display_1c,Display_2c,Display_3c,Display_4c: STD_LOGIC_VECTOR (7 downto 0);
begin
-- this process sets up a 20 bit binary counter clocked at 50MHz. This is used
-- to generate all necessary timing signals. dac_load_L and dac_load_R are pulses
-- sent to dac_if to load parallel data into shift register for serial clocking
-- out to DAC
     Display_1c<="10101010";
	  Display_2c<=Salida_ROM(23 downto 16);--rx_datac;
	  Display_3c<=Salida_ROM(15 downto 8);--Data_2;--Data_0;
	  Display_4c<=Salida_ROM(7 downto 0);--rx_datac;--Datos_Rxc;
	tim_pr: process
			  begin
			   wait until rising_edge(clk_50MHz);--Detectar pulso de reloj.
				     --Pulso para cargar dato al canal Izquierdo.
					   if (tcount(9 downto 0)>= X"00F") and (tcount(9 downto 0) < X"02E") then
							 dac_load_L <= '1';--"01F"=>31 pulsos de 50MHz=0.620us.
					   else 
					       dac_load_L <= '0';--"0C3"=>195 pulsos de 50MHz=3.900us.
					   end if;
						--Pulso para cargar dato al canal Derecho.
					   if (tcount(9 downto 0) >= X"20F") and (tcount(9 downto 0) < X"22E") then
							 dac_load_R <= '1';--"01F"=>31 pulsos de 50MHz=0.620us.
					   else 
						    dac_load_R <= '0';--"0C3"=>195 pulsos de 50MHz=3.900us.
					   end if;
			   tcount <= tcount+1;
           end process;

dac_MCLK <= not tcount(1); -- DAC master clock (12.5 MHz), MCLK_Dac a 12.5MHz.
audio_CLK <= tcount(9); -- audio sampling rate (48.8 kHz), Reloj de audio a 48,828.125Hz (t=256 veces MCLK).
dac_LRCK <= audio_CLK; -- also sent to DAC as left/right clock, Pulso de canal L/R.
sclk <= tcount(4); -- serial data clock (1.56 MHz),Frecuencia de envio de datos (t=8 veces MCLK) =1562.5KHz.
dac_SCLK <= sclk; -- also sent to DAC as SCLK,Reloj de la transmicion de datos.
slo_clk <= tcount(19); -- clock to control wailing of tone (47.6 Hz), Reloj para controlar que tanto dura una nota.

dac: dac_if port map ( SCLK => sclk, -- instantiate parallel to serial DAC interface, Frecuencia de envio de datos t=8 veces MCLK) =1562.5KHz.
								L_start => dac_load_L,--Pulso para cargar dato al canal Izquierdo.
								R_start => dac_load_R,--Pulso para cargar dato al canal Derecho.
								L_data => data_L,--Datos del canal Izquierdo.
								R_data => data_R,--Datos del canal Derecho.
								SDATA => dac_SDIN );--Salida de datos seriales.

w1: wail port map(	wclk => slo_clk,--Reloj del tono base.
							audio_clk => audio_clk,-- Reloj de audio a 48,828.125Hz (t=256 veces MCLK),LRCK.
							audio_data => data_L,--Word a enviar a la Dac con el valor que se quiere.
							M => Salida_ROM,--Dato leìdo.
				         rom_addr => Direccion_ROM);--Direccion a la que se quiere acceder de la memoria.
							data_R <= data_L; -- duplicate data on right channel
							
ROM1: Cancion_ROM port map(clka => tcount(1),
                           addra => Direccion_ROM,
                           douta => Salida_ROM);
clk50<=clk_50MHz;
U7Seg: Leds_Display_7 port map ( clkin => clk50,
	                             Entrada_Disp_1 => Display_1c,
                                Entrada_Disp_2 => Display_2c,
                                Entrada_Disp_3 => Display_3c,
                                Entrada_Disp_4 => Display_4c,
                                Salidas_7seg => Salidas_7segc,
                                Control_Disp_7seg => Control_Disp_7segc);
end Behavioral;