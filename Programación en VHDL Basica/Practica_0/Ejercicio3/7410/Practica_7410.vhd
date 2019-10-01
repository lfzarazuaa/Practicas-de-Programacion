----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Luis Fernando Zarazua Aguilar
-- 
-- Create Date:    19:17:29 02/21/2016 
-- Design Name: 
-- Module Name:    Practica_7410 - Behavioral 
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

entity Practica_7410 is--Declaración de la entidad.
    port(A1,B1,C1,A2,B2,C2,A3,B3,C3: in std_logic;--Declaración de entradas lógicas.
        Q1,Q2,Q3: out std_logic);--Declaración de salidas lógicas.
end Practica_7410;--Finalizar la entidad.

architecture Behavioral of Practica_7410 is--Comenzar la declaración de la arquitectura.
     
begin
     Q1 <= (A1 and B1) nand C1;--Operación lógica nand triple (ABC)'=A'B'C'.
     Q2 <= (A2 and B2) nand C2;--Operación lógica nand triple (ABC)'=A'B'C'.
	  Q3 <= (A3 and B3) nand C3;--Operación lógica nand triple (ABC)'=A'B'C'.
end Behavioral;--Finalizar la arquitectura.

