----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:19:20 02/19/2016 
-- Design Name: 
-- Module Name:    Practica_7400 - Behavioral 
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

entity Practica_7400 is--Declaración de la entidad.
   port(A1,B1,A2,B2,A3,B3,A4,B4: in std_logic;--Declaración de entradas lógicas.
        C1,C2,C3,C4: out std_logic);--Declaración de salidas lógicas.
end Practica_7400;--Finalizar la entidad.

architecture Behavioral of Practica_7400 is--Comenzar la declaración de la arquitectura.
begin
     C1 <= A1 nand B1;--Operación lógica nand entre 2 valores=> (AB)'=A'B'.
     C2 <= A2 nand B2;--Operación lógica nand entre 2 valores=> (AB)'=A'B'.
	  C3 <= A3 nand B3;--Operación lógica nand entre 2 valores=> (AB)'=A'B'.
	  C4 <= A4 nand B4;--Operación lógica nand entre 2 valores=> (AB)'=A'B'.
end Behavioral;--Finalizar la arquitectura.