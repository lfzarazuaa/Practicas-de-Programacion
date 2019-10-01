----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:27:04 03/12/2017 
-- Design Name: 
-- Module Name:    Selector_Velocidad - Behavioral 
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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Selector_Velocidad is
    Port ( clk : in  STD_LOGIC;
           Selector : in  STD_LOGIC_VECTOR (3 downto 0);
           clksal : out  STD_LOGIC);
end Selector_Velocidad;

--architecture Behavioral of Selector_Velocidad is
--signal q: std_logic_vector(25 downto 0);
--begin
--	process(clk,Selector)
--	begin
--		if (Selector(3) or Selector(2) or Selector(1) or Selector(0))='1' then
--			q <= (others => '0');
--			elsif rising_edge(clk) then
--				q <= q + 1;
--			end if;
--	end process;
--	
--	clksal <= q(25);
--	
--end Behavioral;
architecture Behavioral of Selector_Velocidad is
signal q: STD_LOGIC_VECTOR (23 downto 0):=X"000000";--0100111000100000=20000=>1seg.
--signal Opcion: STD_LOGIC_VECTOR (3 downto 0):=X"0";--Opción inicial en 0.
signal tiempo_medio: STD_LOGIC_VECTOR (23 downto 0);
signal tiempo_completo: STD_LOGIC_VECTOR (23 downto 0);
constant tiempo_medio_0: STD_LOGIC_VECTOR (23 downto 0):=X"150000";--1seg
constant tiempo_medio_1: STD_LOGIC_VECTOR (23 downto 0):=X"120000";--0.75seg
constant tiempo_medio_2: STD_LOGIC_VECTOR (23 downto 0):=X"100000";--0.5seg
constant tiempo_medio_3: STD_LOGIC_VECTOR (23 downto 0):=X"0F1000";--0.4seg
constant tiempo_medio_4: STD_LOGIC_VECTOR (23 downto 0):=X"0E0500";
constant tiempo_medio_5: STD_LOGIC_VECTOR (23 downto 0):=X"0D0000";
constant tiempo_medio_6: STD_LOGIC_VECTOR (23 downto 0):=X"0C0000";
constant tiempo_medio_7: STD_LOGIC_VECTOR (23 downto 0):=X"0A0000";
constant tiempo_medio_8: STD_LOGIC_VECTOR (23 downto 0):=X"090000";
constant tiempo_medio_9: STD_LOGIC_VECTOR (23 downto 0):=X"085000";
constant tiempo_medio_10: STD_LOGIC_VECTOR (23 downto 0):=X"080000";
begin
	 --Obtención del tiempo medio.
     process(Selector)
	  begin
          if Selector="0000" then tiempo_medio<=tiempo_medio_0;--Primer tiempo a elegir.
          elsif Selector="0001" then tiempo_medio<=tiempo_medio_1;--Segundo tiempo a elegir.
          elsif Selector="0010" then tiempo_medio<=tiempo_medio_2;--Tercer tiempo a elegir.
		    elsif Selector="0011" then tiempo_medio<=tiempo_medio_3;--Cuarto tiempo a elegir.
          elsif Selector="0100" then tiempo_medio<=tiempo_medio_4;--Quinto tiempo a elegir.
          elsif Selector="0101" then tiempo_medio<=tiempo_medio_5;--Sexto tiempo a elegir.
		    elsif Selector="0110" then tiempo_medio<=tiempo_medio_6;--Séptimo tiempo a elegir.
          elsif Selector="0111" then tiempo_medio<=tiempo_medio_7;--Octavo tiempo a elegir.
          elsif Selector="1000" then tiempo_medio<=tiempo_medio_8;--Noveno tiempo a elegir.
		    elsif Selector="1001" then tiempo_medio<=tiempo_medio_9;--Décimo tiempo a elegir.
		    else tiempo_medio<=tiempo_medio_10;--Onceavo tiempo a elegir.	
			 end if;
    tiempo_completo<=tiempo_medio+tiempo_medio;			 
	 end process;
	 --Obtención de la señal de reloj segun el tiempo seleccionado.
     process(clk,tiempo_completo,tiempo_medio,q)
	  begin 
		 if q>tiempo_completo then
			   q <= (others => '0');
		 elsif rising_edge(clk) then
				q <= q + 1;
		 end if;
		 if q>=tiempo_medio then
			   clksal<='0';
		 else
				clksal<='1';
		 end if;
	  end process;	  
