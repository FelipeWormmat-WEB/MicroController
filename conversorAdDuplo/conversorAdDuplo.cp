#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/conversorAdDuplo/conversorAdDuplo.c"

sbit LCD_RS at RE1_bit;
sbit LCD_EN at RE0_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;

sbit LCD_RS_Direction at TRISE1_bit;
sbit LCD_EN_Direction at TRISE0_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;


long soma1 = 0;
int valor1 = 0;
long soma2 = 0;
int valor2 = 0;
int conta = 0;
int resposta1 = 0;
int resposta2 = 0;
char txt[7];

void setup_inicial();

void main() {
 setup_inicial();
 lcd_init();
 lcd_cmd(_LCD_CURSOR_OFF);
 lcd_cmd(_lcd_clear);
 lcd_out(1,1, " AD");
 lcd_out(2,1, " Tudojunto");
 delay_ms(100);
 adc_init();
 while(1){

 soma1 = soma1 + adc_read(0);
 soma2 = soma2 + adc_read(1);
 conta ++;
 if(conta == 500){
 valor1 = soma1/ conta;
 resposta1 = (valor1 * 2 + resposta1 * 8)/10;
 resposta1 = resposta1 / 2.038;
 valor2 = soma2/ conta;
 resposta2 = (valor2 * 2 + resposta2 *8)/10;
 soma1 = 0;
 soma2 = 0;
 conta = 0;
 inttostr(resposta1,txt);
 lcd_out(1,1,"Resposta1=");
 lcd_out_cp(txt);


 inttostr(resposta2,txt);
 lcd_out(2,1,"Resposta2=");
 lcd_out_cp(txt);
 }
 }
}
void setup_inicial(){
 porta = 0;
 portb = 0;
 portc = 0;
 portd = 0;
 porte = 0;
 trisa = 3;
 trisb = 0;
 trisc = 0;
 trisd = 0;
 trise = 0;
 adcon1 = 13;
 cmcon = 7;
 intcon2 = 0;
 ADC_init();
}
