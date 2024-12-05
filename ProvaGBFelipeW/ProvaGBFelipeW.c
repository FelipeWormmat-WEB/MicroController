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

int value = 0;
char txt[7];
bit previousState;  // Declara o bit sem inicializar diretamente

void main() {
  previousState = 0;  // Inicializa o valor do bit no início do programa

  PORTA = 0;
  TRISA = 1;          // Configura RA como entrada
  ADCON1 = 14;        // Configura RA como portas digitais
  CMCON = 7;          // Desabilita comparadores
  INTCON2 = 0;

  TRISB0_bit = 1;     // Configura RB0 como entrada

  ADC_Init();         // Inicializa ADC
  Lcd_Init();         // Inicializa LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_CLEAR);

  while (1) {
    if (RB0_bit == 1 && previousState == 0) {  // Detecção de borda de subida
      previousState = 1;  // Atualiza estado anterior

      // Atualiza o LCD com os dados
      Lcd_Out(1, 1, "Felipe Wormmat");
      Lcd_Out(2, 1, "RA 38579");

      Delay_ms(2000);    // Aguarda 2 segundos

      Lcd_Cmd(_LCD_CLEAR);  // Limpa o LCD
    } else if (RB0_bit == 0) {
      previousState = 0;  // Atualiza estado anterior
    }
  }
}