library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Mult is
   port(clk: in std_logic;--Declaración de la entrada de reloj.
        R,G,B: in std_logic_vector(2 downto 0);--Declaración del control de R, G y B.
        SalR,SalG,SalB: out std_logic);--Declaración de las salidas R, G y B.
end;

architecture PWM of Mult is

begin
     process(clk,R)
      variable i: integer:=0;--Contador de pulsos.
     begin
      if(clk'event and clk='1')then--Realiza las acciones si hay un flanco de subida.
       i:=i+1;--Incrementa el contador en 1.
       if(i<7500 and R=1) then--Solo realiza hasta 7500 pulsos antes de apagar el led Rojo(Ánodo común) si 1 el selector.
         SalR<='0';
       elsif(i<15000 and R=2) then--Solo realiza hasta 15000 pulsos antes de apagar el led Rojo(Ánodo común) si 2 el selector.
         SalR<='0';
       elsif(i<25000 and R=3) then--Solo realiza hasta 25000 pulsos antes de apagar el led Rojo(Ánodo común) si 3 el selector.
         SalR<='0';
       elsif(i<30000 and R=4) then--Solo realiza hasta 30000 pulsos antes de apagar el led Rojo(Ánodo común) si 4 el selector.
         SalR<='0';
       elsif(i<35000 and R=5) then--Solo realiza hasta 35000 pulsos antes de apagar el led Rojo(Ánodo común) si 5 el selector.
         SalR<='0';
       elsif(i<42500 and R=6) then--Solo realiza hasta 42500 pulsos antes de apagar el led Rojo(Ánodo común) si 6 el selector.
         SalR<='0';
       elsif(i<50001 and R=7) then--Solo realiza hasta 50001 pulsos antes de apagar el led Rojo(Ánodo común) si 7 el selector.
         SalR<='0';
       elsif(i>50000) then--Reinicia el contador a 0 cuando llega a 50000.
         i:=0;
       else
         SalR<='1';--Si no se cumple la condición apaga el Led Rojo.
       end if;
       --
       if(i<7500 and G=1) then--Solo realiza hasta 7500 pulsos antes de apagar el led Verde(Ánodo común) si 1 el selector.
         SalG<='0';
       elsif(i<15000 and G=2) then--Solo realiza hasta 15000 pulsos antes de apagar el led Verde(Ánodo común) si 2 el selector.
         SalG<='0';
       elsif(i<25000 and G=3) then--Solo realiza hasta 25000 pulsos antes de apagar el led Verde(Ánodo común) si 3 el selector.
         SalG<='0';
       elsif(i<30000 and G=4) then--Solo realiza hasta 30000 pulsos antes de apagar el led Verde(Ánodo común) si 4 el selector.
         SalG<='0';
       elsif(i<35000 and G=5) then--Solo realiza hasta 35000 pulsos antes de apagar el led Verde(Ánodo común) si 5 el selector.
         SalG<='0';
       elsif(i<42500 and G=6) then--Solo realiza hasta 42500 pulsos antes de apagar el led Verde(Ánodo común) si 6 el selector.
         SalG<='0';
       elsif(i<50001 and G=7) then--Solo realiza hasta 50001 pulsos antes de apagar el led Verde(Ánodo común) si 7 el selector.
         SalG<='0';
       else--Si no se cumple la condición apaga el Led Verde.
         SalG<='1';
       end if;
       --
       if(i<7500 and B=1) then--Solo realiza hasta 7500 pulsos antes de apagar el led Azul(Ánodo común) si 1 el selector.
         SalB<='0';
       elsif(i<15000 and B=2) then--Solo realiza hasta 15000 pulsos antes de apagar el led Azul(Ánodo común) si 2 el selector.
         SalB<='0';
       elsif(i<25000 and B=3) then--Solo realiza hasta 25000 pulsos antes de apagar el led Azul(Ánodo común) si 3 el selector.
         SalB<='0';
       elsif(i<30000 and B=4) then--Solo realiza hasta 30000 pulsos antes de apagar el led Azul(Ánodo común) si 4 el selector.
         SalB<='0';
       elsif(i<35000 and B=5) then--Solo realiza hasta 35000 pulsos antes de apagar el led Azul(Ánodo común) si 5 el selector.
         SalB<='0';
       elsif(i<42500 and B=6) then--Solo realiza hasta 42500 pulsos antes de apagar el led Azul(Ánodo común) si 6 el selector.
         SalB<='0';
       elsif(i<50001 and B=7) then--Solo realiza hasta 50001 pulsos antes de apagar el led Azul(Ánodo común) si 7 el selector.
         SalB<='0';
       else--Si no se cumple la condición apaga el Led Azul.
         SalB<='1';
       end if;
      end if;
     end process;
end PWM;
