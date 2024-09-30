#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/DisplayLed_s_Contador_0_a_9.c"
void main() {
 portd = 0;
 trisd = 0;
 adcon1 = 15;
 cmcon = 7;

 porta = 0;
 trisa = 0;
 RA3_bit = 1;

 while(1){
 portd = 63;
 delay_ms(500);
 portd = 6;
 delay_ms(500);
 portd = 91;
 delay_ms(500);
 portd = 79;
 delay_ms(500);
 portd = 102;
 delay_ms(500);
 portd = 109;
 delay_ms(500);
 portd = 125;
 delay_ms(500);
 portd = 7;
 delay_ms(500);
 portd = 127;
 delay_ms(500);
 portd = 111;
 delay_ms(500);

 }
}
