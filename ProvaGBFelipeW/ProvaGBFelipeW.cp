#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/ProvaGBFelipeW/ProvaGBFelipeW.c"

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


int value = 0;
char txt[7];
bit previousState;

void main() {
 previousState = 0;

 PORTA = 0;
 TRISA = 1;
 ADCON1 = 14;
 CMCON = 7;
 INTCON2 = 0;

 TRISB0_bit = 1;

 ADC_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);

 while (1) {
 if (RB0_bit == 1 && previousState == 0) {
 previousState = 1;


 Lcd_Out(1, 1, "Felipe Wormmat");
 Lcd_Out(2, 1, "RA 38579");

 Delay_ms(200);

 Lcd_Cmd(_LCD_CLEAR);
 } else if (RB0_bit == 0) {
 previousState = 0;
 }
 }
}
