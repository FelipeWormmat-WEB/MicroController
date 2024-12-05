#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/ProvaGBFelipeWTESTE/ProvaGBFelipeWTESTE.c"

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


unsigned char counter = 0;
bit previousStateRB0;
bit previousStateRB2;
char txt[7];

void main() {
 PORTA = 0;
 TRISA = 1;
 ADCON1 = 14;
 CMCON = 7;
 INTCON2 = 0;

 TRISB0_bit = 1;
 TRISB2_bit = 1;

 ADC_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);

 previousStateRB0 = 0;
 previousStateRB2 = 0;

 while (1) {

 if (RB0_bit == 1 && previousStateRB0 == 0) {
 previousStateRB0 = 1;


 Lcd_Out(1, 1, "William Basso");
 Lcd_Out(2, 1, "RA 37678");

 Delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);
 } else if (RB0_bit == 0) {
 previousStateRB0 = 0;
 }


 if (RB2_bit == 1 && previousStateRB2 == 0) {
 Delay_ms(50);
 if (RB2_bit == 1) {
 previousStateRB2 = 1;

 counter++;
 if (counter > 255) {
 counter = 0;
 }


 ByteToStr(counter, txt);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Conta ");
 Lcd_Out_Cp(txt);
 }
 } else if (RB2_bit == 0) {
 previousStateRB2 = 0;
 }
 }
}
