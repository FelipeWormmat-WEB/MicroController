#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/ProvaGA/ProvaGA.c"

sbit LCD_RS at RE1_bit;
sbit LCD_EN at RE0_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISE1_bit;
sbit LCD_EN_Direction at TRISE0_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;


int iDados[16];
int iCasas[2] = {0,0};

char txt[17];

int CountRA = 0;
int CountInt = 0;
int count_interrupt = 0;

void setupInicial();
void escreveTela(int linha, int coluna, char *txtAux);

void funcQuestao1();
void funcQuestao2();
void funcQuestao3();
void funcQuestao4();
void funcQuestao5();

void main() {

 setupInicial();

 while(1){
 escreveTela(0,0,"");

 if(RB0_bit == 0){
 while(RB0_bit == 0) delay_ms(100);
 funcQuestao1();
 }

 if(RB1_bit == 0){
 while(RB1_bit == 0) delay_ms(100);
 funcQuestao2();
 }

 if(RB2_bit == 0){
 while(RB2_bit == 0) delay_ms(100);
 funcQuestao3();
 }

 if(RB3_bit == 0){
 while(RB3_bit == 0) delay_ms(100);
 funcQuestao4();
 }

 if(RA4_bit == 1){
 while(RA4_bit == 1) delay_ms(100);
 funcQuestao5();
 }
 }
}

void interrupt(){
 if(tmr0if_bit == 1){
 tmr0if_bit = 0;
 count_interrupt++;
 if(count_interrupt == 38){
 if(CountInt <= 60){
 CountInt++;
 } else {
 CountInt = 0;
 }
 count_interrupt = 0;
 }
 }
}

void setupInicial(){
 porta = 0;
 portb = 0;
 portc = 0;
 portd = 0;
 porte = 0;

 trisa = 51;
 trisb = 15;
 trisc = 0;
 trisd = 0;
 trise = 0;

 ra3_bit = 1;

 intcon2 = 0;
 adcon1 = 15;
 cmcon = 7;

 lcd_init();
 delay_ms(1000);
 lcd_cmd(_Lcd_cursor_off);
 lcd_cmd(_Lcd_clear);

 intcon = 0;
 tmr0ie_bit = 1;
 t0con = 199;
 gie_bit = 1;
}

void escreveTela(int linha, int coluna, char *txtAux){
 char txtInt[16];

 lcd_out(linha,coluna,"");
 lcd_out_cp(ltrim(txtAux));
 lcd_out_cp(ltrim(txt));

 inttostr(CountInt,txtInt);
 lcd_out(2,15,ltrim(txtInt));
}

void funcQuestao1(){
 portc = 0;
 delay_ms(500);
 portc = 8;
 delay_ms(500);
 portc = 12;
 delay_ms(500);
 portc = 14;
 delay_ms(500);
 portc = 15;
 delay_ms(500);
}

void funcQuestao2(){
 lcd_cmd(_Lcd_clear);

 strcpy(txt, "Elivelton G.");
 escreveTela(1,1,"");
 delay_ms(1000);
 strcpy(txt, "023960");
 escreveTela(2,9,"");
}

void funcQuestao3(){
 CountRA = 0;
 lcd_cmd(_Lcd_clear);

 while (CountRA <= 23960){
 inttostr(CountRA,txt);
 escreveTela(1,1,"RA : ");
 CountRA++;
 }
}

void funcQuestao4(){
 CountRA = 0;
 lcd_cmd(_Lcd_clear);
 inttostr(CountRA,txt);
 escreveTela(1,1,"RA : ");
}

void funcQuestao5(){
 CountRA = 23960;
 lcd_cmd(_Lcd_clear);

 while (CountRA >= 0){
 inttostr(CountRA,txt);
 escreveTela(1,1,"RA : ");
 CountRA--;
 }
}
