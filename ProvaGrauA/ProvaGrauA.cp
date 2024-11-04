#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/ProvaGrauA/ProvaGrauA.c"

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

void main() {
 porta = 0;
 trisa = 1;
 adcon1 = 14;
 cmcon = 7;
 intcon2 = 0;

 adc_init();
 lcd_init();
 lcd_cmd(_LCD_CURSOR_OFF);
 lcd_cmd(_LCD_CLEAR);

 while(1) {
 if(rb2_bit == 0) {
 while(rb2_bit == 0) {
 delay_ms(100);
 value = adc_Read(0);

 lcd_out(1, 1, "Felipe Wormmat");
 lcd_out(2, 1, "38579");
 }
 }
 }
}
