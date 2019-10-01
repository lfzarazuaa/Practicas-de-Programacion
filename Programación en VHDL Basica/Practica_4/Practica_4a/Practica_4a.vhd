library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Mult is
    port(A,B: in std_logic_vector(2 downto 0);--Declaraci�n de entradas l�gicas.
         sel: in std_logic;
         Sal: out std_logic_vector(7 downto 0)); --Declaraci�n de salidas l�gica.
end; 

architecture Sum of Mult is
      Signal Digito: std_logic_vector(4 downto 0);--Declaraci�n de la se�al que se usa como se�al intermedia en un proceso.
      begin--Empezar con la parte de declaraci�n de sentencias.
       process(sel,A,B) begin--Comenzar el primer proceso que elige en base al selector el dato a pasar.
        if(sel ='0') then--Sentencia de control if, si es 1 pasa el dato A.
          Digito<=("00"&A)+B;--Asignaci�n del dato A+B en D�gito si sel es 0.
        else--En caso contrario pasa el dato A-B.
          if(A>B) then
          Digito<=("00"&A)-B;--Asignaci�n del dato A-B en D�gito.
          else
          Digito<=(("00"&B)-A) or ("10000");--Asignaci�n del dato B-A en D�gito.
          end if;--Final de la secuencia de control if.
        end if;--Final de la secuencia de control if.
       end process;--Final del primer proceso en el cual se da el valor de D�gito.
       
       process(Digito) begin--Comenzar el segundo proceso que decodifica el valor asignado en D�gito.
        case Digito is--Elegir ent como se�al para hacer la decodificaci�n.
         when '0'&X"0" => sal<=X"C0";--Declaraci�n del d�gito "0" para display de 7 segmentos �nodo.
         when '0'&X"1" => sal<=X"F9";--Declaraci�n del d�gito "1" para display de 7 segmentos �nodo.
         when '0'&X"2" => sal<=X"A4";--Declaraci�n del d�gito "2" para display de 7 segmentos �nodo.
         when '0'&X"3" => sal<=X"B0";--Declaraci�n del d�gito "3" para display de 7 segmentos �nodo.
         when '0'&X"4" => sal<=X"99";--Declaraci�n del d�gito "4" para display de 7 segmentos �nodo.
         when '0'&X"5" => sal<=X"92";--Declaraci�n del d�gito "5" para display de 7 segmentos �nodo.
         when '0'&X"6" => sal<=X"83";--Declaraci�n del d�gito "6" para display de 7 segmentos �nodo.
         when '0'&X"7" => sal<=X"F8";--Declaraci�n del d�gito "7" para display de 7 segmentos �nodo.
         when '0'&X"8" => sal<=X"80";--Declaraci�n del d�gito "8" para display de 7 segmentos �nodo.
         when '0'&X"9" => sal<=X"98";--Declaraci�n del d�gito "9" para display de 7 segmentos �nodo.
         when '0'&X"A" => sal<=X"88";--Declaraci�n del d�gito "A" para display de 7 segmentos �nodo.
         when '0'&X"B" => sal<=X"83";--Declaraci�n del d�gito "B" para display de 7 segmentos �nodo.
         when '0'&X"C" => sal<=X"A7";--Declaraci�n del d�gito "C" para display de 7 segmentos �nodo.
         when '0'&X"D" => sal<=X"A1";--Declaraci�n del d�gito "D" para display de 7 segmentos �nodo.
         when '0'&X"E" => sal<=X"86";--Declaraci�n del d�gito "E" para display de 7 segmentos �nodo.
         when '0'&X"F" => sal<=X"8E";--Declaraci�n del d�gito "F" para display de 7 segmentos �nodo.
         --Numeros Negativos.
         when '1'&X"0" => sal<=X"40";--Declaraci�n del d�gito "0" para display de 7 segmentos �nodo.
         when '1'&X"1" => sal<=X"79";--Declaraci�n del d�gito "1" para display de 7 segmentos �nodo.
         when '1'&X"2" => sal<=X"24";--Declaraci�n del d�gito "2" para display de 7 segmentos �nodo.
         when '1'&X"3" => sal<=X"30";--Declaraci�n del d�gito "3" para display de 7 segmentos �nodo.
         when '1'&X"4" => sal<=X"19";--Declaraci�n del d�gito "4" para display de 7 segmentos �nodo.
         when '1'&X"5" => sal<=X"12";--Declaraci�n del d�gito "5" para display de 7 segmentos �nodo.
         when '1'&X"6" => sal<=X"03";--Declaraci�n del d�gito "6" para display de 7 segmentos �nodo.
         when '1'&X"7" => sal<=X"78";--Declaraci�n del d�gito "7" para display de 7 segmentos �nodo.
         when '1'&X"8" => sal<=X"00";--Declaraci�n del d�gito "8" para display de 7 segmentos �nodo.
         when '1'&X"9" => sal<=X"18";--Declaraci�n del d�gito "9" para display de 7 segmentos �nodo.
         when '1'&X"A" => sal<=X"08";--Declaraci�n del d�gito "A" para display de 7 segmentos �nodo.
         when '1'&X"B" => sal<=X"03";--Declaraci�n del d�gito "B" para display de 7 segmentos �nodo.
         when '1'&X"C" => sal<=X"27";--Declaraci�n del d�gito "C" para display de 7 segmentos �nodo.
         when '1'&X"D" => sal<=X"21";--Declaraci�n del d�gito "D" para display de 7 segmentos �nodo.
         when '1'&X"E" => sal<=X"06";--Declaraci�n del d�gito "E" para display de 7 segmentos �nodo.
         when others  => sal<=X"0E";--Declaraci�n del d�gito "F" para display de 7 segmentos �nodo.
        end case;--Finalizar la sentencia de control case.
       end process;--Finalizar proceso de decodificaci�n.
end Sum;

