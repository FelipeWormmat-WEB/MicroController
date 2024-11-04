// LCD module connections
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
// End LCD module connections

// Prototipo das Funções;
int valorLido = 0;
char txt[7]; //Vetor para converter inteiro em string
long soma = 0;
int contaMedidas = 0;
int media = 0;
int f0=0, f1=0, f2=0, f3=0, f4=0, f5=0, f6=0, f7=0, f8=0, f9=0;
int fir = 0;
int ponderada = 0;

void setupInicial();

void main()
{

  setupInicial();
  lcd_init();
  lcd_cmd(_LCD_CURSOR_OFF);
  lcd_cmd(_LCD_CLEAR);

  while(1)
  {
     valorLido = adc_read(0); // faz a leitura em RA0

     soma = soma + valorLido;
     contaMedidas++;
     
     if(contaMedidas >= 500)
     {
       media = soma / contaMedidas;
       soma = 0;
       contaMedidas = 0;

//       inttostr(media,txt);
//       lcd_out(2,1,"MD=");
//       lcd_Out_CP(ltrim(txt));

       f0=f1;
       f1=f2;
       f2=f3;
       f3=f4;
       f4=f5;
       f5=f6;
       f6=f7;
       f7=f8;
       f8=f9;
       f9=media;
       fir=(f0+f1+f2+f3+f4+f5+f6+f7+f8+f9)/10;

//       inttostr(fir,txt);
//       lcd_out(2,8,"FI=");
//       lcd_Out_CP(ltrim(txt));

       ponderada = ((ponderada * 8) + (fir * 2)) / 10;

       inttostr(ponderada,txt);
       lcd_out(1,1,"Temperatura: ");
       lcd_Out_CP(ltrim(txt));
     }

//     inttostr(valorLido,txt);
//     lcd_out(1,1,"Vl=");
//     lcd_Out_CP(ltrim(txt));
  }
}

void setupInicial()
{
  porta = 0;
  portb = 0;
  portc = 0;
  portd = 0;
  porte = 0;

  trisa = 1; // ra0 entrada analogica
  trisb = 15;
  trisc = 0; // tudo como saída
  trisd = 0; // tudo como saída
  trise = 0; // tudo como saída

  adcon1 = 14; // Apenas ra0 como entrada analogica
  cmcon = 7;   // desliga os comparadores
  intcon2 = 0; // liga resistor pull up do portb

  ADC_Init(); // inicializa o conversor ad
}