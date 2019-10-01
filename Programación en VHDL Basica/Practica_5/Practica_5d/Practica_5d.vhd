library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MonoR is
   port(clk,trig: in std_logic;--Declaración de la entrada de reloj y del trigger.
         pulso: out std_logic_vector(4 downto 0));--Salidas de los monoestables.
end;

architecture AMonoR of MonoR is
Signal dato: std_logic_vector(4 downto 0);--Declaración de señal dato que incluye a los 5 monoestables.
begin
     process(clk)
      variable i1,i2,i3,i4,i5: integer:=0;--Declaración de los 5 contadores de los monoestables.
     begin
      if(clk'event and clk='1')then--Si detecta un flanco de subida.
        -- 1 Segundo
		  if(trig='1') then--Si el trigger es 1.
            dato<="11111";--Pone en alto las salidas del monoestable.
            i1:=0;--Resetea los contadores.
				i2:=0;
				i3:=0;
				i4:=0;
				i5:=0;
			end if;
        if(dato(0)='1') then--Si el monoestable 1 esta en alto.
         i1:=i1+1;--Incrementa el contador en 1.
         if(i1=50000000) then--Si el contador lleva 1 segundo resetea el contador y el monoestable.
          i1:=0;
          dato(0)<='0';
         end if;
        end if;
        -- 2 Segundos
        if(dato(1)='1') then--Si el monoestable 2 esta en alto.
         i2:=i2+1;--Incrementa el contador en 1.
         if(i2=100000000) then--Si el contador lleva 2 segundos resetea el contador y el monoestable.
          i2:=0;
          dato(1)<='0';
         end if;
        end if;
        -- 3 Segundos
        if(dato(2)='1') then--Si el monoestable 3 esta en alto.
         i3:=i3+1;--Incrementa el contador en 1.
         if(i3=150000000) then--Si el contador lleva 3 segundos resetea el contador y el monoestable.
          i3:=0;
          dato(2)<='0';
         end if;
        end if;
        -- 4 Segundos
        if(dato(3)='1') then--Si el monoestable 4 esta en alto.
         i4:=i4+1;--Incrementa el contador en 1.
         if(i4=200000000) then--Si el contador lleva 4 segundos resetea el contador y el monoestable.
          i4:=0;
          dato(3)<='0';
         end if;
        end if;
        -- 5 Segundos
        if(dato(4)='1') then--Si el monoestable 5 esta en alto.
         i5:=i5+1;--Incrementa el contador en 1.
         if(i5=250000000) then--Si el contador lleva 5 segundos resetea el contador y el monoestable.
          i5:=0;
          dato(4)<='0';
         end if;
        end if;
     end if;
     end process;
	  pulso<=dato;--Iguala a la salida con lo que hay en dato.
end AMonoR;

