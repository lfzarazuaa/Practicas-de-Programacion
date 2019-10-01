----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:20:41 03/12/2017 
-- Design Name: 
-- Module Name:    Contador_Comparador - Behavioral 
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


entity Contador_Comparador is 
    Port ( clk : in  STD_LOGIC; 
           Numero : in  STD_LOGIC_VECTOR (4 downto 0);
           Actualizar : in  STD_LOGIC;
           clksal : out  STD_LOGIC;
			  clksal2 : out  STD_LOGIC);
end Contador_Comparador;

architecture Behavioral of Contador_Comparador is
--signal Comparador:STD_LOGIC_VECTOR (4 downto 0):="00000";
signal Conteo: STD_LOGIC_VECTOR (5 downto 0):="000000";
signal clkdiv: STD_LOGIC_VECTOR (3 downto 0):="0000";
signal clkdiv2: STD_LOGIC;
signal clksalaux:  STD_LOGIC_VECTOR (0 downto 0);
signal clksal2aux:  STD_LOGIC_VECTOR(0 downto 0);
signal permiso: STD_LOGIC:='0';
signal Numaux: STD_LOGIC_VECTOR (5 downto 0);
begin
     Numaux<=Numero&"0";
     process(clk,clkdiv)
	  begin
	     if rising_edge(clk) then
		     if clkdiv<9 then
		      clkdiv<=clkdiv+1;
				if clkdiv<5 then
				   clkdiv2<='1';
				else
				   clkdiv2<='0';
				end if;
			  else
		         clkdiv<="0000";
			  end if;
		  end if;
	  end process;
     process(clkdiv2,Actualizar,Numaux,Conteo,permiso)--,permiso,Comparador)
	  begin
	    if (Actualizar='1' and Conteo=Numaux) then
		     Conteo<="000000";
			  permiso<='0';
	    else
			      --if Conteo<Numaux then
					 --permiso<='1';--clksal<=clk
					--else
					 --permiso<='0';--clksal<=clk
			      --end if;
			  if rising_edge(clkdiv2) then
			     if Conteo<Numaux then
				   Conteo<=Conteo+1;
					permiso<='1';
				  else
				   Conteo<=Numaux;
					permiso<='0';
				  end if;
			  end if; 
		 end if;
	  end process;
	  
	  process(clk,permiso)
	  begin
	       if falling_edge(clk) then
			    if permiso='1' then
				    clksalaux<=clksalaux+1;
				 else
				    clksalaux<="0";
			    end if;
			 end if;
	  end process;
	  
	  process(clkdiv2,permiso)
	  begin
	       if falling_edge(clkdiv2) then
			    if permiso='1' then
				    clksal2aux<=clksal2aux+1;
				 else
				    clksal2aux<="0";
			    end if;
			 end if;
	  end process;
	  
	  clksal<=clksalaux(0);
	  clksal2<=clksal2aux(0);
	  
end Behavioral;
--     process(clk,Actualizar,Numero,Conteo,permiso)
--	  begin
----	   if rising_edge(Actualizar) then
----				Comparador<=Numero;
----				Conteo<="00000";
------			else
------			   Comparador<=Comparador;
----      end if;
----		if rising_edge(clk) then
----		  if Actualizar=0 then
----			if Conteo<=Comparador then
----			Conteo<=Conteo+1;
----         else
----         Conteo<=Conteo;
----         end if;
----        if Actualizar=1 then			
----		end if;
--     if Actualizar='1' then	
----	     if rising_edge(Actualizar) then
--				Comparador<=Numero;
--				Conteo<="00000";
--				--permiso<='0';
--				--if rising_edge(clk) then
--				permiso<='0';
--				--end if;
----		  else
----			   Comparador<=Comparador;
----				Conteo<=Conteo;
----        end if;
----##
--	  else
--           Comparador<=Comparador;
--			  if rising_edge(clk) then
--			     if Conteo<Comparador then
--				   Conteo<=Conteo+1;
--				   permiso<='1';--clksal<=clk
--				  else
--				   Conteo<=Conteo;
--				   permiso<='0';
--			     end if;
--				else
--				  permiso<=permiso;
--				  --permiso<='1';
----			  elsif falling_edge(clk) then
----              clksal<='0';			  
----            else
----              Conteo<=Conteo;
----				  --permiso<='0';
----				  --if rising_edge(clk) then
----				   clksal<=clksal;
----				  --end if;
--				end if;
--	  end if;
--	  if permiso='1' then
--	     clksal<=clk;
--	   else
--	     clksal<='0';
--	   end if;
----	  if rising_edge(clk) or falling_edge(clk) then
----	    if permiso='1' then
----	       clksal<=clk;
----	    else
----	     clksal<='0';
----	    end if;
----	  end if;
--	  end process;

--architecture Behavioral of Contador_Comparador is
----signal Comparador:STD_LOGIC_VECTOR (4 downto 0):="00000";
--signal Conteo:STD_LOGIC_VECTOR (4 downto 0):="00000";
--signal permiso:STD_LOGIC:='0';
--begin
--     process(clk,Actualizar,Numero,Conteo)
--	  begin
--	   Comparador<="00000";
--      if Actualizar='1' then	
--				--Comparador<=Numero;
--				Conteo<="00000";
--				permiso<='1';
--	   elsif rising_edge(clk) then
--           --Comparador<=Comparador;
--			  permiso<='1';
--			  if Conteo<Numero+1 and permiso = '1' then
--				  Conteo<=Conteo+1;
--				  permiso<='1';
--            else
--              Conteo<=Conteo;
--				  permiso<='0';
--				end if;	  
--	   end if;
--	  end process;
--	  process(permiso,clk)
--	  begin
--	  	if permiso='1' then
--	     clksal<=clk;
--	   else
--	     clksal<='0';
--	   end if;
--	  end process;
--end Behavioral;