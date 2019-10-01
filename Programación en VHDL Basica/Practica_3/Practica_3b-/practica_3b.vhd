library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MULT_Comp is--Declaración de la entidad.
   port( A,B: in std_logic_vector(3 downto 0);--Declaración de entradas lógicas.
         sal: out std_logic_vector(3 downto 0));--Declaración de salidas lógicas.
end;--Finalizar la entidad.

architecture ACOMP of MULT_Comp is--Comenzar la declaración de la arquitectura.
begin--Empezar con la parte de declaración de sentencias.
        process(A,B) begin--Inicio del proceso de comparación
        if(A>B) then--Si A es mayor que B se muestra en la salida.
          sal<=A;--Asignación de A en la salida.
        else--En caso contrario cuando B es mayor o igual que A se muestra en la salida.
          sal<=B;--Asignación de A en la salida.
        end if;--Finalizar la secuencia de control if.
        end process;--Finalizar el proceso de comparación y multiplexación.
end ACOMP;---Finalizar la arquitectura.

