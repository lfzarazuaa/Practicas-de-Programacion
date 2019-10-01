----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:47:20 02/19/2016 
-- Design Name: 
-- Module Name:    Practica_0a - Behavioral 
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

entity Practica_0a is--Declaración de la entidad.
  port(w,x,y,z: in std_logic;--Declaración de entradas lógicas.
  scc1,scr1: out std_logic;--Declaración de salidas lógicas.
  scc2,scr2: out std_logic;--Declaración de salidas lógicas.
  scc3,scr3: out std_logic);--Declaración de salidas lógicas.
end Practica_0a;--Finalizar la entidad.

architecture Behavioral of Practica_0a is--Comenzar la declaración de la arquitectura.

begin--
     scc1 <=not(x and y and z) or ((not y)and((not x and z )or (x and not z)));--Ecuación sin reducir (XYZ)'+Y'(X'Z+XZ').
     scr1 <=not(x and y and z);--Ecuación reducida (XYZ)'.
	 scc2 <=not((z or not(not x and y))and not(y or w));--Ecuación sin reducir (Z+(X'Y)'(Y+W)'.
     scr2 <=w or y;--Ecuación reducida W+Y.
	 scc3 <=not(not(x or y)or(y and z and w))and not(x and y);--Ecuación sin reducir ((X+Y)'+(YZW))'(XY).
     scr3 <=((not x and y) and not(w and z)) or(x and not y);--Ecuación reducida (X'Y)(WZ)'+XY.
end Behavioral;--Finalizar la arquitectura.