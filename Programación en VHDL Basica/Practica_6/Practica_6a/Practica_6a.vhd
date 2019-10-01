----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:57 05/04/2016 
-- Design Name: 
-- Module Name:    Pract6_1 - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Practica6_a is port(
clk,se,r,j,k,t,d: in std_logic;
sq,snq,jq,jnq,tq,tnq,dq,dnq: out std_logic);
end Practica6_a;

architecture Behavioral of Practica6_a is
signal dato1,dato2,dato3,dato4:std_logic;
signal cont: std_logic_vector(24 downto 0);
signal clkx: std_logic;
begin
	process(clk)
		begin
		if (rising_edge(clk))then
			cont<=cont+1;
		end if;
		end process;
		clkx<=cont(24);

	process(clkx,r,se)begin
	if(clkx'event and clkx='1')then
		if(se='0' and r='0')then
			dato1<=dato1;
		elsif(se='1' and r='0')then
			dato1<='1';
		elsif(se='0' and r='1')then
			dato1<='0';
		else 
			dato1<='0';
		end if;
	end if;
	end process;
	sq<=dato1;
	snq<=not dato1;
	
	process(clkx,j,k)begin
	if(clkx'event and clkx='1')then
		if(j='0' and k='0')then
			dato2<=dato2;
		elsif(j='1' and k='0')then
			dato2<='1';
		elsif(j='0' and k='1')then
			dato2<='0';
		else
			dato2<=not dato2;
		end if;
	end if;
	end process;
	jq<=dato2;
	jnq<=not dato2;
	
	process(clkx,t)begin
	if(clkx'event and clkx='1')then
		if(t='0')then
			dato3<=dato3;
		else
			dato3<=not dato3;
			end if;
	end if;
	end process;
	tq<=dato3;
	tnq<=not dato3;
	
	process(clkx,d)begin
	if(clkx'event and clkx='1')then
		if(d='0')then
			dato4<='0';
		else
			dato4<='1';
		end if;
	end if;
	end process;
	dq<=dato4;
	dnq<=not dato4;
end Behavioral;