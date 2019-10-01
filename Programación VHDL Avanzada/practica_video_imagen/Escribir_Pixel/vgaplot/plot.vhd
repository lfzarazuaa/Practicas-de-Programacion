----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:09:22 04/05/2013 
-- Design Name: 
-- Module Name:    plot - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity plot is
   port( clk80 : in std_logic;--Reloj de 80ns.
	      clr : in std_logic;--Clear.
			go : in std_logic;--
			x,y : in std_logic_vector(9 downto 0);
			data_in : in std_logic_vector(15 downto 0);
			color : in std_logic_vector (7 downto 0);
			donep : out std_logic;
			wep : out std_logic;--write eneable plot.
			addrp : out std_logic_vector(22 downto 0);--Direccion donde se escribe.
			datap : out std_logic_vector(15 downto 0));
end plot;

architecture Behavioral of plot is
type state_type is (start,addrout,read1,setpix,hold,write1,wtngo);
signal state: state_type;
signal ram_addr: std_logic_vector(22 downto 0);
signal data: std_logic_vector(15 downto 0);
signal px: std_logic;

begin
   process(x,y)
	variable ram_addr1: std_logic_vector(22 downto 0);
	variable ram_addr2: std_logic_vector(22 downto 0);
	begin
	   ram_addr1 := ("00000" & y & "00000000") +
		             ("0000000" & y & "000000"); --y*(256+64)
						 
		ram_addr2 := ram_addr1 + 
		             ("00000000000000" & x(9 downto 1)); --y*230+x/2
						 
		px <= x(0);
		ram_addr <= ram_addr2;
	end process;
	--
	process(clk80,clr)
	begin
	     if clr='1' then
		     state<=start;
			  addrp<= (others => '0');
			  wep<='1';
			  donep<='1';
		  elsif rising_edge(clk80) then
		     case state is 
			   when start =>
				     wep<='1';
					  if go='1' then
					     state<= addrout;
						  donep<='0';
					  else
					     state<= start;
					  end if;
			   when addrout =>
				     state<=read1;
					  addrp<= ram_addr;
					  wep<='1';
				when read1 =>
				     state<=setpix;
					  data<=data_in;
					  wep<='1';
				when setpix =>
			        state<=hold;
					  wep<='1';
					  if px='0' then
					     datap<= color & data(7 downto 0);
					  else
					     datap<= data(15 downto 8)& color; 
					  end if;
				when hold =>--Escribe fisicamente en la memoria.
			        state<= write1;
					  wep<='0';
				when write1 =>
				     state<=wtngo;
					  donep<='1';
					  wep<='1';
				when wtngo =>
			        wep<='1';
					  if go='1' then
					     state<=wtngo;
					  else
					     state<=start;
					  end if;
			   --when others => null;
			  end case;
		  end if;
	end process;	
end Behavioral;

