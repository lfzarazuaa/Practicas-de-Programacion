----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:08:48 03/04/2016 
-- Design Name: 
-- Module Name:    Practica_1 - Behavioral 
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

entity Practica_1 is--Declaración de la entidad.
port(A,B,C,D,E: in std_logic;--Declaración de entradas lógicas.
  Z4: out std_logic);--Declaración de salida lógica.
end Practica_1;--Finalizar la entidad.

architecture Behavioral of Practica_1 is--Comenzar la declaración de la arquitectura.

begin--Empezar con la parte de declaración de sentencias.
     Z4 <=((not E) and ((not A or (C and D)))) or ((A and E) and (B or (not C and D)));--A'E'+AC'DE+CDE'+ABE=E'(A'+CD)+AE(B+C'D).
end Behavioral;--Finalizar la arquitectura.

