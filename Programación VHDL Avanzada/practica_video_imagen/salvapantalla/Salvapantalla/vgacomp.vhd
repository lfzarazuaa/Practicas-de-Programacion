--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package vgacomp is

component clkdiv 
    Port ( mclk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  clk190 : out std_logic;
           clk25 : out  STD_LOGIC);
end component;

component vga_640x480  
 port ( clk, clr: in std_logic;
         hsync : out std_logic;
			vsync : out std_logic;
			hc : out std_logic_vector(9 downto 0);
			vc : out std_logic_vector(9 downto 0);
			vidon : out std_logic);
end component;

component vga_sprite  
    Port ( vidon : in  STD_LOGIC;
           hc : in  STD_LOGIC_VECTOR (9 downto 0);
           vc : in  STD_LOGIC_VECTOR (9 downto 0);
           M : in  STD_LOGIC_VECTOR (7 downto 0);
           C1,R1: in std_logic_vector (9 downto 0);
           rom_addr : out  STD_LOGIC_VECTOR (15 downto 0);  
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0));
end component;


component rom240x160
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END component;

component vga_bounce is
    Port ( cclk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           go : in  STD_LOGIC;
           c1 : out  STD_LOGIC_VECTOR (9 downto 0);
           r1 : out  STD_LOGIC_VECTOR (9 downto 0));
END component;

end vgacomp;
