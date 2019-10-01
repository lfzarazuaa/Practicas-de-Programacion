----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:57:56 03/31/2016 
-- Design Name: 
-- Module Name:    Practica_2d - Behavioral 
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

entity Motor is--Declaración de la entidad.
    port(ent: in std_logic_vector(10 downto 1);--Declaración de entradas lógicas.
         sal: out std_logic_vector(3 downto 0));--Declaración de salidas lógicas.
end;--Finalizar la entidad.

architecture Grados of Motor is--Comenzar la declaración de la arquitectura.
begin--Empezar con la parte de declaración de sentencias.
     with ent select--Elegir ent como variable para hacer la selección(x puede ser 1 o 0).
     sal <= "0001" when "---------1",--Si ent es xxxxxxxxx1 entonces sal es 0001.
            "0011" when "--------10",--Si ent es xxxxxxxx10 entonces sal es 0011.
            "0010" when "-------100",--Si ent es xxxxxxx100 entonces sal es 0010.
            "0110" when "------1000",--Si ent es xxxxxx1000 entonces sal es 0110.
            "0111" when "-----10000",--Si ent es xxxxx10000 entonces sal es 0111.
            "0101" when "----100000",--Si ent es xxxx100000 entonces sal es 0101.
            "0100" when "---1000000",--Si ent es xxx1000000 entonces sal es 0100.
            "1100" when "--10000000",--Si ent es xx10000000 entonces sal es 1100.
            "1101" when "-100000000",--Si ent es x100000000 entonces sal es 1101.
            "1111" when "1000000000",--Si ent es 1000000000 entonces sal es 1111.
            "0000" when others;
end Grados;--Finalizar la arquitectura.

