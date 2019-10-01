library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Mult is
    port(A,B: in std_logic_vector(2 downto 0);--Declaración de entradas lógicas.
         sel: in std_logic;
         Sal: out std_logic_vector(7 downto 0)); --Declaración de salidas lógica.
end; 

architecture Sum of Mult is
      Signal Digito: std_logic_vector(4 downto 0);--Declaración de la señal que se usa como señal intermedia en un proceso.
      begin--Empezar con la parte de declaración de sentencias.
       process(sel,A,B) begin--Comenzar el primer proceso que elige en base al selector el dato a pasar.
        if(sel ='0') then--Sentencia de control if, si es 1 pasa el dato A.
          Digito<=("00"&A)+B;--Asignación del dato A+B en Dígito si sel es 0.
        else--En caso contrario pasa el dato A-B.
          if(A>B) then
          Digito<=("00"&A)-B;--Asignación del dato A-B en Dígito.
          else
          Digito<=(("00"&B)-A) or ("10000");--Asignación del dato B-A en Dígito.
          end if;--Final de la secuencia de control if.
        end if;--Final de la secuencia de control if.
       end process;--Final del primer proceso en el cual se da el valor de Dígito.
       
       process(Digito) begin--Comenzar el segundo proceso que decodifica el valor asignado en Dígito.
        case Digito is--Elegir ent como señal para hacer la decodificación.
         when '0'&X"0" => sal<=X"C0";--Declaración del dígito "0" para display de 7 segmentos ánodo.
         when '0'&X"1" => sal<=X"F9";--Declaración del dígito "1" para display de 7 segmentos ánodo.
         when '0'&X"2" => sal<=X"A4";--Declaración del dígito "2" para display de 7 segmentos ánodo.
         when '0'&X"3" => sal<=X"B0";--Declaración del dígito "3" para display de 7 segmentos ánodo.
         when '0'&X"4" => sal<=X"99";--Declaración del dígito "4" para display de 7 segmentos ánodo.
         when '0'&X"5" => sal<=X"92";--Declaración del dígito "5" para display de 7 segmentos ánodo.
         when '0'&X"6" => sal<=X"83";--Declaración del dígito "6" para display de 7 segmentos ánodo.
         when '0'&X"7" => sal<=X"F8";--Declaración del dígito "7" para display de 7 segmentos ánodo.
         when '0'&X"8" => sal<=X"80";--Declaración del dígito "8" para display de 7 segmentos ánodo.
         when '0'&X"9" => sal<=X"98";--Declaración del dígito "9" para display de 7 segmentos ánodo.
         when '0'&X"A" => sal<=X"88";--Declaración del dígito "A" para display de 7 segmentos ánodo.
         when '0'&X"B" => sal<=X"83";--Declaración del dígito "B" para display de 7 segmentos ánodo.
         when '0'&X"C" => sal<=X"A7";--Declaración del dígito "C" para display de 7 segmentos ánodo.
         when '0'&X"D" => sal<=X"A1";--Declaración del dígito "D" para display de 7 segmentos ánodo.
         when '0'&X"E" => sal<=X"86";--Declaración del dígito "E" para display de 7 segmentos ánodo.
         when '0'&X"F" => sal<=X"8E";--Declaración del dígito "F" para display de 7 segmentos ánodo.
         --Numeros Negativos.
         when '1'&X"0" => sal<=X"40";--Declaración del dígito "0" para display de 7 segmentos ánodo.
         when '1'&X"1" => sal<=X"79";--Declaración del dígito "1" para display de 7 segmentos ánodo.
         when '1'&X"2" => sal<=X"24";--Declaración del dígito "2" para display de 7 segmentos ánodo.
         when '1'&X"3" => sal<=X"30";--Declaración del dígito "3" para display de 7 segmentos ánodo.
         when '1'&X"4" => sal<=X"19";--Declaración del dígito "4" para display de 7 segmentos ánodo.
         when '1'&X"5" => sal<=X"12";--Declaración del dígito "5" para display de 7 segmentos ánodo.
         when '1'&X"6" => sal<=X"03";--Declaración del dígito "6" para display de 7 segmentos ánodo.
         when '1'&X"7" => sal<=X"78";--Declaración del dígito "7" para display de 7 segmentos ánodo.
         when '1'&X"8" => sal<=X"00";--Declaración del dígito "8" para display de 7 segmentos ánodo.
         when '1'&X"9" => sal<=X"18";--Declaración del dígito "9" para display de 7 segmentos ánodo.
         when '1'&X"A" => sal<=X"08";--Declaración del dígito "A" para display de 7 segmentos ánodo.
         when '1'&X"B" => sal<=X"03";--Declaración del dígito "B" para display de 7 segmentos ánodo.
         when '1'&X"C" => sal<=X"27";--Declaración del dígito "C" para display de 7 segmentos ánodo.
         when '1'&X"D" => sal<=X"21";--Declaración del dígito "D" para display de 7 segmentos ánodo.
         when '1'&X"E" => sal<=X"06";--Declaración del dígito "E" para display de 7 segmentos ánodo.
         when others  => sal<=X"0E";--Declaración del dígito "F" para display de 7 segmentos ánodo.
        end case;--Finalizar la sentencia de control case.
       end process;--Finalizar proceso de decodificación.
end Sum;

