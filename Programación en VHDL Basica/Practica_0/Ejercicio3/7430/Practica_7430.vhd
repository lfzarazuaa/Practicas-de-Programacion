----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:38:59 02/21/2016 
-- Design Name: 
-- Module Name:    Practica_7430 - Behavioral 
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

entity Practica_7430 is--Declaración de la entidad.
     port(A,B,C,D,E,F1,G1,H1: in std_logic;--Declaración de entradas lógicas.
        Q: out std_logic);--Declaración de salida lógica.
end Practica_7430;--Finalizar la entidad.

architecture Behavioral of Practica_7430 is--Comenzar la declaración de la arquitectura.
     
begin
     Q <= (A and B and C and D and E and F1 and G1) nand H1;--Operación lògica NAND 8 entradas(solo se apaga si todas son 1)=>(ABCDEFGH)'.

end Behavioral;--Finalizar la arquitectura.

