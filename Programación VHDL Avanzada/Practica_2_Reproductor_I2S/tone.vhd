----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:14:59 05/06/2013 
-- Design Name: 
-- Module Name:    tone - Behavioral 
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

-- Generates a 16-bit signed triangle wave sequence at a sampling rate determined
-- by input clk and with a frequency of (clk*pitch)/65,536

entity tone is
   Port ( clk : in STD_LOGIC; -- 48.8 kHz audio sampling clock, Frecuencia de muestreo.
			 pitch : in UNSIGNED (13 downto 0); -- frequency (in units of 0.745 Hz), Frecuencia que se quiere mandar*0.745.
 			 data : out SIGNED (15 downto 0)); -- signed triangle wave out.
			 --pitch=frecuencia_requerida*50e6/(pot(2,26)).
end tone;

architecture Behavioral of tone is
signal count: unsigned (15 downto 0); -- represents current phase of waveform.
signal quad: std_logic_vector (1 downto 0); --Indica en que region se encuentra.
signal index: signed (15 downto 0); -- index into current quadrant.

begin
-- This process adds "pitch" to the current phase every sampling period. Generates
-- an unsigned 16-bit sawtooth waveform. Frequency is determined by pitch. For
-- example when pitch=1, then frequency will be 0.745 Hz. When pitch=16,384, frequency
-- will be 12.2 kHz.
cnt_pr: process
begin
	wait until rising_edge(clk);
		count <= count + pitch;--Contador que aumenta pitch unidades por cada muestreo.
	end process;
	quad<= std_logic_vector(count(15 downto 14));--Escoge en que fase de la señal va.
	index <= signed("00" & count(13 downto 0));--Cambia el tipo de dato a signed y asigna el valor de la señal.
	with quad select
	     data <= index when "00",--Genera la primera rampa.
	             16383 - index when "01",--Genera la primera caida hasta cero.
                0 -index when "10",--Genera la segunda caida hasta -16384.
                index - 16383 when others;--Genera la subida hasta cero.					 
end Behavioral;