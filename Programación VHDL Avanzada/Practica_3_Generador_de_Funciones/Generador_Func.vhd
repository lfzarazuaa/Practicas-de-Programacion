----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:38:14 05/19/2017 
-- Design Name: 
-- Module Name:    Generador_Func - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Generador_Func is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           cuentamax : in  STD_LOGIC_VECTOR (17 downto 0);
		   sel_senal : in  STD_LOGIC_VECTOR (1 downto 0);
           Direccion_Memoria_Senal : out  STD_LOGIC_VECTOR (9 downto 0));
end Generador_Func;

architecture Behavioral of Generador_Func is
signal contador: std_logic_vector(7 downto 0);--Contador de Muestras.
signal masterc: std_logic_vector(17 downto 0);--0-196078 para 1Hz Contador de Intervalo.
begin
      process(clk,rst)
		begin
		     if rst='1' then
			    contador <="00000000";
			  elsif rising_edge(clk) then
			     masterc<=masterc+1;
				  if masterc>cuentamax then--Indica hasta que número llegar antes de incrementar el contador.
				     masterc<=(others =>'0');--Resetea el contador que controla la frecuencia.
					  contador<=contador+1;--Incrementa el contador para acceder a la señal.
				  end if;
			  end if;
		end process;
		Direccion_Memoria_Senal<=sel_senal & contador;--Concatenar selector de señal y conteo.
end Behavioral;