/*
 * keypad.h
 *
 * Created: 15-04-2017 07:51:35
 *  Author: MANOJ
 */ 

#define KB_PORT_OUT PORTD
#define key_port_DIR DDRD
#define KB_PORT_IN PIND
#define NO_KEY 0xff
void keypad_init(){
	PORTD = 0;
	DDRD = 0x3f;
}

unsigned char get_key_pressed(){
	keypad_init();
	DDRD  = 0x8f;		//Key-board port, higer nibble - input, lower nibble - output
	PORTD = 0x7f;
	unsigned char upperNibble, keyCode, i;
	
		upperNibble = 0x7f;
		for(i=0; i<4; i++)
		{
			_delay_ms(1);
			KB_PORT_OUT = ~(0x01 << i);
			_delay_ms(1);  		  	 		  //delay for port o/p settling
			upperNibble = KB_PORT_IN | 0x8f;	
			if (upperNibble != 0xff)
			{
				_delay_ms(5); 		  		 //key debouncing delay
				upperNibble = KB_PORT_IN | 0x8f;
				if(upperNibble == 0xff) goto OUT;
				keyCode = (upperNibble & 0xf0) | (0x0f & ~(0x01 << i));
				while (upperNibble != 0xff)
				upperNibble = KB_PORT_IN | 0x8f;
				_delay_ms(1);   			   //key debouncing delay	
				switch (keyCode)			   //generating key characetr to display on LCD
				{
					case (0xee): return '*';//
					break;
					case (0xed): return '7';//
					break;
					case (0xeb): return '4';//
					break;
					case (0xe7): return '1';//
					break;
					case (0xde): return '0';//
					break;
					case (0xdd): return  '8';//
					break;
					case (0xdb): return '5';//
					break;
					case (0xd7): return '2';//
					break;
					case (0xbe): return '#';//
					break;
					case (0xbd): return  '9';
					break;
					case (0xbb): return '6';//
					break;
					case (0xb7): return '3';//
					break;
					/*case (0x7e): return 'C';
					break;
					case (0x7d): return 'D';
					break;
					case (0x7b): return 'E';
					break;
					case (0x77): return 'F';
					break;*/
					default	   : return 0xff;
				}//end of switch
				OUT:;
				
			}//end of if
		}//end of for
		return 0xff;
	//end of while(1)


}