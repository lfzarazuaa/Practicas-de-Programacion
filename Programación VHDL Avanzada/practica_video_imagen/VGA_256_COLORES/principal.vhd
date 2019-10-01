----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:32:07 03/17/2017 
-- Design Name: 
-- Module Name:    principal - Behavioral 
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
use work.costal.all;

entity principal is
    Port ( mclk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  Selec:  in STD_LOGIC_VECTOR (7 downto 0);
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC;
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0));
end principal;

architecture Behavioral of principal is

signal	clk25,vidon:	std_logic;
signal	hc,vc:				std_logic_vector(9 downto 0);
begin

u1:	clkdiv	port map	(mclk=>mclk,
								 clr=>clr,
								 clk25=>clk25);

u2:	vga_640x480	port map	(clk=>clk25,
								 clr=>clr,
								 hsync=>hsync,
								 vsync=>vsync,
								 hc=>hc,
								 vc=>vc,
								 vidon=>vidon);
								 
u3:	vga_stripes	port map	(vidon=>vidon,
								 hc=>hc,
								 vc=>vc,
								 Selector=>Selec,
								 red=>red,
								 green=>green,
								 blue=>blue);
								 
end Behavioral;

