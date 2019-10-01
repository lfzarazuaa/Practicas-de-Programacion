----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:55:18 05/23/2016 
-- Design Name: 
-- Module Name:    Practica_7b - Behavioral 
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

entity Practica_7b is
     port(clk,sel,cs: in std_logic;--Declaración de entradas.
	       control: out std_logic_vector(3 downto 0);--Declaración de los pines comunes de los displays
	       Dato: out std_logic_vector(7 downto 0));--Declaración de los segmentos de los displays.
end Practica_7b;

architecture Behavioral of Practica_7b is
	  Type Registros is array(0 to 15) of std_logic_vector(7 downto 0);
	  constant Regs: Registros:= (x"C7", x"C1", x"F9", x"92",
	                              x"FF", x"C8", x"F9", x"90",
											x"C1", x"86", x"C7", x"FF", 
											x"88", x"C7", x"A1", x"C0");--Declaración de la memoria ROM con los datos de las letras en 7 segmentos.
	  Signal SCont,clks: std_logic;
	  Signal Addr: std_logic_vector(3 downto 0);
	  Signal SMues: std_logic;
	  Signal Contador: std_logic_vector(9 downto 0);
	  Signal ContM: std_logic_vector(1 downto 0);
begin
     process(clk)     
	  variable icont : integer :=0;--Declaración del contador.
	  begin
          if(clk'event and clk='1')then
             iCont:=iCont+1;
				 if(iCont>50000) then--Si iCont es mayor a 50000 el contador se resetea y pone en alto el pulso del Contador.
             iCont:=0;
				 SCont <= '1';
				 else--Si no se cumple la condición pone en bajo el pulso del Contador.
				 SCont <= '0';
				 end if;
          end if;				 
	  end process;

     process(clk)     
	  variable iMues : integer :=0;--Declaración de la variable del Contador de Muestreo
	  begin
          if(clk'event and clk='1')then--Genera el pulso de muestreo.
				 iMues:=iMues+1;
				 if(iMues<50000) then
				  SMues <= '0';
				 elsif (iMues=100000) then
				  iMues:=0;
				  SMues <= '0';
				 else
				  Smues<='1';
				 end if;
          end if;				 
	  end process;
	  
	  process(SMues)     
	  begin
			   if(SMues'event and sMues='1')then--Genera el Contador M para multiplexar los displays. 
              ContM<=ContM+1;
			   end if;
     end process;
	  
	  process(SCont,Sel)     
	  begin
			   if(sCont'event and sCont='1')then
              Contador<=Contador+1;--Incrementa en 1 el contador.
				  if(Sel = '0') then--Seleciona la fuente de reloj para el contador de direcciones.
				   clks<=Contador(8);
				  else
				   clks<=Contador(9);
				  end if;
			   end if;
     end process;
	  
	  process(clks)     
	  begin
				 if(clks'event and clks='1')then--Incrementa la dirección segun la fuente seleccionada y un flanco de subida.
				   Addr<=Addr+1; 
				 end if;
     end process; 

	  process(Addr,ContM,cs)     
	  begin
				 if(cs='1' and Smues='1') then--Si el cs es 1 la señal de muestreo está activa actualiza el dato con lo contenido en la dirección mas el contador de muestreo.
				  Dato<=Regs(conv_integer(Addr+ContM));
				 else--De lo contrario se pone en ceros la salida.
				  Dato<="11111111";
				 end if;
     end process;
	  
	  process(ContM) begin--Comenzar el segundo proceso que decodifica el valor asignado en Dígito.
       case ContM is--Elegir Digito como señal para hacer la decodificación.
         when "00" => Control<="0111";--Prende el primer display.
         when "01" => Control<="1011";--Prende el segundo display.
         when "10" => Control<="1101";--Prende el tercer display.
         when others => Control<="1110";--Prende el cuarto display.
	    end case;
	  end process;
end Behavioral;