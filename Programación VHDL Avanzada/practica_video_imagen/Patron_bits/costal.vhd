library IEEE;
use IEEE.STD_LOGIC_1164.all;

package costal is

component clkdiv 
    Port ( clr : in  STD_LOGIC;
           mclk : in  STD_LOGIC;
           clk25 : out  STD_LOGIC);
end component;

component prom 
    Port ( addr : in  STD_LOGIC_VECTOR (3 downto 0);
           m : out  STD_LOGIC_VECTOR (0 to 31));
end component;

component vga_640x480
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC;
           hc : out  STD_LOGIC_VECTOR (9 downto 0);
           vc : out  STD_LOGIC_VECTOR (9 downto 0);
           vidon : out  STD_LOGIC);
end component;


component vga_imagen 
    Port ( vidon : in  STD_LOGIC;
           hc : in  STD_LOGIC_VECTOR (9 downto 0);
           vc : in  STD_LOGIC_VECTOR (9 downto 0);
           m : in  STD_LOGIC_VECTOR (0 to 31);
           sw : in  STD_LOGIC_VECTOR (7 downto 0);
           rom_addr4 : out  STD_LOGIC_VECTOR (3 downto 0);
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0));
end component;
 
end costal;
