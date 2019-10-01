----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:52:57 04/01/2013 
-- Design Name: 
-- Module Name:    clrscr - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clrscr is
    Port ( clk40 : in  STD_LOGIC;
           clk80 : in  STD_LOGIC;
           mclk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           go : in  STD_LOGIC;
           donec : out  STD_LOGIC;
           wec : out  STD_LOGIC;
           addrc : out  STD_LOGIC_VECTOR (22 downto 0);
           datac : out  STD_LOGIC_VECTOR (15 downto 0));
end clrscr;

architecture Behavioral of clrscr is
type state_type is (start,clear,wtngo);
signal state: state_type;
signal done_out: std_logic;
signal addr_count: std_logic_vector(19 downto 0);
constant addr_max: std_logic_vector(19 downto 0):= X"25800"; --320X480

begin
   datac <= X"0000";
	wec <= (mclk and clk40 and clk80) or done_out;
	donec <= done_out;
	
	process(clk80,clr)
	begin
	   if clr='1' then
		   state <= start;
			addr_count <= (others =>'0');
			done_out <= '1';--Esta en el proceso de leer la RAM.
		elsif rising_edge(clk80) then
        case state is 		
         	 when start =>
             addr_count <= (others =>'0');
		       if go='1' then
				    done_out <= '0';--Esta en el proceso de escribir la RAM.
					 state <= clear;
				 else
				    done_out <= '1';--Esta en el proceso de leer la RAM.
					 state <= start;
				 end if;
				 ---Estado de Limpiar la Ram.
				 when clear =>
		       if addr_count >= addr_max then
				    state <= wtngo;
					 addr_count <= (others =>'0');
					 done_out <= '1';
				 else
				    state <= clear;
					 addr_count <= addr_count+1;
					 done_out <= '0';
				 end if;
				 ---
				 when wtngo =>--Evitar que se siga oprimiendo el boton.
		       if go='1' then
				    state <= wtngo;
				 else
				    state <= start;
				 end if;
				 ---
		  end case;
		end if;
	end process;
	
	addrc <= "000" & addr_count;

end Behavioral;

