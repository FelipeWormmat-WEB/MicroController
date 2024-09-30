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

int valor = 0, resposta = 0;//recebe o valor
char txt[7];
void main() {
       porta = 0;//desliga porta
       trisa = 1;//apenas RA0
       adcon1 = 14;// configura como portas digitais
       cmcon = 7;//Desliga comparadores
       intcon2 = 0;// Liga resistor
       adc_init();//inicializa o AD
       lcd_init();//inicializa o lcd
       lcd_cmd(_LCD_CURSOR_OFF);//apaga
       Lcd_Cmd(_LCD_CLEAR);//limpa
       while(1){
            valor = adc_read(0); // Le a entrada RA0
            resposta = (valor * 0.4901) + 0.3937;
            inttostr(resposta,txt);
            lcd_out(1,1," Papo = ");
            lcd_out_cp(txt);
       }
}