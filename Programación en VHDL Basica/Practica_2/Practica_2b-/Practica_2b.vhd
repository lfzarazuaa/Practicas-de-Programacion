library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity DISPLAY is--Declaración de la entidad.
   port(ent: in std_logic_vector(3 downto 0);--Declaración de entradas lógicas.
        sal: out std_logic_vector(7 downto 0));--Declaración de salidas lógicas.
end;--Finalizar la entidad.

architecture A7SEG of DISPLAY is--Comenzar la declaración de la arquitectura.
begin--Empezar con la parte de declaración de sentencias.
     --Declaración lógica del Decodificador de 7 segmentos.
     with ent select
     sal <=  X"C0" when X"0",--Declaración del dígito "0" para display de 7 segmentos ánodo.
             X"79" when X"1",--Declaración del dígito "1" para display de 7 segmentos ánodo.
             X"A4" when X"2",--Declaración del dígito "2" para display de 7 segmentos ánodo.
             X"30" when X"3",--Declaración del dígito "3" para display de 7 segmentos ánodo.
             X"99" when X"4",--Declaración del dígito "4" para display de 7 segmentos ánodo.
             X"12" when X"5",--Declaración del dígito "5" para display de 7 segmentos ánodo.
             X"83" when X"6",--Declaración del dígito "6" para display de 7 segmentos ánodo.
             X"78" when X"7",--Declaración del dígito "7" para display de 7 segmentos ánodo.
             X"80" when X"8",--Declaración del dígito "8" para display de 7 segmentos ánodo.
             X"18" when X"9",--Declaración del dígito "9" para display de 7 segmentos ánodo.
             X"A7" when X"A",--Declaración del dígito "A" para display de 7 segmentos ánodo.
             X"33" when X"B",--Declaración del dígito "B" para display de 7 segmentos ánodo.
             X"9D" when X"C",--Declaración del dígito "C" para display de 7 segmentos ánodo.
             X"16" when X"D",--Declaración del dígito "D" para display de 7 segmentos ánodo.
             X"87" when X"E",--Declaración del dígito "E" para display de 7 segmentos ánodo.
             X"7F" when others;--Declaración del dígito "F" para display de 7 segmentos ánodo.
end A7SEG;--Finalizar la arquitectura.

