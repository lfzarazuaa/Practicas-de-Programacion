----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:53:43 03/11/2013 
-- Design Name: 
-- Module Name:    vga_extram_top - Behavioral 
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

entity vga_extram_top is
   port (mclk : in std_logic;
		   btn : in std_logic_vector(3 downto 0);
			hsync : out std_logic;
			vsync : out std_logic;
			red : out std_logic_vector(2 downto 0);
			green : out std_logic_vector(2 downto 0);
	      blue : out std_logic_vector(1 downto 0);
	      A : out std_logic_vector(22 downto 0);
			DQ : in std_logic_vector(15 downto 0);
			CE_L : out std_logic;
			UB_L : out std_logic;
			LB_L : out std_logic;
			WE_L : out std_logic;
			OE_L : out std_logic;
			FlashCE_L : out std_logic;
			RamCLK : out std_logic;
			RamADV_L : out std_logic;
			RamCRE : out std_logic);
end vga_extram_top;

architecture Behavioral of vga_extram_top is
signal clr, clk40,clk80,vidon : std_logic;
signal hc,vc : std_logic_vector(9 downto 0);
signal data0 : std_logic_vector(15 downto 0);
signal addr0 : std_logic_vector(22 downto 0);

begin
   clr <= btn(3);
	A <= addr0;
	FlashCE_L <= '1'; --desabilita flash
	CE_L <= '0';   --habilita ram
	UB_L <= '0';
	LB_L <= '0';
	RamCLK <= '0';
	RamADV_L <= '0';
	RamCRE <= '0';
	WE_L <= '1';  --solo lectura
	OE_L <= '0';  --habilita bus de datos
	data0 <= DQ;
	
u1: clkdiv port map (mclk => mclk, clr =>clr, clk80 => clk80, clk40 => clk40);

u2: vga_640x480 port map (clk => clk40, clr=> clr, hsync => hsync, vsync=>vsync,
                         hc => hc, vc => vc, vidon => vidon);

u3: vga_ram port map (clk40 => clk40, clk80=>clk80, clr => clr, vidon => vidon,
                   hc => hc, vc => vc, data0 => data0, addr0 => addr0, red=> red,
						 green => green, blue => blue);

end Behavioral;