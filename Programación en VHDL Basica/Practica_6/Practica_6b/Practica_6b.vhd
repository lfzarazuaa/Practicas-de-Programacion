----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:30:20 05/12/2016 
-- Design Name: 
-- Module Name:    Practica_6b - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Practica_6b is
    port(clk,sel,rst: in std_logic;--Declaraci�n de entradas.
	      sal: out std_logic_vector(7 downto 0);--Declaraci�n de segmentos del display.
         Control: out std_logic_vector(3 downto 0));--Declaraci�n de comunes del display.
end Practica_6b;

architecture Behavioral of Practica_6b is
      Signal SCont: std_logic;--Pulso de Contador.
	  Signal SMues: std_logic;--Pulso para muestreo.
	  Signal ContadorU: std_logic_vector(3 downto 0);--Contador de Unidades.
	  Signal ContadorD: std_logic_vector(3 downto 0);--Contador de Decenas.
	  Signal Digito: std_logic_vector(3 downto 0);--Declaraci�n de D�gito.
begin
     process(clk)     
	  variable icont : integer :=0;--Inicializa el contador en 0.
	  begin
          if(clk'event and clk='1')then
             iCont:=iCont+1;
				 if(iCont>5000000) then--Si el contador lleva 1 segundo resetea al contador y pone en bajo el pulso de Contador.
             iCont:=0;
				 SCont <= '1';
				 else--En otro caso pone el el pulso de Contador en 0.
				 SCont <= '0';
				 end if;
          end if;				 
	  end process;

     process(clk)     
	  variable iMues : integer :=0;--Declaraci�n de variable IMues en 0.
	  begin
          if(clk'event and clk='1')then
				 iMues:=iMues+1;
				 if(iMues<50000) then--Si se llevan menos de 5000 pulsos el pulso para muestreo es 0.
				  SMues <= '0';
				 elsif (iMues=100000) then--Si se llevan 10000 pulsos el pulso para muestreo es 0 y resetea el contador.
				  iMues:=0;
				  SMues <= '0';
				 else-- En otro caso pone el pulso de muestreo en 1.
				  Smues<='1';
				 end if;
          end if;				 
	  end process;
	  
	  process(SCont,Sel,rst)     
	  begin
				if (rst='0') then--Si la se�al de reset es 0 ejecuta el conteo.
				 if(sCont'event and sCont='1')then
              if(Sel = '1') then--Si el selector es uno realiza un conteo ascendente.
				  ContadorU<=ContadorU+1;--Incrementa el contador de Unidades.
				   if(ContadorU=9)then--Si el contador es 9 resetea el contador de unidades e incrementa el de decenas.
					  ContadorU<="0000";
					  ContadorD<=ContadorD+1;
				   elsif(ContadorD=6 and ContadorU=3)then--Si los 2 contadores son 6 y 3 respectivamente resetea los contadores.
					  ContadorU<="0000";
					  ContadorD<="0000";
				   end if;
				  else--Si el selector es cero.
				   ContadorU<=ContadorU-1;--Decrementa el contador de Unidades.
				   if(ContadorU=0 and ContadorD>0)then--Si el contador de Unidades es 0 y el contadores de Decenas es mayor a cero lo decrementa.
					  ContadorU<="1001";
					  ContadorD<=ContadorD-1;
				   elsif(ContadorD=0 and ContadorU=0)then--Si los contadores son cero se pone en 6 y en 3 los contadores.
					  ContadorU<="0011";
					  ContadorD<="0110";
				   end if;
				  end if;
				  end if;
				else--Si el reset es 1 resetea los contadores de Unidades y Decenas.
				   ContadorU<="0000";
					ContadorD<="0000";
			   end if;
     end process;
	  
	  process(SMues,ContadorU,ContadorD)     
	  begin
				 if(SMues='0')then--Si el pulso es 1 activa el primer display y le asigna las Unidades.
                Digito<=ContadorU;
					 Control<="1011";
				 else--Si el pulso es 1 activa el segundo display y le asigna las Decenas.
				    Digito<=ContadorD;
					 Control<="0111";
				 end if;
     end process;
	  
	  process(Digito) begin--Comenzar el segundo proceso que decodifica el valor asignado en D�gito.
        case Digito is--Elegir Digito como se�al para hacer la decodificaci�n.
         when X"0" => sal<=X"C0";--Declaraci�n del d�gito "0" para display de 7 segmentos �nodo.
         when X"1" => sal<=X"F9";--Declaraci�n del d�gito "1" para display de 7 segmentos �nodo.
         when X"2" => sal<=X"A4";--Declaraci�n del d�gito "2" para display de 7 segmentos �nodo.
         when X"3" => sal<=X"B0";--Declaraci�n del d�gito "3" para display de 7 segmentos �nodo.
         when X"4" => sal<=X"99";--Declaraci�n del d�gito "4" para display de 7 segmentos �nodo.
         when X"5" => sal<=X"92";--Declaraci�n del d�gito "5" para display de 7 segmentos �nodo.
         when X"6" => sal<=X"83";--Declaraci�n del d�gito "6" para display de 7 segmentos �nodo.
         when X"7" => sal<=X"F8";--Declaraci�n del d�gito "7" para display de 7 segmentos �nodo.
         when X"8" => sal<=X"80";--Declaraci�n del d�gito "8" para display de 7 segmentos �nodo.
         when X"9" => sal<=X"98";--Declaraci�n del d�gito "9" para display de 7 segmentos �nodo.
         when X"A" => sal<=X"88";--Declaraci�n del d�gito "A" para display de 7 segmentos �nodo.
         when X"B" => sal<=X"83";--Declaraci�n del d�gito "B" para display de 7 segmentos �nodo.
         when X"C" => sal<=X"A7";--Declaraci�n del d�gito "C" para display de 7 segmentos �nodo.
         when X"D" => sal<=X"A1";--Declaraci�n del d�gito "D" para display de 7 segmentos �nodo.
         when X"E" => sal<=X"86";--Declaraci�n del d�gito "E" para display de 7 segmentos �nodo.
         when others => sal<=X"8E";--Declaraci�n del d�gito "F" para display de 7 segmentos �nodo.
	  end case;
	  end process;     	  
end Behavioral;

