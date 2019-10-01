----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:45:07 02/21/2016 
-- Design Name: 
-- Module Name:    Practica_7404 - Behavioral 
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

entity Practica_7404 is--Declaración de la entidad.
     port(A1,A2,A3,A4,A5,A6: in std_logic;--Declaración de entradas lógicas.
          C1,C2,C3,C4,C5,C6: out std_logic);--Declaración de salidas lógicas.
end Practica_7404;--Finalizar la entidad.

architecture Behavioral of Practica_7404 is--Comenzar la declaración de la arquitectura.

begin
      C1 <= not A1;--Operación lógica not A'.
	  C2 <= not A2;--Operación lógica not A'.
	  C3 <= not A3;--Operación lógica not A'.
	  C4 <= not A4;--Operación lógica not A'.
	  C5 <= not A5;--Operación lógica not A'.
	  C6 <= not A6;--Operación lógica not A'.

end Behavioral;--Finalizar la arquitectura.

