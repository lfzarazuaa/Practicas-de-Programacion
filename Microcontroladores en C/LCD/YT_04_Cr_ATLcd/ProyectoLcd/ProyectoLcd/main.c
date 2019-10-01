
#define F_CPU 16000000

#include <avr/io.h>
#include <util/delay.h>
#include <avr/pgmspace.h>
#include <inttypes.h>

#include "lcd_lib/lcd_lib.h"

//*******************************************
const uint8_t Msj_1[]  PROGMEM="    Datos LCD   \0";       //String guardada en la memoria flash
const uint8_t Msj_2[]  PROGMEM="proyectos@progsisdel.com\0";
const uint8_t Blanco[] PROGMEM="                \0";

//*******************************************
//CARACTERES ESPECIALES - SPECIAL CHARACTERS
const uint8_t Fantasma[] PROGMEM=
{
	0b01110,
	0b10001,
	0b11011,
	0b10001,
	0b10101,
	0b10001,
	0b10101,
	0b11011
};

const uint8_t D_Pacman1 [] PROGMEM=
{
	0b00000,
	0b01110,
	0b10101,
	0b10010,
	0b10100,
	0b10010,
	0b10001,
	0b01110
};

const uint8_t D_Pacman2 [] PROGMEM=
{
	0b00000,
	0b01110,
	0b10101,
	0b10011,
	0b10100,
	0b10011,
	0b10001,
	0b01110
};

#if (BAR_PROGRES==1)

	const uint8_t LCDprogreso[] PROGMEM="Cargando...";

	const uint8_t LcdCustomChar[] PROGMEM=//define 8 custom LCD chars
	{
		0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, // 0. 0/5 full progress block
		0x00, 0x1F, 0x10, 0x10, 0x10, 0x10, 0x1F, 0x00, // 1. 1/5 full progress block
		0x00, 0x1F, 0x18, 0x18, 0x18, 0x18, 0x1F, 0x00, // 2. 2/5 full progress block
		0x00, 0x1F, 0x1C, 0x1C, 0x1C, 0x1C, 0x1F, 0x00, // 3. 3/5 full progress block
		0x00, 0x1F, 0x1E, 0x1E, 0x1E, 0x1E, 0x1F, 0x00, // 4. 4/5 full progress block
		0x00, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x00, // 5. 5/5 full progress block
		0x03, 0x07, 0x0F, 0x1F, 0x0F, 0x07, 0x03, 0x00, // 6. rewind arrow
		0x18, 0x1C, 0x1E, 0x1F, 0x1E, 0x1C, 0x18, 0x00  // 7. fast-forward arrow
	};

	void Init_progressBar (void)
	{
		uint8_t ch=0, chn=0;
		while(ch<64)
		{
			LCDdefinechar((LcdCustomChar+ch),chn++);
			ch=ch+8;
		}
	}
#endif

int main(void)
{
    LCDinit();//Inicializa lcd - Lcd Init
	
	uint8_t contador1=0;
	
    while (1) 
    {
		//--------------------------------------
		//---------  BARRA DE PROGRESO ---------
		//--------------------------------------
		#if (BAR_PROGRES==1)
		
			uint8_t ProgCel_vel = 65;//determino la velocidad de progreso
			uint8_t ProgCel_Num = 17;//indico el numero de celdas que seran presentadas
		
			LCDclr();
			CopyStringtoLCD(LCDprogreso, 3, 0);
			_delay_ms(500);
		
			Init_progressBar();
		
			for(uint8_t ProgPos=0;ProgPos<ProgCel_vel;ProgPos++)
			{
				LCDGotoXY(0, 1); //DEFINE LA POSICION DEL CURSOR X,Y
			
				// LCDprogressBar(posicion, velocidad, numero_celdas);
				LCDprogressBar(ProgPos, ProgCel_vel ,ProgCel_Num);
			
				_delay_ms(100);
			}
		
			_delay_ms(500);
		
		#endif
		
		//--------------------------------------
		//--------------------------------------
		
		LCDclr();
		CopyStringtoLCD(Msj_1,0,0);
		CopyStringtoLCD(Msj_2,0,1);
		_delay_ms(500);_delay_ms(500);
	
		LCDshiftLeft(1);_delay_ms(500);
		LCDshiftLeft(1);_delay_ms(500);
		LCDshiftLeft(1);_delay_ms(500);
		LCDshiftLeft(1);_delay_ms(500);
		LCDshiftLeft(1);_delay_ms(500);
		LCDshiftLeft(1);_delay_ms(500);
		LCDshiftLeft(1);_delay_ms(500);
		LCDshiftLeft(1);_delay_ms(500);
		LCDshiftLeft(1);_delay_ms(500);

 		 _delay_ms(500);_delay_ms(500);_delay_ms(500);

		LCDshiftRight(1);_delay_ms(500);
		LCDshiftRight(1);_delay_ms(500);
		LCDshiftRight(1);_delay_ms(500);
		LCDshiftRight(1);_delay_ms(500);
		LCDshiftRight(1);_delay_ms(500);
		LCDshiftRight(1);_delay_ms(500);
		LCDshiftRight(1);_delay_ms(500);
		LCDshiftRight(1);_delay_ms(500);
		LCDshiftRight(1);_delay_ms(500);
		
    	_delay_ms(500);_delay_ms(500);_delay_ms(500);
		
		//*******************************************
		LCDdefinechar(D_Pacman1,0);
		LCDdefinechar(D_Pacman2,1);
		LCDdefinechar(Fantasma, 2);
		
		//LCDdefinechar(Fantasma,?); => ? = 0,1,2,3,4,5,6, AND 7
		// Comando  LCDdefinechar    => permite crear maximo OCHO CARACTERES ESPECIALES enumerados desde 0 a 7
		// Comand   LCDdefinechar    => Allow 8 special characters 

		uint8_t Pacman=0;

		LCDclr();
		LCDGotoXY(1,0);
		LCDsendChar('I');
		LCDsendChar('N');
		LCDsendChar('I');
		LCDsendChar('C');
		LCDsendChar('I');
		LCDsendChar('O');
		LCDsendChar(' ');
		LCDsendChar('P');
		LCDsendChar('A');
		LCDsendChar('K');
		LCDsendChar('M');
		LCDsendChar('A');
		LCDsendChar('N');

        for(uint8_t PosLCD =0 ; PosLCD<=16 ; PosLCD++)
		{
			CopyStringtoLCD(Blanco,0,1);

			LCDGotoXY(PosLCD,1);
			LCDsendChar(Pacman);LCDsendChar(' ');LCDsendChar(2);
			_delay_ms(400);
			Pacman++;
			if(Pacman>1)Pacman=0;
		}

		LCDGotoXY(2,1);
		LCDsendChar('F');
		LCDsendChar('I');
		LCDsendChar('N');
		LCDsendChar(' ');
		LCDsendChar('P');
		LCDsendChar('A');
		LCDsendChar('K');
		LCDsendChar('M');
		LCDsendChar('A');
		LCDsendChar('N');
		_delay_ms(500);_delay_ms(500);_delay_ms(500);

		//*******************************************
		LCDclr();
		LCDGotoXY(0,0);
		printf("contador1 %d  %c", contador1,contador1);
		
		LCDGotoXY(0,1);
		printf("contador1 %d  %x", contador1,contador1);
		
		_delay_ms(500);_delay_ms(500);
		
		contador1++;	
    }
}

