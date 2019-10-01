library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Mult is
    port(clk: in std_logic;--Declaración de la entrada de reloj.
         Sal: out std_logic_vector(7 downto 0));--Declaración de salida del contador.
end;

architecture Contador of Mult is
begin
     process(clk)
      variable cuenta: std_logic_vector(28 downto 0);--Variable de 29 bits logrando en el bit 21 aprox 10 Hz.
     begin
      if(clk'event and clk='1')then--Realiza el conteo si se detecto un pulso de reloj.
       cuenta:=cuenta+1;--Incrementa en 1 la cuenta.
      end if;
      Sal<=cuenta(28 downto 21);--Muestra los 8 bits más significativos del contador cuenta.
     end process;
end Contador;

