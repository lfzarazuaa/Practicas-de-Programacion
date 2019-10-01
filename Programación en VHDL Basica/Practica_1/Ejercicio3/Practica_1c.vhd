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
  Z3: out std_logic);--Declaración de salida lógica.
end Practica_1;--Finalizar la entidad.

architecture Behavioral of Practica_1 is--Comenzar la declaración de la arquitectura.

begin--Empezar con la parte de declaración de sentencias.
     Z3 <=((A or B) nor C) or ((A nor C) and D and E) or ((A nor D) and C) or ((B or C) nor D) or ((not B) and D and E) or (D nor E) or (A and B and C and E);
	 --A'B'C'+A'C'DE+A'CD'+B'C'D'+B'DE+D'E'+ABCE=A'(C'(B'+DE)+CD')+B'((C+D)'+DE)+(D+E)'+ABCE.
end Behavioral;--Finalizar la arquitectura.

