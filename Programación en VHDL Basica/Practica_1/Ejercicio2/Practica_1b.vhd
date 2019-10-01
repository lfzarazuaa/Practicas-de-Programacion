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
port(A,B,C,D: in std_logic;--Declaración de entradas lógicas.
  Z2: out std_logic);--Declaración de salida lógica.
end Practica_1;--Finalizar la entidad.

architecture Behavioral of Practica_1 is--Comenzar la declaración de la arquitectura.

begin--Empezar con la parte de declaración de sentencias.
      Z2 <= ((not A) and C and (B nor D)) or ((not A) and B and D) or (A and ((B or C) nor D)) or (A and B and C) or (A and C and D);
	  --A'B'CD'+A'BD+AB'C'D'+ABC+ACD=A'(B'CD'+BD)+A(B'C'D'+C(B+D))=A'(C(B+D)'+BD)+A((B+C+D)'+C(B+D)).
end Behavioral;--Finalizar la arquitectura.

