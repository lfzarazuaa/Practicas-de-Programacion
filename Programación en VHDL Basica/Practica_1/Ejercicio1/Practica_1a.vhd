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
 SNS,EO: out std_logic);--Declaración de salida lógica.
end Practica_1;--Finalizar la entidad.

architecture Behavioral of Practica_1 is--Comenzar la declaración de la arquitectura.

begin--Empezar con la parte de declaración de sentencias.
     SNS <= ((A or B) and (C nor D)) or ((A and B) and (C nor D));--AC'D'+BC'D'+ABC'+ABD'=C'D'(A+B)+AB(C'+D')=(A+B)(C+D)'+AB(CD)';
    EO <=((not A) and (not B or C or D)) or ((not B) and (C or D)) or (C and D);--A'B'+A'C+A'D+B'C+B'D+CD=A'(B'+C+D)+B'(C+D)+CD;
end Behavioral;--Finalizar la arquitectura.

