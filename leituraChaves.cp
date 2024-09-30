#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/leituraChaves.c"
void main() {
 porta = 0;
 trisa = 48;
 portc = 0;
 trisc = 0;
 cmcon = 7;
 adcon1 = 15;
 while(1){
 if(ra4_bit == 1){
 while(ra4_bit == 1)delay_ms(100);

 portc = 4;
 }
 if(ra5_bit == 1){
 delay_ms(1000);
 while(ra5_bit == 1)delay_ms(100);
 portc = 0;
 }
 }
}
