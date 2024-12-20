// Lcd pinout settings
sbit LCD_RS at RE1_bit;
sbit LCD_EN at RE0_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISE1_bit;
sbit LCD_EN_Direction at TRISE0_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;

void setup_inicial();
int conta = 0;
int vetor[32];
char txt[7];
void main() {
    lcd_init();
    lcd_cmd(_lcd_cursor_off);
    lcd_cmd(_lcd_clear);
    setup_inicial();
    conta = flash_read(0x7f00);
    while(1){
        if(rb0_bit == 0){
            while(rb0_bit == 0)delay_ms(100);
            conta ++;
            vetor[0] = conta;
            flash_erase_write_64(0x7f00,vetor);
        }
        if(rb1_bit == 0){
            while(rb1_bit == 0)delay_ms(100);
            conta --;
            vetor[0] = conta;
            flash_erase_write_64(0x7f00,vetor);
        }
        if(rb2_bit == 0){
            while(rb2_bit == 0)delay_ms(100);
            //zera a mem�ria
            conta = 0;
            vetor[0] = conta;
            flash_erase_write_64(0x7f00,vetor);
        }
        lcd_out(1,1,"Conta=");
        inttostr(conta,txt);
        lcd_out_cp(txt);
    }
}
void setup_inicial(){
    porta = 0;
    portb = 0;
    portc = 0;
    portd = 0;
    porte = 0;
    trisa = 0;
    trisb = 15;//RB0, RB1, RB2 e RB3 como entrada
    trisc = 0;
    trisd = 0;
    trise = 0;
    cmcon = 7;//desliga os comparadores
    adcon1 = 15;//portas digitais
    intcon2 = 0;//liga os resistores pull up do portb
}