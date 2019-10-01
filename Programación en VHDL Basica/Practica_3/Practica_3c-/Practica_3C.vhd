----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:56:25 03/31/2016 
-- Design Name: 
-- Module Name:    Practica_3C - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Practica_3C is--Declaración de la entidad.
     port(A,B: in std_logic_vector(2 downto 0);--Declaración de entradas lógicas.
         Sal,Qs: out std_logic_vector(3 downto 0));--Declaración de salidas lógicas.
end Practica_3C;--Finalizar la entidad.
    
architecture Behavioral of Practica_3C is--Comenzar la declaración de la arquitectura.

begin--Empezar con la parte de declaración de sentencias.
      --Multiplexor Demultiplexor 74LS139.
      with A select--Elegir A como variable para hacer la selección.
     Sal <= "0111" when "000",--Si A es 000 entonces sal es 0111.
            "1011" when "001",--Si A es 001 entonces sal es 1011.
            "1101" when "010",--Si A es 010 entonces sal es 1101.
			"1110" when "011",--Si A es 011 entonces sal es 1110.
            "1111" when others;--Si En0 es 1 entonces sal es 1111.
				
		with B select--Elegir B como variable para hacer la selección.
      Qs <= "0111" when "000",--Si B es 000 entonces Qs es 0111.
            "1011" when "001",--Si B es 001 entonces Qs es 1011.
            "1101" when "010",--Si B es 010 entonces Qs es 1101.
			"1110" when "011",--Si B es 011 entonces Qs es 1110.
            "1111" when others;--Si En1 es 1 entonces Qs es 1111.
end Behavioral;




