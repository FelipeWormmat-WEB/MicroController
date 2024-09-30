#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/contadorMultiplexado/contadorMultiplexado.c"



char unidade = 0,
dezena = 0,
centena = 0,
milhar = 0;


void setupInicial();
void escreveDisplay();
char decodifica(char uni);
void crescente();
void crescenteRapido();
void reset();

void main()
{
 setupInicial();

 while (1)
 {
 crescente();
 crescenteRapido();
 escreveDisplay();
 reset();
 }
}

void setupInicial()
{
 PORTA = 0;
 PORTB = 0;
 PORTC = 0;
 PORTD = 0;
 PORTE = 0;

 TRISA = 0;
 TRISB = 7;
 TRISC = 0;
 TRISD = 0;
 TRISE = 0;

 CMCON = 7;
 ADCON1 = 15;

 INTCON2 = 0;

 unidade = 3;
 dezena = 2;
 centena = 9;
 milhar = 1;
}

void escreveDisplay()
{
 RA3_bit = 0;
 RA2_bit = 0;
 RC4_bit = 0;
 RC5_bit = 0;

 PORTD = decodifica(unidade);
 RA3_bit = 1;
 delay_ms(1);

 RA3_bit = 0;
 PORTD = decodifica(dezena);
 RE2_bit = 1;
 delay_ms(1);

 RE2_bit = 0;
 PORTD = decodifica(centena);
 RC4_bit = 1;
 delay_ms(1);

 RC4_bit = 0;
 PORTD = decodifica(milhar);
 RC5_bit = 1;
 delay_ms(1);
}

char decodifica(char uni)
{
 switch (uni)
 {
 case 0:
 return 63;
 break;

 case 1:
 return 6;
 break;

 case 2:
 return 91;
 break;

 case 3:
 return 79;
 break;

 case 4:
 return 102;
 break;

 case 5:
 return 109;
 break;

 case 6:
 return 125;
 break;

 case 7:
 return 7;
 break;

 case 8:
 return 127;
 break;

 case 9:
 return 111;
 break;
 }
}

void crescente()
{
 if (RB0_bit == 0)
 {
 while (RB0_bit == 0)
 escreveDisplay();
 unidade++;
 if (unidade == 10)
 {
 unidade = 0;
 dezena++;
 }
 if (dezena == 10)
 {
 dezena = 0;
 centena++;
 }
 if (centena == 10)
 {
 centena = 0;
 milhar++;
 }
 if (milhar == 10)
 {
 milhar = 0;
 }
 }
}
void crescenteRapido()
{
 if (RB1_bit == 0)
 {
 escreveDisplay();
 if (RB1_bit == 0)
 {
 unidade++;
 if (unidade == 10)
 {
 unidade = 0;
 dezena++;
 }
 if (dezena == 10)
 {
 dezena = 0;
 centena++;
 }
 if (centena == 10)
 {
 centena = 0;
 milhar++;
 }
 if (milhar == 10)
 {
 milhar = 0;
 }
 }
 }
}

void reset()
{
 if (RB2_bit == 0)
 {
 while (RB2_bit == 0)
 escreveDisplay();
 unidade = 0;
 dezena = 0;
 centena = 0;
 milhar = 0;
 }
}
