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

unsigned char counter = 0;  // Contador de 0 a 255
bit previousStateRB0;       // Estado anterior do RB0
bit previousStateRB2;       // Estado anterior do RB2
char txt[7];                // Buffer para texto no LCD

void main() {
  PORTA = 0;
  TRISA = 1;                // Configura RA como entrada
  ADCON1 = 14;              // Configura RA como portas digitais
  CMCON = 7;                // Desabilita comparadores
  INTCON2 = 0;

  TRISB0_bit = 1;           // Configura RB0 como entrada
  TRISB2_bit = 1;           // Configura RB2 como entrada

  ADC_Init();               // Inicializa ADC
  Lcd_Init();               // Inicializa LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_CLEAR);

  previousStateRB0 = 0;     // Inicializa o estado anterior de RB0
  previousStateRB2 = 0;     // Inicializa o estado anterior de RB2

  while (1) {
    // Verifica borda de subida em RB0 para exibir texto por 2 segundos
    if (RB0_bit == 1 && previousStateRB0 == 0) {
      previousStateRB0 = 1;  // Atualiza estado anterior

      // Atualiza o LCD com os dados
      Lcd_Out(1, 1, "William Basso");
      Lcd_Out(2, 1, "RA 37678");

      Delay_ms(2000);        // Aguarda 2 segundos
      Lcd_Cmd(_LCD_CLEAR);   // Limpa o LCD
    } else if (RB0_bit == 0) {
      previousStateRB0 = 0;  // Atualiza estado anterior
    }

    // Verifica borda de subida em RB2 para incrementar o contador
    if (RB2_bit == 1 && previousStateRB2 == 0) {
      Delay_ms(50);          // Debounce: Aguarda estabilização do sinal
      if (RB2_bit == 1) {    // Confirma que o botão ainda está pressionado
        previousStateRB2 = 1;  // Atualiza estado anterior

        counter++;             // Incrementa o contador
        if (counter > 255) {   // Garante que o contador não ultrapasse 255
          counter = 0;
        }

        // Converte o valor do contador para string e exibe no LCD
        ByteToStr(counter, txt);
        Lcd_Cmd(_LCD_CLEAR);   // Limpa o LCD
        Lcd_Out(1, 1, "Conta ");
        Lcd_Out_Cp(txt);
      }
    } else if (RB2_bit == 0) {
      previousStateRB2 = 0;  // Atualiza estado anterior
    }
  }
}