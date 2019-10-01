----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:43:39 03/29/2017 
-- Design Name: 
-- Module Name:    Decodificador_Serial - Behavioral 
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
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decodificador_Serial is
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
end Decodificador_Serial;

architecture Behavioral of Decodificador_Serial is
type state_type is (Mark,Inicio,Giro_R,Giro_L,Velocidad,Determinar_Pasos,Cargar_Pasos,Apagar_clk,Determinar_Velocidad,Cargar_Velocidad);
signal state: state_type;
signal G:std_logic;
signal clkdiv: std_logic_vector(1 downto 0);
signal Regs: std_logic_vector(7 downto 0);
signal contador: std_logic_vector(7 downto 0);
--signal Decenas: std_logic_vector(7 downto 0);
begin
     process(clk)
	  begin 
		if rising_edge(clk) then
			clkdiv <= clkdiv +1;
		end if;
	  end process;

     process(clkdiv(1),clr)
	  begin
		if clr ='1' then
			state <= mark;
			act_pasos<='0';
		elsif rising_edge(clkdiv(1)) then
			case state is
			  --Estado Mark o de Espera
				when Mark =>
				      act_pasos<='0';
						if Lectura = '0' then
							state<=Mark;
							Datos<=Regs;
						else
							state<=Inicio;
						end if;
				--Estado Inicio
				when Inicio =>
				  if Lectura='1' then
				     state<=Inicio;
				  else
				   if Reg3=x"52" then  --Letra R
				     state<=Giro_R;
				   elsif Reg3=x"4C" then  --Letra L
				     state<=Giro_L;
				   elsif Reg3=x"56" then --Letra V
				     state<=Velocidad;
					else
					  state<=Mark;
				   end if;
				  end if;
				--Estado Giro_R
				when Giro_R =>
				     G<='1';
					  state<=Determinar_Pasos;
				--Estado Giro_L
			   when Giro_L =>
				     G<='0';
					  state<=Determinar_Pasos;
				--Estado Determinar_Pasos
				when Determinar_Pasos =>
				     if ((Reg1>47 and Reg1<58) and (Reg2>47 and Reg2<50)) or (Reg2=50 and Reg1=48) then-- Digitos del 00-19
					      state<=Cargar_Pasos;
							if Reg2=48 then				
					       Regs<=(Reg1-"00110000");
					      elsif Reg2=49 then
					       Regs<=((Reg1-"00110000")+x"0A");
							elsif Reg2=50 then
							 Regs<=x"14";
					      end if;
					  else
					      state<=Mark;
					  end if;
				--Estado Cargar_Pasos
				when Cargar_Pasos =>
				     Pasos<=Regs(4 downto 0);
--				     with Regs select--Elegir ent como variable para hacer la selección.
--                      Pasos <= "00000" when "0011000000110000",--00
--                               "00001" when "0011000000110001",--01
--                               "00010" when "0011000000110010",--02
--										   "00011" when "0011000000110011",--03
--                               "00100" when "0011000000110100",--04
--                               "00101" when "0011000000110101",--05
--										   "00110" when "0011000000110110",--06
--                               "00111" when "0011000000110111",--07
--                               "01000" when "0011000000111000",--08
--										   "01001" when "0011000000111001",--09
--                               "01010" when "0011000100111010",--10
--                               "01011" when "0011000100110001",--11
--                               "01100" when "0011000100110010",--12
--										   "01101" when "0011000100110011",--13
--                               "01110" when "0011000100110100",--14
--                               "01111" when "0011000100110101",--15
--										   "10000" when "0011000100110110",--16
--                               "10001" when "0011000100110111",--17
--                               "10010" when "0011000100111000",--18
--										   "10011" when "0011000100111001",--19
--                               "00000" when others;--		  
				     Giro<=G;
					  act_pasos<='1';
					  if contador<=240 then
					     contador<=contador+1;
					     state <=Cargar_Pasos;
					  else
					     contador<="00000000";
					     state<=Apagar_clk;--Pasa al estado de Apagar_clk.
					  end if;
				--Estado Apagar_clk
				when Apagar_clk =>
				     act_pasos<='0';
				     state<=Mark;
			   --Estado Velocidad
			   when Velocidad =>
				     state<=Determinar_Velocidad;
				--Estado Determinar_Velocidad
			   when Determinar_Velocidad =>
				     if ((Reg1>47 and Reg1<58) and (Reg2=48)) or (Reg2=49 and Reg1=48) then-- Digitos del 00-10
					      state<=Cargar_Velocidad;
							if Reg2=48 then				
					      Regs<=(Reg1-"00110000");
					      elsif Reg2=49 then
					      Regs<=(Reg1-"00110000")+x"0A";
					      end if;
					  else
					      state<=Mark;
					  end if;
			   --Estado Determinar_Velocidad
				when Cargar_Velocidad =>
                 Sal_Velocidad<=Regs(3 downto 0);			
					  state<=Mark;					  
			end case;
		end if;
	 end process;     
end Behavioral;