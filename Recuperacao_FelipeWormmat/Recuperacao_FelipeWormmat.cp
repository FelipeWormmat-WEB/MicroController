#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/Recuperacao_FelipeWormmat/Recuperacao_FelipeWormmat.c"

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



int segundo = 0, minuto = 6, hora = 8, dia = 8, ano = 2024;
int dia_semana = 3;
int mes = 10;
int txt[7];
int contador = 0;
int conta_menu = 0;


void setup_inicial();
void escreve_lcd();
void escreve_dia();
void escreve_mes();
void escreve_ano();
void escreve_dia_semana();
void escreve_hora();
void relogio();


void main(){
 setup_inicial();
 lcd_init();
 lcd_cmd(_LCD_CURSOR_OFF);
 lcd_cmd(_LCD_CLEAR);
 while(1){
 relogio();
 escreve_lcd();
 if(rb0_bit==0){
 while(rb0_bit == 0) delay_ms(100);
 if(conta_menu < 7) conta_menu ++;
 if(conta_menu == 7) conta_menu = 0;
 }
 if(rb1_bit == 0){
 while(rb1_bit == 0) delay_ms(100);
 conta_menu = 0;
 }
 if(conta_menu == 1){

 if(rb2_bit == 0){
 while(rb2_bit == 0) delay_ms(100);
 if(minuto < 60) minuto ++;
 }
 if(rb3_bit == 0){
 while(rb3_bit == 0) delay_ms(100);
 if(minuto > 0) minuto --;
 }
 }
 if(conta_menu == 2){
 if(rb2_bit == 0){
 while(rb2_bit == 0) delay_ms(100);
 if(hora < 23) hora++;
 }
 if(rb3_bit == 0){
 while(rb3_bit == 0) delay_ms(100);
 if(hora > 0) hora--;
 }
 }
 if(conta_menu == 3){
 if(rb2_bit == 0){
 while(rb2_bit == 0) delay_ms(100);
 dia_semana = (dia_semana + 1) % 7;
 }
 if(rb3_bit == 0){
 while(rb3_bit == 0) delay_ms(100);
 dia_semana = (dia_semana == 0) ? 6 : dia_semana - 1;
 }
 }
 if(conta_menu == 4){
 if(rb2_bit == 0){
 while(rb2_bit == 0) delay_ms(100);
 if(dia < 31) dia++;
 }
 if(rb3_bit == 0){
 while(rb3_bit == 0) delay_ms(100);
 if(dia > 1) dia--;
 }
 }
 if(conta_menu == 5){
 if(rb2_bit == 0){
 while(rb2_bit == 0) delay_ms(100);
 mes = (mes % 12) + 1;
 }
 if(rb3_bit == 0){
 while(rb3_bit == 0) delay_ms(100);
 mes = (mes == 1) ? 12 : mes - 1;
 }
 }
 if(conta_menu == 6){
 if(rb2_bit == 0){
 while(rb2_bit == 0) delay_ms(100);
 if(ano < 9999) ano++;
 }
 if(rb3_bit == 0){
 while(rb3_bit == 0) delay_ms(100);
 if(ano > 2024) ano--;
 }
 }
 }
}

void valida_dia(){
 int dias_no_mes;
 if(mes == 2){
 dias_no_mes = (ano % 4 == 0 && (ano % 100 != 0 || ano % 400 == 0)) ? 29 : 28;
 } else if(mes == 4 || mes == 6 || mes == 9 || mes == 11){
 dias_no_mes = 30;
 } else {
 dias_no_mes = 31;
 }
 if(dia > dias_no_mes) dia = dias_no_mes;
}

void setup_inicial(){

 portb = 0;




 trisb = 15;



 adcon1 = 15;
 cmcon = 7;
 intcon2 = 0;
 T0CON = 197;
 INTCON.TMR0IE = 1;
 INTCON.GIE = 1;
}

void interrupt(){
 if(tmr0if_bit == 1){
 tmr0if_bit = 0;
 contador ++;
 if(contador == 122){

 contador = 0;
 segundo ++;
 }
 }
}

void escreve_lcd(){
 lcd_out(1,1,"");
 escreve_dia();
 escreve_mes();
 escreve_ano();
 lcd_out(2,1,"");
 escreve_dia_semana();
 escreve_hora();
}
void escreve_dia(){
 inttostr(dia,txt);
 if(dia < 10)lcd_out_cp("0");
 lcd_out_cp(ltrim(txt));
 lcd_out_cp(" ");
}
void escreve_mes(){
 if(mes == 10) lcd_out_cp("Outubro  ");
}
void escreve_ano(){
 inttostr(ano,txt);
 lcd_out_cp(ltrim(txt));
}

void escreve_dia_semana(){
 if(dia_semana == 3)lcd_out_cp("Terca   ");
}
void escreve_hora(){
 lcd_out_cp("08:");


 if(conta_menu == 1 && contador < 61) lcd_out_cp("  ");
 else{
 inttostr(minuto,txt);
 if(minuto < 10)lcd_out_cp("0");
 lcd_out_cp(ltrim(txt));
 }


 if(contador < 61)lcd_out_cp(":");
 else lcd_out_cp(" ");


 inttostr(segundo,txt);
 if(segundo < 10)lcd_out_cp("0");
 lcd_out_cp(ltrim(txt));
}
void relogio(){
 if(segundo == 60){
 segundo = 0;
 minuto++;
 if(minuto == 60){
 minuto = 0;
 hora++;
 if(hora == 24){
 hora = 0;
 dia++;
 valida_dia();
 if(dia == 1){
 mes++;
 if(mes == 13){
 mes = 1;
 ano++;
 }
 }
 }
 }
 }
}
