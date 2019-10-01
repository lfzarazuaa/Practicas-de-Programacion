----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:32:51 02/21/2016 
-- Design Name: 
-- Module Name:    Practica_7421 - Behavioral 
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

entity Practica_7421 is--Declaración de la entidad.
    port(A1,B1,C1,D1,A2,B2,C2,D2: in std_logic;--Declaración de entradas lógicas.
        Q1,Q2: out std_logic);--Declaración de salidas lógicas.
end Practica_7421;--Finalizar la entidad.

architecture Behavioral of Practica_7421 is--Comenzar la declaración de la arquitectura.
     
begin
     Q1 <= A1 and B1 and C1 and D1;--Operación lógica and cuadruple (ABC)=ABCD.
     Q2 <= A2 and B2 and C2 and D2;--Operación lógica and cuadruple (ABC)=ABCD.

end Behavioral;--Finalizar la arquitectura.

