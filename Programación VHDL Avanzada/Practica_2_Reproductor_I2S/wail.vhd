----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:20:50 05/06/2013 
-- Design Name: 
-- Module Name:    wail - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Generates a "wailing siren" sound by instancing a "tone" module and modulating
-- the pitch of the tone. The pitch is increased until it reaches hi_pitch and then
-- decreased until it reaches lo_pitch and then increased again...etc.

entity wail is
		Port (   wclk : in STD_LOGIC; -- wailing clock (47.6 Hz), duracion base de una nota.
				 audio_clk : in STD_LOGIC; --Frecuencia de muestreo, Reloj de audio a 48,828.125Hz (t=256 veces MCLK),LRCK,equivalente a 1 muestra analogica.
				 M : in  STD_LOGIC_VECTOR (23 downto 0);--Entrada de la memoria.
				 rom_addr : out  STD_LOGIC_VECTOR (7 downto 0);--Direccion a la que se quiere acceder de la memoria.
				 audio_data : out SIGNED (15 downto 0)); -- Señal de salida con el dato de 16 bits.
end wail;

architecture Behavioral of wail is
component tone is
	Port ( clk : in STD_LOGIC;--Reloj.
	       pitch : in UNSIGNED (13 downto 0);--Frecuencia.
	       data : out SIGNED (15 downto 0));--Dato.
end component;

signal curr_pitch: UNSIGNED (13 downto 0); -- current wailing pitch-Frecuencia que se quiere.
signal curr_pitch1: STD_LOGIC_VECTOR (13 downto 0);
signal count_direccion: STD_LOGIC_VECTOR (7 downto 0);--Dirección a la que se quiere acceder de la memoria.
signal wspeed : STD_LOGIC_VECTOR (7 downto 0):=0x"00"; -- speed of wail in pitch units/wclk.--Numero de repeticiones cada una de duracion (1/47.6).
begin
-- this process modulates the current pitch. It keep a variable updn to indicate
-- whether tome is currently rising or falling. Each wclk period it increments
-- (or decrements) the current pitch by wspeed. When it reaches hi_pitch, it
-- starts counting down. When it reaches lo_pitch, it starts counting up
	wp: process(wclk)
	begin
      if rising_edge(wclk) then
		    wspeed<=M(23 downto 16);
			 curr_pitch1<=M(13 downto 0);
		    if count_direccion<170 then
			       count_direccion<=count_direccion+1;
			    else
			       count_direccion<=(others=>'0');
			    end if;
		end if;
	end process;
rom_addr<=count_direccion;
curr_pitch<=unsigned(curr_pitch1);
tgen: tone port map( clk => audio_clk, --Frecuencia de muestreo
				     pitch => curr_pitch, --Frecuencia que se quiere mandar.
				     data => audio_data);--Dato de salida para la DAC en un word de 16 bits.
end Behavioral;