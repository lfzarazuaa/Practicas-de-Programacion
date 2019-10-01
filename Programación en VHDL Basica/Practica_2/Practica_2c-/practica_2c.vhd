library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Stereo is--Declaración de la entidad.
   port(ent: in std_logic_vector(3 downto 0);--Declaración de entradas lógicas.
         sal: out std_logic_vector(1 downto 0));--Declaración de salidas lógicas.
end;--Finalizar la entidad.

architecture Selector of Stereo is--Comenzar la declaración de la arquitectura.
begin--Empezar con la parte de declaración de sentencias.
     --Declaración lógica del Codificador para estereo.
     with ent select--Elegir ent como variable para hacer la selección.
     sal <= "00" when "0001",--Si ent es 0001 entonces sal es 00.
            "01" when "0010",--Si ent es 0010 entonces sal es 01.
            "10" when "0100",--Si ent es 0100 entonces sal es 10.
            "11" when "1000",--Si ent es 1000 entonces sal es 11.
            "00" when others;--Si ent es otra combinación entonces sal es 00.
end Selector;--Finalizar la arquitectura.

