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
			  clk190h : out std_logic;
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
		  data0 : in std_logic_vector(15 downto 0);
		  addr0 : out std_logic_vector(22 downto 0);
		  red : out std_logic_vector(2 downto 0);
		  green : out std_logic_vector(2 downto 0);
		  blue : out std_logic_vector(1 downto 0));
end component;
 
component buff3 
   generic(N:integer);
	port(input : in std_logic_vector(N-1 downto 0);
	     en : in std_logic;
	     output : out std_logic_vector(N-1 downto 0));
end component;

component clrscr 
    Port ( clk40 : in  STD_LOGIC;
           clk80 : in  STD_LOGIC;
           mclk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           go : in  STD_LOGIC;
           donec : out  STD_LOGIC;
           wec : out  STD_LOGIC;
           addrc : out  STD_LOGIC_VECTOR (22 downto 0);
           datac : out  STD_LOGIC_VECTOR (15 downto 0));
end component; 

component debounce4 
    Port ( clr : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           inp : in  STD_LOGIC_VECTOR(3 downto 0);
           outp : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component mux2g 
    generic (N: integer);
	 port (a : in std_logic_vector(N-1 downto 0);
			 b : in std_logic_vector(N-1 downto 0);
			 s : in std_logic;
			 y : out std_logic_vector(N-1 downto 0));
end component;

component mux2 
port ( a : in std_logic;
		 b : in std_logic;
		 s : in std_logic;
		 y : out std_logic);
end component;

component plot 
   port( clk80 : in std_logic;
	      clr : in std_logic;
			go : in std_logic;
			x,y : in std_logic_vector(9 downto 0);
			data_in : in std_logic_vector(15 downto 0);
			color : in std_logic_vector (7 downto 0);
			donep : out std_logic;
			wep : out std_logic;
			addrp : out std_logic_vector(22 downto 0);
			datap : out std_logic_vector(15 downto 0));
end component;

end vgacomp;
