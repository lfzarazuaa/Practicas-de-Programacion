----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:36:22 03/17/2017 
-- Design Name: 
-- Module Name:    prom - Behavioral 
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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity prom is
    Port ( addr : in  STD_LOGIC_VECTOR (3 downto 0);
           m : out  STD_LOGIC_VECTOR (0 to 31));--Espejo de imagen.
end prom;

architecture Behavioral of prom is
--natural range para no especificar tamaño.
type rom_array is array (natural range <>) of std_logic_vector(0 to 31);--Tamaño del bus de datos y de direcciones.
constant mem: rom_array := (
--PACMAN 
--                 X"00000055",
--                 X"39C8E72A",
--                 X"72A5CA95",
--                 X"63E98FAA",
--                 X"72A5CA95",
--                 X"3AA8EAAA",
--                 X"EEE03815",
--                 X"AA8FABAA",
--                 X"EE8ABA95",
--                 X"8AEAAAAA",
--                 X"00000000",
--                 X"39C39CD5",
--                 X"72A72A95",
--                 X"63E63ED7",
--                 X"72A72A91",
--                 X"3AA3AADF"
--Halo_2
--x"FFFFFFFF",
--x"FF0001FF",
--x"FCFFE07F",
--x"F3F07C1F",
--x"EFEF1F0F",
--x"DF9FDF8F",
--x"1FFF9F87",
--x"BFFF1F83",
--x"FFF8FF8F",
--x"FFE7FF8F",
--x"FF800F1F",
--x"FFFFFC3F",
--x"FE7FE07F",
--x"FF0001FF",
--x"FFFC0FFF",
--x"FFFFFFFF"
--UPIITA
x"001F0000",
x"00798000",
x"00C0C000",
x"01804000",
x"03002000",
x"06002000",
x"0C002000",
x"18002000",
x"30002000",
x"30003E00",
x"6000D300",
x"400310C3",
x"C00C086D",
x"80300432",
x"C0C003CC",
x"7F000000");
begin
     process(addr)
	  variable j:integer;
	  begin
	       j:=conv_integer(addr);--
			 m <= mem(j);--Obtener el j-esimo elemento de mem.
	  end process;
end Behavioral;
