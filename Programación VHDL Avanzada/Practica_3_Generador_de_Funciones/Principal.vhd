----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:27:53 05/19/2017 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Principal is
    Port ( clk_nexys : in  STD_LOGIC;
           Sel_Escala : in  STD_LOGIC_VECTOR (1 downto 0);
           Boton_bajar : in  STD_LOGIC;
           Boton_subir : in  STD_LOGIC;
			  reset: in STD_LOGIC;
           Sel_Senal : in  STD_LOGIC_VECTOR (1 downto 0);
           Vsal : out  STD_LOGIC_VECTOR (15 downto 0);
			  Salidas_7segc : out  STD_LOGIC_VECTOR (7 downto 0);
			  Control_Disp_7segc: out  STD_LOGIC_VECTOR (3 downto 0));
end Principal;
-- Modulos usados.

architecture Behavioral of Principal is

component debounce4 is
    Port ( clr : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           inp : in  STD_LOGIC_VECTOR(3 downto 0);
           outp : out  STD_LOGIC_VECTOR(3 downto 0));
end component;
 
component Selector_de_Frecuencia is
    Port ( clk_in : in  STD_LOGIC;
        	  Escala : in  STD_LOGIC_VECTOR (1 downto 0);
           Boton_Subida : in  STD_LOGIC;
           Boton_Bajada : in  STD_LOGIC;
           Frecuencia : out  STD_LOGIC_VECTOR (13 downto 0));
end component;

component Generador_Func is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           cuentamax : in  STD_LOGIC_VECTOR (17 downto 0);
			  sel_senal : in  STD_LOGIC_VECTOR (1 downto 0);
           Direccion_Memoria_Senal : out  STD_LOGIC_VECTOR (9 downto 0));
end component;

component Mem_Senales IS
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;

component Mem_Frecuencias IS
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0));
end component;

component Mem_Digitos IS
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;

component MUX_Freq_0 is
    Port ( Dato : in  STD_LOGIC_VECTOR (15 downto 0);--Dato de la señal generada.
           Freq : in  STD_LOGIC_VECTOR (13 downto 0);--Frecuencia deseada.
           Vout : out  STD_LOGIC_VECTOR (15 downto 0));--Dato de salida.
end component;

component Decodififcador_Digitos is
    Port ( clk : in  STD_LOGIC;
	        Dato : in  STD_LOGIC_VECTOR (13 downto 0);
           Digito_4 : out  STD_LOGIC_VECTOR (7 downto 0);
           Digito_3 : out  STD_LOGIC_VECTOR (7 downto 0);
           Digito_2 : out  STD_LOGIC_VECTOR (7 downto 0);
           Digito_1 : out  STD_LOGIC_VECTOR (7 downto 0));
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

signal Salida_ROM_Frecuencias: STD_LOGIC_VECTOR(17 DOWNTO 0);
signal Direccion_ROM_Senales: STD_LOGIC_VECTOR(9 DOWNTO 0);
signal Salida_ROM_Senales,Digitos: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal Frecuencia: STD_LOGIC_VECTOR(13 DOWNTO 0);
signal Btn_Subir: STD_LOGIC;
signal Btn_Bajar: STD_LOGIC;
signal Btn_Reset: STD_LOGIC;
signal Botones: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal Salida_BTN: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal Display_1c,Display_2c,Display_3c,Display_4c: STD_LOGIC_VECTOR (7 downto 0);
begin
--    Display_1c<=Frecuencia(7 downto 0);
--	  Display_2c<="00"&Frecuencia(13 downto 8);
--	  Display_3c<=Salida_ROM_Senales(15 downto 8);
--	  Display_4c<=Salida_ROM_Senales(7 downto 0);

Botones<=(Boton_subir&Boton_bajar&reset&reset);
U0: debounce4 port map( clr => reset,
                        clk => clk_nexys,
                        inp => Botones,
                        outp => Salida_BTN);
     Btn_Subir<=Salida_BTN(3);
	  Btn_Bajar<=Salida_BTN(2);
	  Btn_Reset<=Salida_BTN(1) and Salida_BTN(0);
U1: Selector_de_Frecuencia port map( clk_in => clk_nexys,
        	                         Escala => Sel_Escala,
                                     Boton_Subida => Btn_Subir,
                                     Boton_Bajada => Btn_Bajar,
                                     Frecuencia => Frecuencia);	  
	  
ROM1: Mem_Frecuencias port map(clka => clk_nexys,
                               addra => Frecuencia,
                               douta => Salida_ROM_Frecuencias);

U2: Generador_Func port map( clk => clk_nexys,
                             rst => Btn_Reset,
                             cuentamax => Salida_ROM_Frecuencias,
			                    sel_senal => Sel_Senal,
                             Direccion_Memoria_Senal => Direccion_ROM_Senales);

ROM2: Mem_Senales port map(clka => clk_nexys,
                           addra => Direccion_ROM_Senales,
                           douta => Salida_ROM_Senales);

U3: MUX_Freq_0 port map( Dato => Salida_ROM_Senales,
                         Freq => Frecuencia,
                         Vout => Vsal);

--ROM3: Mem_Digitos port map(clka => clk_nexys,
--                           addra => Frecuencia,
--                           douta => Digitos);
									
U4: Decodififcador_Digitos port map(   clk=>clk_nexys,
                                       Dato => Frecuencia,
                                       Digito_4 => Display_4c,
                                       Digito_3 => Display_3c,
                                       Digito_2 => Display_2c,
                                       Digito_1 => Display_1c);

U5: Leds_Display_7 port map( clkin => clk_nexys,
	                         Entrada_Disp_1 => Display_1c,
                             Entrada_Disp_2 => Display_2c,
                             Entrada_Disp_3 => Display_3c,
                             Entrada_Disp_4 => Display_4c,
                             Salidas_7seg => Salidas_7segc,
                             Control_Disp_7seg => Control_Disp_7segc);								 
end Behavioral;