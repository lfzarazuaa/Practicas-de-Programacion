----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:33:57 03/31/2017 
-- Design Name: 
-- Module Name:    Decodificador_Tx_Serial - Behavioral 
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

entity Decodificador_Tx_Serial is
    Port ( clk : in  STD_LOGIC;
	        clr: in  STD_LOGIC;
           Enviar : in  STD_LOGIC;
           Entrada : in  STD_LOGIC_VECTOR (4 downto 0);
           tdrel : in  STD_LOGIC;
           Registro_Tx : inout  STD_LOGIC_VECTOR (7 downto 0):=X"00";
           Inicio : out  STD_LOGIC);
end Decodificador_Tx_Serial;

architecture Behavioral of Decodificador_Tx_Serial is
type state_type is (mark,espera,espera1,poner_dato1,cargar_dato1,espera2,poner_dato2,cargar_dato2); --Máquina de estados
signal state: state_type;
signal clkdiv: std_logic_vector(0 downto 0);--Divisor de reloj.
signal contador: std_logic_vector(1 downto 0);--Señal para alargar ciclos en el estado.
signal Reg1: std_logic_vector(3 downto 0):=x"0";
signal Reg2: std_logic_vector(0 downto 0):="0";
signal Dato1: std_logic_vector(3 downto 0);
signal Dato2: std_logic_vector(0 downto 0);
begin
-- Señal de reloj
    process(clk)
    begin
	    if rising_edge(clk) then--Contador de 25000000 pulsos de reloj.
		       clkdiv <= clkdiv +1;--Incrementa el contador en 1.
		 end if;
	end process;
	 
	with Entrada select--Elegir ent como variable para hacer la selección.
        Dato1 <= X"0" when "00000",--
                 X"1" when "00001",--
                 X"2" when "00010",-- 
                 X"3" when "00011",--
					  X"4" when "00100",--
                 X"5" when "00101",--
                 X"6" when "00110",--
                 X"7" when "00111",--
					  X"8" when "01000",--
                 X"9" when "01001",--
                 X"0" when "01010",--
                 X"1" when "01011",--
					  X"2" when "01100",--
                 X"3" when "01101",--
                 X"4" when "01110",--
                 X"5" when "01111",--
					  X"6" when "10000",--
                 X"7" when "10001",--
                 X"8" when "10010",--
                 X"9" when "10011",--
                 X"0" when others;--
	
	process(Entrada)
	begin    
				if Entrada>=10 then
				   Dato2<="1";
				else
				   Dato2<="0";
				end if;
	end process;
	--Máquina de estados
	process(clkdiv(0),clr,Dato1,Dato2,Entrada)
	begin
	    if clr='1' then--Si el reset esta inactivo carga configuración inicial.
		     state <=mark;--Estado siguiente es mark.
			  Inicio<='0';
		 elsif rising_edge(clkdiv(0)) then--Elige clk como reloj de la máquina de estados.
			  case state is
			    when mark=>--Cuando se encuentra en mark(estado de inicio).
				      Inicio<='0';
						if Enviar='1' and Entrada<20 then
						   state<=espera;
							Reg1<=Dato1;
				         Reg2<=Dato2;
						else
		    				state<=mark;
							Reg1<="0000";
				         Reg2<="0";
						end if;
						
				  when espera=>
				     if Enviar='0' then
					     state<=espera1;
					  else
					     state<=espera;
					  end if;
			
			     when espera1=>
				      Inicio<='0';
						if tdrel='1' then
						    state<=poner_dato1;
						else
						    state<=espera1;
						end if;
					
				  when poner_dato1=>
					   --Registro_Tx<=(X"3")&Reg1;
						Registro_Tx<=("0011000")&Reg2;
					  if contador>2 then
					      contador<="00";
							state<=cargar_dato1;
					  else
					      contador<=contador+1;
							state<=poner_dato1;
					  end if;
					  
				  when cargar_dato1=>
					  --Registro_Tx<=(X"3")&Reg1;
					  Registro_Tx<=("0011000")&Reg2;
					  Inicio<='1';
					  if contador>2 then
					      contador<="00";
							state<=espera2;
					  else
					      contador<=contador+1;
							state<=cargar_dato1;
					  end if;
            
				  when espera2=>
					  	Inicio<='0';
						if tdrel='1' then
						    state<=poner_dato2;
						else
						    state<=espera2;
						end if;

				  when poner_dato2=>
					  --Registro_Tx<=("0011000")&Reg2;
					  Registro_Tx<=(X"3")&Reg1;
					  if contador>2 then
					      contador<="00";
							state<=cargar_dato2;
					  else
					      contador<=contador+1;
							state<=poner_dato2;
					  end if;
					  
				  when cargar_dato2=>
					  --Registro_Tx<=("0011000")&Reg2;
					  Registro_Tx<=(X"3")&Reg1;
					  Inicio<='1';
					  if contador>2 then
					      contador<="00";
							state<=mark;
					  else
					      contador<=contador+1;
							state<=cargar_dato2;
					  end if;
			  end case;
			end if;
	end process;

end Behavioral;
