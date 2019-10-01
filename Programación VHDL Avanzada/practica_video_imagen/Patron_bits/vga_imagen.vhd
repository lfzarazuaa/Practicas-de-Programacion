
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity vga_imagen is
    Port ( vidon : in  STD_LOGIC;--Indica cuando esta activa la imagen.
           hc : in  STD_LOGIC_VECTOR (9 downto 0);--Contador de pixel.
           vc : in  STD_LOGIC_VECTOR (9 downto 0);--Contador de linea.
           m : in  STD_LOGIC_VECTOR (0 to 31);--Renglon regresado por la memoria.
           sw : in  STD_LOGIC_VECTOR (7 downto 0);--Entradas para seleccionar la posicion.
           rom_addr4 : out  STD_LOGIC_VECTOR (3 downto 0);--Nibble que accede a la memoria.
           red : out  STD_LOGIC_VECTOR (2 downto 0);--Salida de Rojo.
           green : out  STD_LOGIC_VECTOR (2 downto 0);--Salida de Verde.
           blue : out  STD_LOGIC_VECTOR (1 downto 0));--Salida de Azul.
end vga_imagen;

architecture Behavioral of vga_imagen is

	signal	C1,R1:					std_logic_vector(10 downto 0);--Columnas y rengloses.
	signal	rom_addr,rom_pix:		std_logic_vector(10 downto 0);
	signal	spriteon,R,G,B:		std_logic;--Donde se activa la imagen.
	constant		hbp:			std_logic_vector(9 downto 0):="0010010000";	--128 (SP) + 16 (BP) pixeles horizontales
	constant		vbp:			std_logic_vector(9 downto 0):="0000011111";	--2 (SP) + 29 (BP) pixeles verticales
	constant		w:				integer:=32;--Anchura.
	constant		h:				integer:=16;--Altura.
begin
	----Esablecer C1, R1 utilizando los switch
	C1	<="00"	&	sw(3 downto 0)	&	"00001";
	R1	<="00"	&	sw(7 downto 4)	&	"00001";
	
	rom_addr		<=	vc - vbp - R1;--Obtenemos en 10 bits la coordenada donde se encuentra actualmente el cursor menos la posicion donde queremos el renglon.
	rom_pix		<=	hc - hbp - C1;--Obtenemos en 10 bits la coordenada donde se encuentra actualmente el cursor menos la posicion donde queremos la columna.
	rom_addr4	<= rom_addr(3 downto 0);--Obtenemos los 4 bits menos significativos de en que renglon se esta y con esa direccion accedmos a la memoria..
	
	----Habilitar sprite on cuando se esté dentro de la región sprite.
	spriteon	<='1'	when	(((hc>=C1+hbp) and (hc<=C1+hbp+w))
						and	 ((vc>=R1+vbp) and (vc<=R1+vbp+h)))
						else	'0';
	----Asgina los colores
	process(spriteon,vidon,rom_pix,m)
	variable	j:	integer;
	begin
		red	<="000";
		green	<="000";
		blue	<="00";
		R		<='0';
		G		<='0';
		B		<='0';
			if spriteon='1' and vidon='1' then
				j	:=conv_integer(rom_pix);--Obtiene del pixel que queremos leer sabiendo que ya esta en spriteon y la direcciòn esta del 0 al 31.
				R	<=m(j);--Obtenemos los valores del pixel a partir de la memoria.
				G	<=m(j);--
				B	<=m(j);
				red	<=R&R&R;
				green	<=not(G&G&G);
				blue	<=not(B&B);
			end if;
	end process;
end Behavioral;