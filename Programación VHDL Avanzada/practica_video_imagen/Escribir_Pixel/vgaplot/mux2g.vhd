----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:53:48 04/01/2013 
-- Design Name: 
-- Module Name:    mux2g - Behavioral 
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

entity mux2g is
    generic (N: integer);
	 port (a : in std_logic_vector(N-1 downto 0);
			 b : in std_logic_vector(N-1 downto 0);
			 s : in std_logic;
			 y : out std_logic_vector(N-1 downto 0));
end mux2g;

architecture Behavioral of mux2g is

begin
   process(a,b,s)
	begin
      if s='0' then 
          y <= a;
      else
          y <= b;
      end if;			 
	end process;
end Behavioral;

