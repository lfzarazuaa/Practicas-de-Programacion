/*
 * 328_i2c_master.c
 *
 * Created: 22-05-2017 12:35:51
 * Author : MANOJ
 */ 
#define F_CPU 1000000UL  //to simulate in proteus I ahve used lower crystal freq
#include <avr/io.h>
#include <avr/delay.h> //include important files
#include "lib/lcd/lcd.h" //using lcd library of my own
#include "lib/keypad/keypad.h" // similarly keypad lib
#include "lib/I2C-master-lib-master/i2c_master.c"  //I have got this over Internet and I had some modifications

char data_received; //
int main(void)
{
	i2c_init();		
	LCD_init();
	LCD_string("Transmitter:");		//first we print on LCD
	LCD_setCursor(0,1);
    /* Replace with your application code */
    while (1) 
    {
		char key=get_key_pressed();		//checking key press
		if(key != NO_KEY)		//if any key is pressed
		{			
			i2c_start(0x10<<1 | I2C_WRITE);		//starts i2c comm here in writing mode
			i2c_write(key);		//send pressed key char
			i2c_stop();				//stop i2c here
			_delay_ms(3000);		//wait 3 secs  for giving next i2c command
			LCD_setCursor(0,1);
			i2c_start(0x10<<1 | I2C_READ);		//here we start i2c in read mode where we request a byte
			data_received=i2c_read_ack();	//read the byte 
			i2c_read_nack();				// read the neg ack
			LCD_data(data_received);		//print the received byte
			i2c_stop();			//stop i2c
		}
		
	}
		
	
}

