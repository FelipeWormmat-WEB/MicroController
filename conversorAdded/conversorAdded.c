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
void setup_inicial();

int conta_medicoes = 0;
int valor_medido = 0;
int valor = 0, resposta = 0;
char txt[7];
void main() {
     setup_inicial();// Configura o micro
     lcd_init();
     lcd_cmd(_LCD_CURSOR_OFF);//apaga
     lcd_Cmd(_LCD_CLEAR);//limpa
     while(1){
         valor_medido = ADC_Read(0);// Medição RA0
         resposta = (valor * 0.4901) + 0.3937;
         inttostr(valor_medido,txt);
         lcd_out(1,1, "teste = ");
         lcd_out_CP(txt);
     }
}

void setup_inicial(){
    porta = 0;
    portb = 0;
    portc = 0;
    portd = 0;
    porte = 0;
    trisa = 1;
    trisb = 15; //RB0,RB1,RB2 e RB3 como entradas
    trisc = 0;
    trisd = 0;
    trise = 0;
    adcon1 = 14; //Configura como portas digitais
    cmcon = 7;   //desliga os comparadores
    intcon2 = 0; //liga resistor pull up do portb
    ADC_init();// inicia o conversor ad
}