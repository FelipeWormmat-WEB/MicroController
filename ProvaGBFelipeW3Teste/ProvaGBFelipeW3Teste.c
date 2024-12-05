// Configuração do LCD e PWM
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

int conta = 0;

void setupInicial();
void contadorDisplay(int numero);
void clearDisplay();

void main() {

  lcd_init();
  lcd_cmd(_LCD_CURSOR_OFF);
  lcd_cmd(_LCD_CLEAR);

  PWM1_Init(20000);
  PWM1_Set_Duty(conta);
  PWM1_Start();

  setupInicial();
  contadorDisplay(conta);

  while(1) {

    if (rb2_bit == 0) {
      delay_ms(10);
      while (rb2_bit == 0) {
        if (conta < 255) {
          conta++;                 // Incrementa o valor de conta
          contadorDisplay(conta);  // Atualiza o display com o novo valor
          PWM1_Set_Duty(conta);    // Atualiza o PWM com o novo valor de conta
        }
      }
    }

  }
}

void setupInicial() {
  PORTA = 0;
  PORTC = 0;
  PORTD = 0;
  PORTE = 0;
  PORTB = 0; // desliga a porta B

  TRISA = 4;  // configura o porta como saída
  TRISB = 15; // rb0 como entrada
  TRISC = 0;  // configura o porta como saída
  TRISD = 0;  // configura o porta como saída
  TRISE = 0;  // configura o portc como saída.

  CMCON = 7;   // comparadores desligados.
  ADCON1 = 12; // todas as saídas digitais.
  INTCON2 = 0; // liga resistor pull-up do PORTB
}

void contadorDisplay(int numero) {
  lcd_out(1, 1, "CONTA ");
  IntToStr(numero, txt);
  if (numero < 10) {
    lcd_out_cp("00");
  } else if (numero < 100) {
    lcd_out_cp("0");
  }

  lcd_out_cp(ltrim(txt));
}

void clearDisplay() {
  lcd_out(1, 1, "                ");
  lcd_out(2, 1, "                ");
}