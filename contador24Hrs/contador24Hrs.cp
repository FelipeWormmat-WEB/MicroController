#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/contador24Hrs/contador24Hrs.c"

char unidade = 0,dezena = 0, centena = 0, milhar = 0, segundo = 0;
char conta_interrupcao = 0;

void setup_inicial();
void escreve_display();
char decodifica(char entrada);
void crescente();
void ajuste();


void main() {
 setup_inicial();
 t0con = 199;
 intcon = 0;
 tmr0ie_bit = 1;
 int0ie_bit = 1;
 gie_bit = 1;
 while(1){
 escreve_display();
 crescente();
 ajuste();
 }
}
void ajuste(){
 if(rb2_bit == 0) {
 while(rb2_bit == 0)escreve_display();
 unidade ++;
 if(unidade == 10){
 unidade = 0;
 dezena ++;
 }
 if(dezena == 6){
 dezena = 0;
 }
 }
 if(rb1_bit == 0){
 while(rb1_bit == 0)escreve_display();
 centena ++;
 if(centena == 10){
 centena = 0;
 milhar ++;
 }
 }
 if((milhar == 2)&&(centena == 4)){
 centena = 0;
 milhar = 0;
 }
}
void crescente(){
 if (unidade == 10) {
 unidade = 0;
 dezena ++;
 }
 if (dezena == 6) {
 dezena = 0;
 centena ++;
 }
 if (centena == 10) {
 centena = 0;
 milhar ++;
 }
 if((milhar == 2)&&(centena == 4)){
 centena = 0;
 milhar = 0;
 }
}
void setup_inicial(){
 porta = 0;
 trisa = 0;
 portb = 0;
 trisb = 7;
 portc = 0;
 trisc = 0;
 portd = 0;
 trisd = 0;
 porte = 0;
 trise = 0;
 adcon1 = 15;
 cmcon = 7;
 intcon2 = 0;
 unidade = 3;
 dezena = 2;
 centena = 9;
 milhar = 1;
}
void escreve_display(){
 portb = 0;
 portd = decodifica(unidade);
 rb4_bit = 1;
 delay_ms(1);

 rb4_bit = 0;
 portd = decodifica(dezena);
 rb5_bit = 1;
 delay_ms(1);

 rb5_bit = 0;
 portd = decodifica(centena);
 if(conta_interrupcao > 15) portd = portd + 128;
 rb6_bit = 1;
 delay_ms(1);

 rb6_bit = 0;
 portd = decodifica(milhar);
 rb7_bit = 1;
 delay_ms(1);
}
char decodifica(char entrada){
char saida;
 if(entrada == 0)saida = 63;else
 if(entrada == 1)saida = 6;else
 if(entrada == 2)saida = 91;else
 if(entrada == 3)saida = 79;else
 if(entrada == 4)saida = 102;else
 if(entrada == 5)saida = 109;else
 if(entrada == 6)saida = 125;else
 if(entrada == 7)saida = 7;else
 if(entrada == 8)saida = 127;
 else saida = 111;
 return(saida);
}

void interrupt(){
 if(tmr0if_bit == 1){
 tmr0if_bit = 0;
 conta_interrupcao ++;
 if(conta_interrupcao == 30){

 conta_interrupcao = 0;
 segundo ++;
 if(segundo == 60){
 segundo = 0;
 unidade ++;
 }
 }
 }
 if(int0if_bit == 1){
 int0if_bit = 0;
 unidade = 0;
 dezena = 0;
 centena = 0;
 milhar = 0;
 }
}
