----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:07:48 05/20/2017 
-- Design Name: 
-- Module Name:    Decodififcador_Digitos - Behavioral 
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

entity Decodififcador_Digitos is
    Port ( clk : in  STD_LOGIC;
	        Dato : in  STD_LOGIC_VECTOR (13 downto 0);
           Digito_4 : out  STD_LOGIC_VECTOR (7 downto 0);
           Digito_3 : out  STD_LOGIC_VECTOR (7 downto 0);
           Digito_2 : out  STD_LOGIC_VECTOR (7 downto 0);
           Digito_1 : out  STD_LOGIC_VECTOR (7 downto 0));
end Decodififcador_Digitos;



architecture Behavioral of Decodififcador_Digitos is
type state_type is (Inicio,Recopilar_Datos,Decrementar_Millares,Decrementar_Centenas,Decrementar_Decenas,Cargar_Digitos);
signal state: state_type;
signal Dato_op: STD_LOGIC_VECTOR (13 downto 0);
signal clkdiv: STD_LOGIC_VECTOR (0 downto 0);
signal Dig4,Dig3,Dig2,Dig1: STD_LOGIC_VECTOR (3 downto 0);
signal Dig4b,Dig3b,Dig2b,Dig1b: STD_LOGIC_VECTOR (3 downto 0);
begin
     process(clk)
	  begin
		if rising_edge(clk) then
			clkdiv <= clkdiv +1;
		end if;
	 end process;
	 
	 
	 --Màquina de Estados.	
 process(clkdiv(0),Dato)
	begin
		if rising_edge(clkdiv(0)) then--Elige como reloj de la máquina de estados a clkdiv.
			case state is
				when  Inicio =>--Estado de Inicio
						state <=Recopilar_Datos;
				when  Recopilar_Datos =>--Estado de Inicio
				      Dig1<="0000";
					   Dig2<="0000";
					   Dig3<="0000";
					   Dig4<="0000";
					   Dato_op<=Dato;
					   state <=Decrementar_Millares;
						
				when  Decrementar_Millares =>--Estado de Decrementar Millares
				        if Dato_op>=1000 then
						   Dato_op<=Dato_op-1000;
						   Dig4<=Dig4+1;
						   state<=Decrementar_Millares;
						else
						   Dig4<=Dig4;
						   state<=Decrementar_Centenas;
						end if;
						
				when  Decrementar_Centenas =>--Estado de Decrementar_Centenas
				        if Dato_op>=100 then
						   Dato_op<=Dato_op-100;
						   Dig3<=Dig3+1;
						   state<=Decrementar_Centenas;
						else
						   Dig3<=Dig3;
						   state<=Decrementar_Decenas;
						end if;
				when  Decrementar_Decenas =>--Estado de Decrementar_Decenas
				        if Dato_op>=10 then
						   Dato_op<=Dato_op-10;
						   Dig2<=Dig2+1;
						   state<=Decrementar_Centenas;
						else
						   Dig1<=Dato_op(3 downto 0);
						   Dig2<=Dig2;
						   state<=Cargar_Digitos;
						end if;
				when  Cargar_Digitos =>--Estado de Cargar_Digitos
				        Dig1b<=Dig1;
						Dig2b<=Dig2;
						Dig3b<=Dig3;
						Dig4b<=Dig4;
						state <=Recopilar_Datos;
			end case;
		end if;
	end process;
	 
	 
	 with Dig4b select
    Digito_4 <=  not(X"C0") when X"0",--Declaración del dígito "0" para display de 7 segmentos ánodo.
             not(X"79") when X"1",--Declaración del dígito "1" para display de 7 segmentos ánodo.
             not(X"A4") when X"2",--Declaración del dígito "2" para display de 7 segmentos ánodo.
             not(X"30") when X"3",--Declaración del dígito "3" para display de 7 segmentos ánodo.
             not(X"99") when X"4",--Declaración del dígito "4" para display de 7 segmentos ánodo.
             not(X"12") when X"5",--Declaración del dígito "5" para display de 7 segmentos ánodo.
             not(X"83") when X"6",--Declaración del dígito "6" para display de 7 segmentos ánodo.
             not(X"78") when X"7",--Declaración del dígito "7" para display de 7 segmentos ánodo.
             not(X"80") when X"8",--Declaración del dígito "8" para display de 7 segmentos ánodo.
             not(X"18") when X"9",--Declaración del dígito "9" para display de 7 segmentos ánodo.
             not(X"A7") when X"A",--Declaración del dígito "A" para display de 7 segmentos ánodo.
             not(X"33") when X"B",--Declaración del dígito "B" para display de 7 segmentos ánodo.
             not(X"9D") when X"C",--Declaración del dígito "C" para display de 7 segmentos ánodo.
             not(X"16") when X"D",--Declaración del dígito "D" para display de 7 segmentos ánodo.
             not(X"87") when X"E",--Declaración del dígito "E" para display de 7 segmentos ánodo.
             not(X"7F") when others;--Declaración del dígito "F" para display de 7 segmentos ánodo.
				 
	with Dig3b select
    Digito_3 <=  not(X"C0") when X"0",--Declaración del dígito "0" para display de 7 segmentos ánodo.
             not(X"79") when X"1",--Declaración del dígito "1" para display de 7 segmentos ánodo.
             not(X"A4") when X"2",--Declaración del dígito "2" para display de 7 segmentos ánodo.
             not(X"30") when X"3",--Declaración del dígito "3" para display de 7 segmentos ánodo.
             not(X"99") when X"4",--Declaración del dígito "4" para display de 7 segmentos ánodo.
             not(X"12") when X"5",--Declaración del dígito "5" para display de 7 segmentos ánodo.
             not(X"83") when X"6",--Declaración del dígito "6" para display de 7 segmentos ánodo.
             not(X"78") when X"7",--Declaración del dígito "7" para display de 7 segmentos ánodo.
             not(X"80") when X"8",--Declaración del dígito "8" para display de 7 segmentos ánodo.
             not(X"18") when X"9",--Declaración del dígito "9" para display de 7 segmentos ánodo.
             not(X"A7") when X"A",--Declaración del dígito "A" para display de 7 segmentos ánodo.
             not(X"33") when X"B",--Declaración del dígito "B" para display de 7 segmentos ánodo.
             not(X"9D") when X"C",--Declaración del dígito "C" para display de 7 segmentos ánodo.
             not(X"16") when X"D",--Declaración del dígito "D" para display de 7 segmentos ánodo.
             not(X"87") when X"E",--Declaración del dígito "E" para display de 7 segmentos ánodo.
             not(X"7F") when others;--Declaración del dígito "F" para display de 7 segmentos ánodo.

	 with Dig2b select
    Digito_2 <=  not(X"C0") when X"0",--Declaración del dígito "0" para display de 7 segmentos ánodo.
             not(X"79") when X"1",--Declaración del dígito "1" para display de 7 segmentos ánodo.
             not(X"A4") when X"2",--Declaración del dígito "2" para display de 7 segmentos ánodo.
             not(X"30") when X"3",--Declaración del dígito "3" para display de 7 segmentos ánodo.
             not(X"99") when X"4",--Declaración del dígito "4" para display de 7 segmentos ánodo.
             not(X"12") when X"5",--Declaración del dígito "5" para display de 7 segmentos ánodo.
             not(X"83") when X"6",--Declaración del dígito "6" para display de 7 segmentos ánodo.
             not(X"78") when X"7",--Declaración del dígito "7" para display de 7 segmentos ánodo.
             not(X"80") when X"8",--Declaración del dígito "8" para display de 7 segmentos ánodo.
             not(X"18") when X"9",--Declaración del dígito "9" para display de 7 segmentos ánodo.
             not(X"A7") when X"A",--Declaración del dígito "A" para display de 7 segmentos ánodo.
             not(X"33") when X"B",--Declaración del dígito "B" para display de 7 segmentos ánodo.
             not(X"9D") when X"C",--Declaración del dígito "C" para display de 7 segmentos ánodo.
             not(X"16") when X"D",--Declaración del dígito "D" para display de 7 segmentos ánodo.
             not(X"87") when X"E",--Declaración del dígito "E" para display de 7 segmentos ánodo.
             not(X"7F") when others;--Declaración del dígito "F" para display de 7 segmentos ánodo.

	 with Dig1b select
    Digito_1 <=  not(X"C0") when X"0",--Declaración del dígito "0" para display de 7 segmentos ánodo.
             not(X"79") when X"1",--Declaración del dígito "1" para display de 7 segmentos ánodo.
             not(X"A4") when X"2",--Declaración del dígito "2" para display de 7 segmentos ánodo.
             not(X"30") when X"3",--Declaración del dígito "3" para display de 7 segmentos ánodo.
             not(X"99") when X"4",--Declaración del dígito "4" para display de 7 segmentos ánodo.
             not(X"12") when X"5",--Declaración del dígito "5" para display de 7 segmentos ánodo.
             not(X"83") when X"6",--Declaración del dígito "6" para display de 7 segmentos ánodo.
             not(X"78") when X"7",--Declaración del dígito "7" para display de 7 segmentos ánodo.
             not(X"80") when X"8",--Declaración del dígito "8" para display de 7 segmentos ánodo.
             not(X"18") when X"9",--Declaración del dígito "9" para display de 7 segmentos ánodo.
             not(X"A7") when X"A",--Declaración del dígito "A" para display de 7 segmentos ánodo.
             not(X"33") when X"B",--Declaración del dígito "B" para display de 7 segmentos ánodo.
             not(X"9D") when X"C",--Declaración del dígito "C" para display de 7 segmentos ánodo.
             not(X"16") when X"D",--Declaración del dígito "D" para display de 7 segmentos ánodo.
             not(X"87") when X"E",--Declaración del dígito "E" para display de 7 segmentos ánodo.
             not(X"7F") when others;--Declaración del dígito "F" para display de 7 segmentos ánodo.

	--Digito_4<="0000"&Dig4b;
	--Digito_3<="0000"&Dig3b;
	--Digito_2<="0000"&Dig2b;
	--Digito_1<="0000"&Dig1b;
	
	
