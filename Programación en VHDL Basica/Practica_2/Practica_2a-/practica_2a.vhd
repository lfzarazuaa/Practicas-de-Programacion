library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Semaforo is--Declaración de la entidad.
    port(ent: in std_logic_vector(1 downto 0);--Declaración de entradas lógicas.
         sal: out std_logic_vector(3 downto 0));--Declaración de salidas lógicas.
end;--Finalizar la entidad.

architecture ASemaforo of Semaforo is--Comenzar la declaración de la arquitectura.
begin--Empezar con la parte de declaración de sentencias.
     --Declaración lógica del Decodificador para semáforo.
     with ent select--Elegir ent como variable para hacer la selección.
     sal <= "1000" when "00",--Si ent es 00 entonces sal es 1000.
            "0100" when "01",--Si ent es 01 entonces sal es 0100.
            "0010" when "10",--Si ent es 10 entonces sal es 0010.
            "0001" when others;--Si ent es 11 entonces sal es 0001.
end ASemaforo;--Finalizar la arquitectura.

