#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/segmentosDisplay/segmentosDisplay.c"
void main() {
 porta = 0;
 trisa = 0;
 portc = 0;
 trisc = 0;
 cmcon = 7;
 adcon1 = 15;
 porte = 0;
 trise = 0;
 portd = 0;
 trisd = 0;

 while(1){
 portd = 1;
 rc5_bit = 1;
 rc4_bit = 0;
 re2_bit = 0;
 ra3_bit = 0;
 delay_ms(250);

 rc5_bit = 0;
 rc4_bit = 1;
 delay_ms(250);

 rc4_bit = 0;
 re2_bit = 1;
 delay_ms(250);

 re2_bit = 0;
 rA3_bit = 1;
 delay_ms(250);

 portd = 2;
 delay_ms(250);

 portd = 4;
 delay_ms(250);

 portd = 8;
 delay_ms(250);

 portd = 16;
 delay_ms(250);

 portd = 32;
 delay_ms(250);

 portd = 64;
 delay_ms(250);

 portd = 128;
 delay_ms(250);
 }
}
