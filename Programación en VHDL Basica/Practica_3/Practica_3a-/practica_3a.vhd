library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Mult is--Declaración de la entidad.
    port(sel: in std_logic;
         A,B: in std_logic_vector(3 downto 0);--Declaración de entradas lógicas.
         sal: out std_logic_vector(7 downto 0));--Declaración de salidas lógicas.
end;--Finalizar la entidad.

architecture Decoder of Mult is--Comenzar la declaración de la arquitectura.
      Signal Digito: std_logic_vector(3 downto 0);--Declaración de la señal que se usa como señal intermedia en un proceso.
      begin--Empezar con la parte de declaración de sentencias.
       process(sel,A,B) begin--Comenzar el primer proceso que elige en base al selector el dato a pasar.
        if(sel ='1') then--Sentencia de control if, si es 1 pasa el dato A.
          Digito<=A;--Asignación del dato A en Dígito.
        else--En caso contrario pasa el dato B.
          Digito<=B;--Asignación del dato B en Dígito.
        end if;--Final de la secuencia de control if.
       end process;--Final del primer proceso en el cual se da el valor de Dígito.
       
       process(Digito) begin--Comenzar el segundo proceso que decodifica el valor asignado en Dígito.
        case Digito is--Elegir ent como señal para hacer la decodificación.
         when X"0" => sal<=X"C0";--Declaración del dígito "0" para display de 7 segmentos ánodo.
         when X"1" => sal<=X"F9";--Declaración del dígito "1" para display de 7 segmentos ánodo.
         when X"2" => sal<=X"A4";--Declaración del dígito "2" para display de 7 segmentos ánodo.
         when X"3" => sal<=X"B0";--Declaración del dígito "3" para display de 7 segmentos ánodo.
         when X"4" => sal<=X"99";--Declaración del dígito "4" para display de 7 segmentos ánodo.
         when X"5" => sal<=X"92";--Declaración del dígito "5" para display de 7 segmentos ánodo.
         when X"6" => sal<=X"83";--Declaración del dígito "6" para display de 7 segmentos ánodo.
         when X"7" => sal<=X"F8";--Declaración del dígito "7" para display de 7 segmentos ánodo.
         when X"8" => sal<=X"80";--Declaración del dígito "8" para display de 7 segmentos ánodo.
         when X"9" => sal<=X"98";--Declaración del dígito "9" para display de 7 segmentos ánodo.
         when X"A" => sal<=X"A7";--Declaración del dígito "A" para display de 7 segmentos ánodo.
         when X"B" => sal<=X"B3";--Declaración del dígito "B" para display de 7 segmentos ánodo.
         when X"C" => sal<=X"9D";--Declaración del dígito "C" para display de 7 segmentos ánodo.
         when X"D" => sal<=X"96";--Declaración del dígito "D" para display de 7 segmentos ánodo.
         when X"F" => sal<=X"87";--Declaración del dígito "E" para display de 7 segmentos ánodo.
         when others => sal<=X"FF";--Declaración del dígito "F" para display de 7 segmentos ánodo.
        end case;--Finalizar la sentencia de control case.
       end process;--Finalizar proceso de decodificación.
       
end Decoder;---Finalizar la arquitectura.
