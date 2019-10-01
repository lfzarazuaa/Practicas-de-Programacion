----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:50:06 02/21/2016 
-- Design Name: 
-- Module Name:    Practica_0b - Behavioral 
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

entity Practica_0b is--Declaración de la entidad.
   port(a,b,c,d: in std_logic;--Declaración de entradas lógicas.
        sx,sy: out std_logic);--Declaración de salidas lógicas.
end Practica_0b;--Finalizar la entidad.

architecture Behavioral of Practica_0b is--Comenzar la declaración de la arquitectura.

begin--Empezar con la parte de declaración de sentencias.
     sx <= (a and b) or (not a and not d) or
	  (b and not d) or (not a and b) or
	  (c and not d and a) or (not a and d) or
	  (c and d) or (not a and not b and not c);--Fómula de la ecuación aun sin reducir.
     sy <= (b or (not a) or c);--Equivalente de la ecuación reducida.
end Behavioral;--Finalizar la arquitectura.

