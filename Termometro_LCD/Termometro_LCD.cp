#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/Termometro_LCD/Termometro_LCD.c"

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

void setupInicial();
void CustomChar(unsigned short pos_row, unsigned short pos_char);

long somaMedia = 0;
int contaMedidas = 0;
int valorMedio = 0;

int conta = 0;
int vetor[32];
char txt[7];
int valorMedido =0;
int temperatura=0;

const char character[] = {7, 5, 7, 0, 0, 0, 0, 0};

void CustomChar(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i <= 7; i++) {
 Lcd_Chr_CP(character[i]);
 }
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}

void main() {
 setupInicial();
 conta = FLASH_Read(0x7f00);

 adc_init();

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);

 while(1){

 somaMedia = somaMedia + adc_read(0);
 contaMedidas++;

 if(contaMedidas >= 100){
 valorMedio = somaMedia / contaMedidas;
 contaMedidas = 0;
 somaMedia = 0;
 IntToStr(valorMedio,txt);
 Lcd_Out(2,1,"ADC0=");
 Lcd_Out_CP(txt);
 }







 if(rb0_bit ==0 ){
 while(rb0_bit ==0) Delay_ms(100);
 conta++;
 vetor[0] = conta;
 FLASH_Erase_Write_64(0x7f00,vetor);
 }
 if(rb1_bit ==0 ){
 while(rb1_bit ==0) Delay_ms(100);
 conta--;
 vetor[0] = conta;
 FLASH_Erase_Write_64(0x7f00,vetor);
 }
 if(rb2_bit ==0 ){
 while(rb2_bit ==0) Delay_ms(100);

 conta = 0;
 vetor[0]= conta;
 FLASH_Erase_Write_64(0x7f00,vetor);
 }
 lcd_out(1,1,"Conta=");
 IntToStr(conta,txt);
 Lcd_Out_CP(txt);
 lcd_out(2,1,"Temp=");
 inttostr(valorMedio,txt);
 lcd_out_cp(txt);
 CustomChar(2,15);
 lcd_out_cp("C");
 if(valorMedio > conta){
 rc0_bit = 1;
 }else{
 rc0_bit = 0;
 }
 }
}

void setupInicial(){
 PORTA = 0;
 PORTB = 0;
 PORTC = 0;
 PORTD = 0;
 PORTE = 0;

 TRISA = 1;
 TRISB = 15;
 TRISC = 0;
 TRISD = 0;
 TRISE = 0;

 CMCON = 7;
 ADCON1 = 14;
 INTCON2 = 0;
}
