----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:21:01 03/05/2013 
-- Design Name: 
-- Module Name:    vga_sprite_top - Behavioral 
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
use work.vgacomp.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_sprite_top is
    Port ( mclk : in  STD_LOGIC;
           btn : in  STD_LOGIC_VECTOR (3 downto 0);
           sw : in  STD_LOGIC_VECTOR (7 downto 0);
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC;
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0));
end vga_sprite_top;

architecture Behavioral of vga_sprite_top is
signal clr, clk25, vidon: std_logic;
signal hc,vc: std_logic_vector(9 downto 0);
signal M: std_logic_vector (7 downto 0);
signal rom_addr: std_logic_vector (15 downto 0);

begin
   clr <= btn(3);
	
u1: clkdiv port map (mclk=>mclk, clr=>clr, clk25=>clk25);

u2: vga_640x480 port map (clk=>clk25, clr=>clr, hsync=>hsync, vsync=>vsync,
                          hc=>hc, vc=>vc, vidon=>vidon);

u3: vga_sprite port map (vidon=>vidon, hc=>hc, vc=>vc, M=>M, sw=> sw,
                         rom_addr=>rom_addr, red=>red, green=>green, blue=>blue);
								 
u4: rom240x160 port map (addr=>rom_addr, clk=>clk25,dout=>M);

end Behavioral;

