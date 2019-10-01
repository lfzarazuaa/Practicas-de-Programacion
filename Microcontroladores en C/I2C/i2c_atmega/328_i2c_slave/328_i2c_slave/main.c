/*
 * 328_i2c_slave.c
 *
 * Created: 22-05-2017 13:35:48
 * Author : MANOJ
 */ 
#define F_CPU 1000000UL  //crystal freq same as master
#include <avr/io.h>
#include <avr/delay.h>
#include <stdbool.h>
#include "lib/lcd/lcd.h"
#include "lib/keypad/keypad.h"
#include "lib/i2c_slave/I2CSlave.c"			//here we used i2c slave lib
volatile uint8_t i2c_RX_buff, i2c_TX_buff;
volatile unsigned char RX_point=0,TX_point=0;
volatile bool i2c_packet_received=false;


#define I2C_ADDR 0x10		//make slave address as 0x10

volatile uint8_t data;		//declare volatile variable to use in isr routines

void I2C_received(uint8_t received_data)		//isr on receiving a byte on i2c
{
	data = received_data;						//received data
	LCD_data(data);								//printing to lcd
}

void I2C_requested()			//if master request data from slave
{
	I2C_transmitByte(data);
}

void setup()		//setting routines and initializing i2c
{
	// set received/requested callbacks
	I2C_setCallbacks(I2C_received, I2C_requested);

	// init I2C
	I2C_init(I2C_ADDR);
}

int main()
{
	setup();		//in this we only print the received data and echo it back when data is requested from master
	LCD_init();
	// Main program loop
	while(1);
}