end Behavioral;
--architecture Behavioral of Decodififcador_Digitos is
--signal clkdiv: STD_LOGIC_VECTOR (13 downto 0);
--signal Dig4,Dig3,Dig2,Dig1: STD_LOGIC_VECTOR (3 downto 0):="0000";
--signal Dig4b,Dig3b,Dig2b,Dig1b: STD_LOGIC_VECTOR (3 downto 0):="0000";
--begin
--   process(clk)
--	   begin
--	     if rising_edge(clk) then
--		   if clkdiv<9999 then
--			   clkdiv<=clkdiv+1;
--			else 
--			   clkdiv<=(others =>'0');
--			end if;
--		   if Dig1<9 then
--			 Dig1<=Dig1+1;
--			else 
--			 Dig1<="0000";
--			end if;
--		end if;
--	end process;
--   
--	process(Dig1)
--	   begin
--	     if falling_edge(Dig1(3)) then
--		   if Dig2<9 then
--			 Dig2<=Dig2+1;
--			else 
--			 Dig2<="0000";
--			end if;
--		end if;
--	end process;
--	
--	process(Dig2)
--	   begin
--	     if falling_edge(Dig2(3)) then
--		   if Dig3<9 then
--			 Dig3<=Dig3+1;
--			else 
--			 Dig3<="0000";
--			end if;
--		end if;
--	end process;
--	
--	process(Dig3)
--	   begin
--	     if falling_edge(Dig3(3)) then
--		   if Dig4<9 then
--			 Dig4<=Dig4+1;
--			else 
--			 Dig4<="0000";
--			end if;
--		end if;
--	end process;
--
--   process(Dig1,Dig2,Dig3,Dig4)
--	 begin
--	  if clkdiv=Dato then
--       Dig1b<=Dig1;
--       Dig2b<=Dig2;
--       Dig3b<=Dig3;
--	    Dig4b<=Dig4;
--	  end if;
--	end process;
--	
--	 with Dig4b select
--    Digito_4 <=  not(X"C0") when X"0",--Declaración del dígito "0" para display de 7 segmentos ánodo.
--             not(X"79") when X"1",--Declaración del dígito "1" para display de 7 segmentos ánodo.
--             not(X"A4") when X"2",--Declaración del dígito "2" para display de 7 segmentos ánodo.
--             not(X"30") when X"3",--Declaración del dígito "3" para display de 7 segmentos ánodo.
--             not(X"99") when X"4",--Declaración del dígito "4" para display de 7 segmentos ánodo.
--             not(X"12") when X"5",--Declaración del dígito "5" para display de 7 segmentos ánodo.
--             not(X"83") when X"6",--Declaración del dígito "6" para display de 7 segmentos ánodo.
--             not(X"78") when X"7",--Declaración del dígito "7" para display de 7 segmentos ánodo.
--             not(X"80") when X"8",--Declaración del dígito "8" para display de 7 segmentos ánodo.
--             not(X"18") when X"9",--Declaración del dígito "9" para display de 7 segmentos ánodo.
--             not(X"A7") when X"A",--Declaración del dígito "A" para display de 7 segmentos ánodo.
--             not(X"33") when X"B",--Declaración del dígito "B" para display de 7 segmentos ánodo.
--             not(X"9D") when X"C",--Declaración del dígito "C" para display de 7 segmentos ánodo.
--             not(X"16") when X"D",--Declaración del dígito "D" para display de 7 segmentos ánodo.
--             not(X"87") when X"E",--Declaración del dígito "E" para display de 7 segmentos ánodo.
--             not(X"7F") when others;--Declaración del dígito "F" para display de 7 segmentos ánodo.
--				 
--	with Dig3b select
--    Digito_3 <=  not(X"C0") when X"0",--Declaración del dígito "0" para display de 7 segmentos ánodo.
--             not(X"79") when X"1",--Declaración del dígito "1" para display de 7 segmentos ánodo.
--             not(X"A4") when X"2",--Declaración del dígito "2" para display de 7 segmentos ánodo.
--             not(X"30") when X"3",--Declaración del dígito "3" para display de 7 segmentos ánodo.
--             not(X"99") when X"4",--Declaración del dígito "4" para display de 7 segmentos ánodo.
--             not(X"12") when X"5",--Declaración del dígito "5" para display de 7 segmentos ánodo.
--             not(X"83") when X"6",--Declaración del dígito "6" para display de 7 segmentos ánodo.
--             not(X"78") when X"7",--Declaración del dígito "7" para display de 7 segmentos ánodo.
--             not(X"80") when X"8",--Declaración del dígito "8" para display de 7 segmentos ánodo.
--             not(X"18") when X"9",--Declaración del dígito "9" para display de 7 segmentos ánodo.
--             not(X"A7") when X"A",--Declaración del dígito "A" para display de 7 segmentos ánodo.
--             not(X"33") when X"B",--Declaración del dígito "B" para display de 7 segmentos ánodo.
--             not(X"9D") when X"C",--Declaración del dígito "C" para display de 7 segmentos ánodo.
--             not(X"16") when X"D",--Declaración del dígito "D" para display de 7 segmentos ánodo.
--             not(X"87") when X"E",--Declaración del dígito "E" para display de 7 segmentos ánodo.
--             not(X"7F") when others;--Declaración del dígito "F" para display de 7 segmentos ánodo.
--
--	 with Dig2b select
--    Digito_2 <=  not(X"C0") when X"0",--Declaración del dígito "0" para display de 7 segmentos ánodo.
--             not(X"79") when X"1",--Declaración del dígito "1" para display de 7 segmentos ánodo.
--             not(X"A4") when X"2",--Declaración del dígito "2" para display de 7 segmentos ánodo.
--             not(X"30") when X"3",--Declaración del dígito "3" para display de 7 segmentos ánodo.
--             not(X"99") when X"4",--Declaración del dígito "4" para display de 7 segmentos ánodo.
--             not(X"12") when X"5",--Declaración del dígito "5" para display de 7 segmentos ánodo.
--             not(X"83") when X"6",--Declaración del dígito "6" para display de 7 segmentos ánodo.
--             not(X"78") when X"7",--Declaración del dígito "7" para display de 7 segmentos ánodo.
--             not(X"80") when X"8",--Declaración del dígito "8" para display de 7 segmentos ánodo.
--             not(X"18") when X"9",--Declaración del dígito "9" para display de 7 segmentos ánodo.
--             not(X"A7") when X"A",--Declaración del dígito "A" para display de 7 segmentos ánodo.
--             not(X"33") when X"B",--Declaración del dígito "B" para display de 7 segmentos ánodo.
--             not(X"9D") when X"C",--Declaración del dígito "C" para display de 7 segmentos ánodo.
--             not(X"16") when X"D",--Declaración del dígito "D" para display de 7 segmentos ánodo.
--             not(X"87") when X"E",--Declaración del dígito "E" para display de 7 segmentos ánodo.
--             not(X"7F") when others;--Declaración del dígito "F" para display de 7 segmentos ánodo.
--
--	 with Dig1b select
--    Digito_1 <=  not(X"C0") when X"0",--Declaración del dígito "0" para display de 7 segmentos ánodo.
--             not(X"79") when X"1",--Declaración del dígito "1" para display de 7 segmentos ánodo.
--             not(X"A4") when X"2",--Declaración del dígito "2" para display de 7 segmentos ánodo.
--             not(X"30") when X"3",--Declaración del dígito "3" para display de 7 segmentos ánodo.
--             not(X"99") when X"4",--Declaración del dígito "4" para display de 7 segmentos ánodo.
--             not(X"12") when X"5",--Declaración del dígito "5" para display de 7 segmentos ánodo.
--             not(X"83") when X"6",--Declaración del dígito "6" para display de 7 segmentos ánodo.
--             not(X"78") when X"7",--Declaración del dígito "7" para display de 7 segmentos ánodo.
--             not(X"80") when X"8",--Declaración del dígito "8" para display de 7 segmentos ánodo.
--             not(X"18") when X"9",--Declaración del dígito "9" para display de 7 segmentos ánodo.
--             not(X"A7") when X"A",--Declaración del dígito "A" para display de 7 segmentos ánodo.
--             not(X"33") when X"B",--Declaración del dígito "B" para display de 7 segmentos ánodo.
--             not(X"9D") when X"C",--Declaración del dígito "C" para display de 7 segmentos ánodo.
--             not(X"16") when X"D",--Declaración del dígito "D" para display de 7 segmentos ánodo.
--             not(X"87") when X"E",--Declaración del dígito "E" para display de 7 segmentos ánodo.
--             not(X"7F") when others;--Declaración del dígito "F" para display de 7 segmentos ánodo.
--
--	--Digito_4<="0000"&Dig4b;
--	--Digito_3<="0000"&Dig3b;
--	--Digito_2<="0000"&Dig2b;
--	--Digito_1<="0000"&Dig1b;
--	
--	
--end Behavioral;