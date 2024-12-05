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
bit previousStateRB0, previousStateRB1;

// Tabela de códigos para os números de 0 a 9 para o display de 7 segmentos
const unsigned char segment_codes[] = {
  0b00111111, // 0
  0b00000110, // 1
  0b01011011, // 2
  0b01001111, // 3
  0b01100110, // 4
  0b01101101, // 5
  0b01111101, // 6
  0b00000111, // 7
  0b01111111, // 8
  0b01101111  // 9
};

void displayNumber(unsigned char digit, unsigned char position) {
  PORTD = segment_codes[digit]; // Envia o código do dígito para os segmentos
  switch (position) {
    case 1: RB7_bit = 1; break; // Unidade de milhar
    case 2: RB6_bit = 1; break; // Centena
    case 3: RB5_bit = 1; break; // Dezena
    case 4: RB4_bit = 1; break; // Unidade
  }
  Delay_ms(200); // Breve atraso para estabilizar a exibição
  RB7_bit = RB6_bit = RB5_bit = RB4_bit = 0; // Desliga os displays
}

void main() {
  previousStateRB0 = 0; // Inicializa estados anteriores
  previousStateRB1 = 0;

  // Configuração inicial
  PORTA = 0;
  TRISA = 1;          // Configura RA como entrada
  ADCON1 = 14;        // Configura RA como portas digitais
  CMCON = 7;          // Desabilita comparadores
  INTCON2 = 0;

  TRISB0_bit = 1;     // Configura RB0 como entrada
  TRISB1_bit = 1;     // Configura RB1 como entrada

  TRISD = 0;          // Configura PORTD como saída
  TRISB4_bit = 0;     // Configura RB4 (unidade) como saída
  TRISB5_bit = 0;     // Configura RB5 (dezena) como saída
  TRISB6_bit = 0;     // Configura RB6 (centena) como saída
  TRISB7_bit = 0;     // Configura RB7 (milhar) como saída

  ADC_Init();         // Inicializa ADC
  Lcd_Init();         // Inicializa LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_CLEAR);

  while (1) {
    // Detecção de borda de subida para RB0
    if (RB0_bit == 1 && previousStateRB0 == 0) {
      previousStateRB0 = 1;

      // Atualiza o LCD com os dados
      Lcd_Out(1, 1, "Felipe Wormmat");
      Lcd_Out(2, 1, "RA 38579");

      Delay_ms(2000);    // Aguarda 2 segundos
    } else if (RB0_bit == 0) {
      previousStateRB0 = 0;
    }

    // Detecção de borda de subida para RB1
    if (RB1_bit == 1 && previousStateRB1 == 0) {
      previousStateRB1 = 1;

      // Escreve os 4 primeiros dígitos do RA nos displays
      displayNumber(3, 1); // Milhar
      displayNumber(8, 2); // Centena
      displayNumber(5, 3); // Dezena
      displayNumber(7, 4); // Unidade

      Delay_ms(2000); // Pequeno atraso para evitar múltiplas detecções
    } else if (RB1_bit == 0) {
      previousStateRB1 = 0;
    }
  }
}