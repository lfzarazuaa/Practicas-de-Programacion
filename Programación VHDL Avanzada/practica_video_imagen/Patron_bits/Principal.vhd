
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.costal.all;

entity Principal is
    Port ( mclk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (7 downto 0);
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC;
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0));
end Principal;

architecture Behavioral of Principal is

signal	clk25,vidon:	std_logic;
signal	hc,vc:			std_logic_vector(9	downto	0);
signal	rom_addr4:		std_logic_vector(3	downto	0);
signal	m:					std_logic_vector(0	to			31);

begin
u1:	clkdiv		port map(mclk	=>mclk,
									clr	=>clr,
									clk25	=>clk25);
								
u2:	vga_640x480	port map(clk	=>clk25,
									clr	=>clr,
									hsync	=>hsync,
									vsync	=>vsync,
									hc		=>hc,
									vc		=>vc,
									vidon	=>vidon);
									
u3:	prom			port map(addr	=>rom_addr4,
									m		=>m);

u4:	vga_imagen	port map(vidon	=>vidon,
									hc		=>hc,
									vc		=>vc,
									m		=>m,
									sw		=>sw,
									rom_addr4	=>rom_addr4,
									red	=>red,
									green	=>green,
									blue	=>blue);
									
end Behavioral;

