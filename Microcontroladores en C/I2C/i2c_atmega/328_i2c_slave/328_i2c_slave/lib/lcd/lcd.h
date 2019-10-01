#ifndef LiquidCrystal_h
#define LiquidCrystal_h


#define EN 0x02
#define RS 0x01
//all pin are connected to portB
//#define D4 PORTB2
//#define D5 PORTB3	
//#define D6 PORTB4	
//#define D7 PORTB5	
void LCD_cmd(unsigned char cmd);
void LCD_init();
void LCD_setCursor(unsigned char row, unsigned char column);
void LCD_clear();
void LCD_cmd(unsigned char cmd)
{
	//select portB for lcd operations
	char data= ((cmd & 0xF0)>>2);
	PORTB = data;
	PORTB = data | EN;
	_delay_ms(1);
	PORTB = data;
	_delay_ms(1);
	PORTB &= 0xF0>>2;
	
	data= (((cmd<<4) & 0xF0)>>2);
	PORTB = data;
	PORTB = data | EN;
	_delay_ms(1);
	PORTB = data;
	_delay_ms(1);
	return;
}
void LCD_init()
{
	DDRB = 0x3F;		//select portB for lcd operations
	PORTB &=(0x00)>>2;
	LCD_cmd(0x33);       // configuring LCD as 2 line 5x7 matrix in 4-bit mode
	_delay_ms(40);
	LCD_cmd(0x32);       // configuring LCD as 2 line 5x7 matrix in 4-bit mode
	_delay_ms(40);
	LCD_cmd(0x28);       // Display on, Cursor blinking
	_delay_ms(10);
	LCD_cmd(0x0c);       // <span class="IL_AD" id="IL_AD7">Clear Display</span> Screen
	_delay_ms(10);
	LCD_cmd(0x01);       // Increment Cursor (Right side)
	_delay_ms(10);
	LCD_cmd(0x06);       // Increment Cursor (Right side)
	_delay_ms(10);
}

void LCD_data(unsigned char data1){
	DDRB = 0x3F;	//select portB for lcd operations
	PORTB=0;
	char data= ((data1 & 0xF0)>>2) | RS;
	PORTB = data ;
	PORTB = data | EN;
	_delay_ms(1);
	PORTB = data;
	_delay_ms(1);
	data= (((data1<<4) & 0xF0)>>2) | RS;
	PORTB = data ;
	PORTB = data | EN ;
	_delay_ms(1);
	PORTB = data;
	_delay_ms(1);
	return;
}
void LCD_string(const char* data){
	unsigned char byteToWrite = sizeof(data);
	while(*data)
	LCD_data(*data++);
}
void LCD_setCursor( unsigned char column, unsigned char row){
	unsigned char cmd=0;
	switch (row){
		case 0: cmd= 0x80 + column; break;
		case 1: cmd = 0xc0 + column; break;
		case 2: cmd = 0x94 + column; break;
		case 3: cmd = 0xd4 +column;
	}
	LCD_cmd(cmd);
	_delay_ms(1);
}
void LCD_clear(){
	LCD_cmd(0x01);
}
#endif