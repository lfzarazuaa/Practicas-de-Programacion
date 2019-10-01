----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:48:13 04/05/2013 
-- Design Name: 
-- Module Name:    plotdot_top - Behavioral 
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

entity plotdot_top is
port (mclk : in std_logic;
		   btn : in std_logic_vector(3 downto 0);
			sw : in std_logic_vector(7 downto 0);
			hsync : out std_logic;
			vsync : out std_logic;
			red : out std_logic_vector(2 downto 0);
			green : out std_logic_vector(2 downto 0);
	      blue : out std_logic_vector(1 downto 0);
	      A : out std_logic_vector(22 downto 0);
			DQ : inout std_logic_vector(15 downto 0);
			CE_L : out std_logic;
			UB_L : out std_logic;
			LB_L : out std_logic;
			WE_L : out std_logic;
			OE_L : out std_logic;
			FlashCE_L : out std_logic;
			RamCLK : out std_logic;
			RamADV_L : out std_logic;
			RamCRE : out std_logic);
end plotdot_top;

architecture Behavioral of plotdot_top is
signal clr, clk40,clk80,clk190h : std_logic;
signal donec,donep,en,enp: std_logic;
signal dataio,datac,datap: std_logic_vector(15 downto 0);
signal wec,wep,vidon: std_logic;
signal btnd: std_logic_vector(3 downto 0);
signal hc,vc,x,y: std_logic_vector(9 downto 0);
signal color_dot: std_logic_vector(7 downto 0);
signal data0,Din1: std_logic_vector(15 downto 0);
signal addr0,addr1,addrc,addrp: std_logic_vector(22 downto 0);

begin

   clr <= btn(3);
	FlashCE_L <= '1'; --desabilita flash
	CE_L <= '0';   --habilita ram
	UB_L <= '0';
	LB_L <= '0';
	RamCLK <= '0';
	RamADV_L <= '0';
	RamCRE <= '0';
	OE_L <= en;  
	DQ <= dataio;
	en <= (not donec) or (not donep);
	enp <= not donep;
	x <= '0' & sw(3 downto 0) & "00001";
	y <= '0' & sw(7 downto 4) & "00001";
	color_dot <= "11111111"; 
	
u1: clkdiv port map (mclk => mclk, clr =>clr, clk80 => clk80, clk40 => clk40, clk190h => clk190h);

u2: vga_640x480 port map (clk => clk40, clr=> clr, hsync => hsync, vsync=>vsync,
                         hc => hc, vc => vc, vidon => vidon);
								 
u3: vga_ram port map (clk40 => clk40, clk80=>clk80, clr => clr, vidon => vidon,
                   hc => hc, vc => vc, data0 => dataio, addr0 => addr0, red=> red,
						 green => green, blue => blue);
						 
u4: buff3
    generic map (N=>16)
	 port map (input => Din1, en => en, output => dataio);
	 
u5: clrscr port map (clk40 => clk40, clk80 => clk80, mclk => mclk, clr => clr, go =>btnd(2),
                    donec => donec, wec => wec, addrc => addrc, datac => datac);
						  
u6: debounce4 port map (clk => clk190h, clr => clr, inp => btn, outp => btnd);

u7: mux2g
    generic map (N=>23)
	 port map (a => addr0, b => addr1, s => en, y => A);
	 
u8: plot port map (clk80 => clk80, clr=>clr, go => btnd(0), x => x, y => y,
                  data_in => dataio, color => color_dot, donep => donep,
						wep => wep, addrp => addrp, datap => datap);
						
u9: mux2g
    generic map (N=>23)
	 port map (a => addrc, b => addrp, s => enp, y => addr1);
	 
u10: mux2g
    generic map (N=>16)
	 port map (a => datac, b => datap, s => enp, y => Din1); 
	 
u11: mux2 
     port map (a => wec, b => wep, s => enp, y => WE_L);


end Behavioral;

