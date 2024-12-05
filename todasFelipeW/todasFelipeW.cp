#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/todasFelipeW/todasFelipeW.c"

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


void setupInicial();
void escreveNome();
void clearDisplay();
void escreveDisplay();
char decodifica(char uni);
void contadorDisplay(int numero);
void leituraEntradaADC();

void CustomChar(char pos_row, char pos_char);

char txt1[] = "Felipe Wormmat";
char txt2[] = "RA:38579";

char unidade = 0, dezena = 0, centena = 0, milhar = 0;
int numeroMatricula = 38579;
char conta=0;
char txt[7];
const char character[] = {0,0,27,0,4,17,14,0};

int valorMedido = 0;

void main(){

 lcd_init();
 lcd_cmd(_LCD_CURSOR_OFF);
 lcd_cmd(_LCD_CLEAR);

 ADC_Init();

 PWM1_Init(20000);
 PWM1_Set_Duty(conta);
 PWM1_Start();

 setupInicial();
 contadorDisplay(conta);

 while(1){

 leituraEntradaADC();

 if(rb0_bit == 0){
 while(rb0_bit == 0) delay_ms(100);
 clearDisplay();
 escreveNome();
 delay_ms(2000);
 clearDisplay();
 contadorDisplay(conta);
 }

 if(rb1_bit == 0){
 while(rb1_bit == 0) delay_ms(100);
 escreveDisplay();
 contadorDisplay(conta);
 }

 if(rb2_bit == 0){
 delay_ms(10);
 while(rb2_bit == 0) {
 if(conta < 255){
 conta++;
 contadorDisplay(conta);
 PWM1_Set_Duty(conta);
 }
 }
 }

 if(rb3_bit == 0){
 delay_ms(10);
 while(rb3_bit == 0) {
 if(conta > 0){
 conta--;
 contadorDisplay(conta);
 PWM1_Set_Duty(conta);
 }
 }
 }

 }
}

void setupInicial()
{
 PORTA = 0;
 PORTC = 0;
 PORTD = 0;
 PORTE = 0;
 PORTB = 0;

 TRISA = 4;
 TRISB = 15;
 TRISC = 0;
 TRISD = 0;
 TRISE = 0;

 CMCON = 7;
 ADCON1 = 12;
 INTCON2 = 0;

 unidade = 3;
 dezena = 8;
 centena = 5;
 milhar = 7;
}

void escreveNome(numero){
 lcd_out(1, 1, txt1);
 lcd_out(2, 1, txt2);
}

void clearDisplay(){
 lcd_out(1,1,"                ");
 lcd_out(2,1,"                ");
}

void contadorDisplay(int numero){
 lcd_out(1, 1, "CONTA ");
 IntToStr(numero, txt);
 if(numero < 10){
 lcd_out_cp("00");
 }else if(numero < 100){
 lcd_out_cp("0");
 }

 lcd_out_cp(ltrim(txt));
 lcd_out(1,11,"ASC  ");
 Lcd_Chr_CP(numero);
}

void leituraEntradaADC(){
 valorMedido = adc_read(2);
 IntToStr(valorMedido,txt);
 Lcd_Out(2,1,"ADC2 ");
 Lcd_Out_CP(txt);

 CustomChar(2,16);
}

void CustomChar(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}


void escreveDisplay()
{
 PORTB = 0;

 PORTD = decodifica(unidade);
 RB7_bit = 1;
 delay_ms(500);

 RB7_bit = 0;
 PORTD = decodifica(dezena);
 RB6_bit = 1;
 delay_ms(500);

 RB6_bit = 0;
 PORTD = decodifica(centena);
 RB5_bit = 1;
 delay_ms(500);

 RB5_bit = 0;
 PORTD = decodifica(milhar);
 RB4_bit = 1;
 delay_ms(500);

 RB4_bit = 0;
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
