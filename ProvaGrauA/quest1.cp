#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/ProvaGrauA/quest1.c"










const char segmentos[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

int contador = 0;


int dia = 1;
int mes = 10;


void atualizaDisplays(int valor) {
 int milhar, centena, dezena, unidade;

 milhar = valor / 1000;
 centena = (valor / 100) % 10;
 dezena = (valor / 10) % 10;
 unidade = valor % 10;


  PORTD.F0  = 1;
 PORTC = segmentos[milhar];
 delay_ms(5);
  PORTD.F0  = 0;

  PORTD.F1  = 1;
 PORTC = segmentos[centena];
 delay_ms(5);
  PORTD.F1  = 0;

  PORTD.F2  = 1;
 PORTC = segmentos[dezena];
 delay_ms(5);
  PORTD.F2  = 0;

  PORTD.F3  = 1;
 PORTC = segmentos[unidade];
 delay_ms(5);
  PORTD.F3  = 0;
}

void main() {
 trisd = 0x00;
 trisc = 0x00;
 trisb = 0xFF;

 while (1) {

 if ( RB0_bit  == 0) {
 delay_ms(50);
 if ( RB0_bit  == 0) {
 contador++;

 if (contador > (dia * 100 + mes)) {
 contador = 0;
 }

 atualizaDisplays(contador);

 while ( RB0_bit  == 0);
 }
 }
 }
}
