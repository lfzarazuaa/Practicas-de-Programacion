--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.all;


package vgacomp is

component clkdiv 
    Port ( mclk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  clk80 : out std_logic;
           clk40 : out  STD_LOGIC);
end component;

component vga_640x480 
  port ( clk, clr: in std_logic;
         hsync : out std_logic;
			vsync : out std_logic;
			hc : out std_logic_vector(9 downto 0);
			vc : out std_logic_vector(9 downto 0);
			vidon : out std_logic);
end component;

component vga_ram 
   port(clk40,clk80,clr : in std_logic;
		  vidon : in std_logic;
		  hc : in std_logic_vector(9 downto 0);
		  vc : in std_logic_vector(9 downto 0);
		  selector : in std_logic_vector(2 downto 0);
		  data0 : in std_logic_vector(15 downto 0);
		  addr0 : out std_logic_vector(22 downto 0);
		  red : out std_logic_vector(2 downto 0);
		  green : out std_logic_vector(2 downto 0);
		  blue : out std_logic_vector(1 downto 0));
end component;
  
end vgacomp;
