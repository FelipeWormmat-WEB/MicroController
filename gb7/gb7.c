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

// Definição de um caractere especial (Smiley face)
const char customChar[8] = {
    0b00000,
    0b01010,
    0b01010,
    0b00000,
    0b10001,
    0b01110,
    0b00000,
    0b00000
};

// Função para carregar o caractere especial na CGRAM
void CreateCustomChar() {
    char i;
    Lcd_Cmd(64); // Comando para iniciar gravação na CGRAM (endereço base 64)
    for (i = 0; i < 8; i++) {
        Lcd_Chr_Cp(customChar[i]); // Grava cada byte do caractere na CGRAM
    }
    Lcd_Cmd(_LCD_RETURN_HOME); // Retorna para DDRAM
}

unsigned char counter = 0;  // Contador de 0 a 255
int value = 0;              // Valor para display de 7 segmentos
bit previousStateRB0, previousStateRB1, previousStateRB2, previousStateRB3;
char txt[7];                // Buffer para texto no LCD
int rb2Ativo = 0, rb3Ativo = 0;

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

// Função para exibir números no display de 7 segmentos
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
  previousStateRB0 = 0;
  previousStateRB1 = 0;
  previousStateRB2 = 0;
  previousStateRB3 = 0;

  // Configuração inicial
  PORTA = 0;
  TRISA = 1;          // Configura RA como entrada
  ADCON1 = 14;        // Configura RA como portas digitais
  CMCON = 7;          // Desabilita comparadores
  INTCON2 = 0;

  TRISB0_bit = 1;     // Configura RB0 como entrada
  TRISB1_bit = 1;     // Configura RB1 como entrada
  TRISB2_bit = 1;     // Configura RB2 como entrada

  TRISD = 0;          // Configura PORTD como saída
  TRISB4_bit = 0;     // Configura RB4 (unidade) como saída
  TRISB5_bit = 0;     // Configura RB5 (dezena) como saída
  TRISB6_bit = 0;     // Configura RB6 (centena) como saída
  TRISB7_bit = 0;     // Configura RB7 (milhar) como saída

  ADC_Init();         // Inicializa ADC
  Lcd_Init();         // Inicializa LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_CLEAR);
  CreateCustomChar(); // Cria o caractere especial

  while (1) {
    Lcd_Chr(2, 16, 0); // Exibe o caractere especial (índice 0 na CGRAM)
    // Detecção de borda de subida para RB0 (Exibe texto no LCD)
    if (RB0_bit == 1 && previousStateRB0 == 0) {
      previousStateRB0 = 1;

      Lcd_Out(1, 1, "Felipe Wormmat");
      Lcd_Out(2, 1, "RA 38579");

      Delay_ms(2000);    // Aguarda 2 segundos
      Lcd_Cmd(_LCD_CLEAR);  // Limpa o LCD
    } else if (RB0_bit == 0) {
      previousStateRB0 = 0;
    }

    // Detecção de borda de subida para RB1 (Exibe RA nos displays)
    if (RB1_bit == 1 && previousStateRB1 == 0) {
      previousStateRB1 = 1;

      displayNumber(3, 1); // Milhar
      displayNumber(8, 2); // Centena
      displayNumber(5, 3); // Dezena
      displayNumber(7, 4); // Unidade

      Delay_ms(200); // Pequeno atraso para evitar múltiplas detecções
    } else if (RB1_bit == 0) {
      previousStateRB1 = 0;
    }

    // Detecção de borda de subida para RB2 (Incrementa contador e exibe no LCD)
    if (RB2_bit == 1 && previousStateRB2 == 0) {
        Delay_ms(50);          // Debounce
        if (RB2_bit == 1) {    // Confirma botão pressionado
            previousStateRB2 = 1;

            if (rb2Ativo == 1) counter++;
            if (counter > 255) counter = 0;

            if (rb2Ativo == 1) {
                pwm1_set_duty(counter); // Atualiza duty cycle do PWM

                ByteToStr(counter, txt);      // Converte contador para string
                Lcd_Cmd(_LCD_CLEAR);
                Lcd_Out(1, 1, "Conta ");
                Lcd_Out_Cp(txt);
            }
        }
    } else if (RB2_bit == 0) {
        rb2Ativo = 1;
        previousStateRB2 = 0;
    }

    // Detecção de borda de subida para RB3 (Decrementa contador e exibe no LCD)
    if (RB3_bit == 1 && previousStateRB3 == 0) {
        Delay_ms(50);          // Debounce
        if (RB3_bit == 1) {    // Confirma botão pressionado
            previousStateRB3 = 1;

            if (rb3Ativo == 1) counter--;
            if (counter < 1) counter = 255;

            if (rb3Ativo == 1) {
                pwm1_set_duty(counter); // Atualiza duty cycle do PWM

                ByteToStr(counter, txt);      // Converte contador para string
                Lcd_Cmd(_LCD_CLEAR);
                Lcd_Out(1, 1, "Conta ");
                Lcd_Out_Cp(txt);
            }
        }
    } else if (RB3_bit == 0) {
        rb3Ativo = 1;
        previousStateRB3 = 0;
    }
  }
}