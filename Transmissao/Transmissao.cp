#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/Transmissao/Transmissao.c"
sbit LCD_RS at RE0_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISE0_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


void setupInicial();

void main() {

 setupInicial();
 lcd_init();
 lcd_cmd(_LCD_CURSOR_OFF);
 lcd_cmd(_LCD_CLEAR);

 UART1_Init(19200);

 while(1){


 UART1_Write('F');
 Delay_ms(1);
 UART1_Write('T');
 Delay_ms(1);
 UART1_Write('E');
 Delay_ms(1);
 UART1_Write('C');
 Delay_ms(1);
 UART1_Write(10);
 Delay_ms(1);
 UART1_Write(13);
 Delay_ms(1000);
 }
}

void setupInicial()
{
 porta = 0;
 portb = 0;
 portc = 0;
 portd = 0;
 porte = 0;

 trisa = 0;
 trisb = 15;
 trisc = 128;
 trisd = 0;
 trise = 0;

 adcon1 = 15;
 cmcon = 7;
 intcon2 = 0;

}
