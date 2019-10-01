----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:08:07 02/21/2016 
-- Design Name: 
-- Module Name:    Practica_7486 - Behavioral 
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

entity Practica_7486 is--Declaración de la entidad.
   port(A1,B1,A2,B2,A3,B3,A4,B4: in std_logic;--Declaración de entradas lógicas.
        C1,C2,C3,C4: out std_logic);--Declaración de salidas lógicas.
end Practica_7486;--Finalizar la entidad.

architecture Behavioral of Practica_7486 is--Comenzar la declaración de la arquitectura.

begin--Empezar con la parte de declaración de sentencias.
     C1 <= A1 xor B1;--Operación lógica or exclusiva (A'B+AB')=A(+)B.
     C2 <= A2 xor B2;--Operación lógica or exclusiva (A'B+AB')=A(+)B.
	  C3 <= A3 xor B3;--Operación lógica or exclusiva (A'B+AB')=A(+)B.
	  C4 <= A4 xor B4;--Operación lógica or exclusiva (A'B+AB')=A(+)B.
end Behavioral;--Finalizar la arquitectura.

