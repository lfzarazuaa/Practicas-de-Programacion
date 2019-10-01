----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:32:59 05/20/2016 
-- Design Name: 
-- Module Name:    Practica_6c - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Practica_6c is
    port(clk,sel: in std_logic;--Declara señal de reloj y el selector como entradas.
	      sal: out std_logic_vector(5 downto 0));--Declara como salidas los semáforos
end Practica_6c;

architecture Behavioral of Practica_6c is
	  Signal SCont,clks: std_logic;
	  Signal Contador: std_logic_vector(1 downto 0);
	  Signal Digito: std_logic_vector(2 downto 0);
begin
     process(clk)     
	  variable iCont : integer :=0;
	  begin
          if(clk'event and clk='1')then
				 iCont:=iCont+1;--Incrementa en 1 el contador.
				 if(iCont<12500000) then--Si el contador es menor de 12500000 pulsos, el pulso de conteo se mantiene en 0.
				  SCont <= '0';
				 elsif (iCont=25000000) then--Si el contador es de 25000000 el contador se resetea y el pulso se pone en 0.
				  iCont:=0;
				  SCont <= '0';
				 else--Si no se cumple ninguna el pulso de conteo sigue en alto.
				  SCont<='1';
				 end if;
          end if;				 
	  end process;
	  
	  process(SCont,sel)     
	  begin
				 if(sCont'event and sCont='1')then
				    Contador<=Contador+1;--Incrementa el contador en 1.
					 if(sel='1')then--Si el selector es 1 elige el bit 0 del contador(conteo rapido).
				    clks<=Contador(0);
				    else--Si el selector es 0 elige el bit 1 del contador(conteo lento).
				    clks<=Contador(1);
				    end if;
				 end if;
     end process;

	  
	  process(clks)     
	  begin
				 if(clks'event and clks='1')then--Si hubo un flanco de subida la fuente de reloj seleccionada incrementa en 1 el conteo.
				    Digito<=Digito+1;
				 end if;
     end process; 
	  
	  
	  process(Digito) begin--Comenzar el segundo proceso que decodifica el valor asignado en Dígito.
        case Digito is--Elegir Digito como señal para hacer la decodificación.
         --                  RAVRAV
         when "000" => sal<="001100";--Semáforo A en Verde y Semáforo B en Rojo. 
         when "001" => sal<="001100";--Semáforo A en Verde y Semáforo B en Rojo. 
         when "010" => sal<="001100";--Semáforo A en Verde y Semáforo B en Rojo. 
         when "011" => sal<="010100";--Semáforo A en Amarillo y Semáforo B en Rojo. 
         when "100" => sal<="100001";--Semáforo A en Rojo y Semáforo B en Verde. 
         when "101" => sal<="100001";--Semáforo A en Rojo y Semáforo B en Verde. 
         when "110" => sal<="100001";--Semáforo A en Rojo y Semáforo B en Verde. 
         when others => sal<="100010";--Semáforo A en Rojo y Semáforo B en Amarillo. 
	  end case;
	  end process; 
end Behavioral;