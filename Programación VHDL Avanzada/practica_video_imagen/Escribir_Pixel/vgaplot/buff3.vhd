----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:46:45 04/01/2013 
-- Design Name: 
-- Module Name:    buff3 - Behavioral 
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

entity buff3 is
   generic(N:integer);
	port(input : in std_logic_vector(N-1 downto 0);
	     en : in std_logic;
	     output : out std_logic_vector(N-1 downto 0));
end buff3;


architecture Behavioral of buff3 is
begin
		output <= input when en='1' else (others => 'Z');

end Behavioral;

