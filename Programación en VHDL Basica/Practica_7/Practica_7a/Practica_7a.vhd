----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:49:00 05/23/2016 
-- Design Name: 
-- Module Name:    Practica_7a - Behavioral 
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

entity Practica_7a is
    port(clk,cs,we: in std_logic;--Declaración de entradas.
	      addr: in std_logic_vector(3 downto 0);
	      DataIN: in std_logic_vector(7 downto 0);
	      DataOUT: out std_logic_vector(7 downto 0));
end Practica_7a;

architecture Behavioral of Practica_7a is
     type Registro is array(0 to 15) of std_logic_vector(7 downto 0);--Declaración de la Memoria RAM con un tamaño de 16 bytes.
     Signal Regs: Registro;--Señal con la que se accede a la Memoria.
begin
     process(clk,cs,Regs,we)
	  begin
           if(cs='0')then--Si el chip select es 0 se pone en alta impedancia la memoria.
			 	 DataOUT<="XXXXXXXX";
			  else
			    if(clk'event and clk='1') then
				  if(we='1') then--Si We es 1 se escribe la memoria con el valor asignado.
				     Regs(conv_integer(addr))<=DataIN;
					  DataOUT<=Regs(conv_integer(addr));
				  else--Si We es 0 se lee la memoria.
				     DataOUT<=Regs(conv_integer(addr));
				  end if;
             end if;
            end if;				 
	  end process; 
end Behavioral;