end Behavioral; 


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.numeric_std.all;
--use IEEE.std_logic_unsigned.all;
--
--entity Selector_Velocidad is
--    Port ( clk : in  STD_LOGIC;
--           Selector : in  STD_LOGIC_VECTOR (3 downto 0);
--           clksal : out  STD_LOGIC);
--end Selector_Velocidad;
--
--architecture Behavioral of Selector_Velocidad is
--signal clkdiv: STD_LOGIC_VECTOR (23 downto 0):=X"000000";--0100111000100000=20000=>1seg.
----signal Opcion: STD_LOGIC_VECTOR (3 downto 0):=X"0";--Opción inicial en 0.
--signal tiempo_medio: STD_LOGIC_VECTOR (23 downto 0);
--signal tiempo_completo: STD_LOGIC_VECTOR (23 downto 0);
--constant tiempo_medio_0: STD_LOGIC_VECTOR (23 downto 0):=X"600000";--1seg
--constant tiempo_medio_1: STD_LOGIC_VECTOR (23 downto 0):=X"550000";--0.75seg
--constant tiempo_medio_2: STD_LOGIC_VECTOR (23 downto 0):=X"500000";--0.5seg
--constant tiempo_medio_3: STD_LOGIC_VECTOR (23 downto 0):=X"450000";--0.4seg
--constant tiempo_medio_4: STD_LOGIC_VECTOR (23 downto 0):=X"400000";
--constant tiempo_medio_5: STD_LOGIC_VECTOR (23 downto 0):=X"350000";
--constant tiempo_medio_6: STD_LOGIC_VECTOR (23 downto 0):=X"300000";
--constant tiempo_medio_7: STD_LOGIC_VECTOR (23 downto 0):=X"250000";
--constant tiempo_medio_8: STD_LOGIC_VECTOR (23 downto 0):=X"200000";
--constant tiempo_medio_9: STD_LOGIC_VECTOR (23 downto 0):=X"150000";
--constant tiempo_medio_10: STD_LOGIC_VECTOR (23 downto 0):=X"100000";
--begin
--	 --Obtención del tiempo medio.
--     process(Selector)
--	   begin
--		 case Selector is--Elegir Contador1 como señal para hacer la decodificación.
--          when "0000" => tiempo_medio<=tiempo_medio_0;--Primer tiempo a elegir.
--          when "0001" => tiempo_medio<=tiempo_medio_1;--Segundo tiempo a elegir.
--          when "0010" => tiempo_medio<=tiempo_medio_2;--Tercer tiempo a elegir.
--		    when "0011" => tiempo_medio<=tiempo_medio_3;--Cuarto tiempo a elegir.
--          when "0100" => tiempo_medio<=tiempo_medio_4;--Quinto tiempo a elegir.
--          when "0101" => tiempo_medio<=tiempo_medio_5;--Sexto tiempo a elegir.
--		    when "0110" => tiempo_medio<=tiempo_medio_6;--Séptimo tiempo a elegir.
--          when "0111" => tiempo_medio<=tiempo_medio_7;--Octavo tiempo a elegir.
--          when "1000" => tiempo_medio<=tiempo_medio_8;--Noveno tiempo a elegir.
--		    when "1001" => tiempo_medio<=tiempo_medio_9;--Décimo tiempo a elegir.
--		    when others  => tiempo_medio<=tiempo_medio_10;--Onceavo tiempo a elegir.
--       end case;	 
--	 end process;
--	 --Obtención del tiempo completo.
--	 process(tiempo_medio)
--	 begin
--	     tiempo_completo<=tiempo_medio+tiempo_medio;
--	 end process;
--	 --Obtención de la señal de reloj segun el tiempo seleccionado.
--     process(clk)
--	 begin
--	      if rising_edge(clk) then
--		     if clkdiv<=tiempo_completo then
--		        clkdiv<=clkdiv+1;
--			  else
--			    clkdiv<=X"000000";
--			  end if;
--            --clkdiv<=clkdiv+1;
--		  end if;
--	 end process;
--	 
--	 process(clk,clkdiv,tiempo_medio)
--	 begin
--	       if clkdiv<=tiempo_medio then--tiempo_medio then
--			    clksal<=clk;
--			 else
--			    clksal<='0';
--			 end if;
--	end process;
--end Behavioral;