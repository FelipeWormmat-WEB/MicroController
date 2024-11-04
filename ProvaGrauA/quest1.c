// Configurações das portas do microcontrolador
#define DISPLAY1 PORTD.F0 // Seleção do primeiro display
#define DISPLAY2 PORTD.F1 // Seleção do segundo display
#define DISPLAY3 PORTD.F2 // Seleção do terceiro display
#define DISPLAY4 PORTD.F3 // Seleção do quarto display

// Pino de leitura do RB0
#define BUTTON RB0_bit

// Vetor para representar os números em um display de 7 segmentos
const char segmentos[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F}; // 0 a 9

int contador = 0; // Contador inicial

// Defina o dia e o mês do seu aniversário
int dia = 1;   // Dia do seu aniversário
int mes = 10;  // Mês do seu aniversário (exemplo: 01/10)

// Função para converter o número para os displays
void atualizaDisplays(int valor) {
    int milhar, centena, dezena, unidade;

    milhar = valor / 1000;            // Obtém o dígito do milhar
    centena = (valor / 100) % 10;     // Obtém o dígito da centena
    dezena = (valor / 10) % 10;       // Obtém o dígito da dezena
    unidade = valor % 10;             // Obtém o dígito da unidade

    // Multiplexação dos displays
    DISPLAY1 = 1;  // Habilita o primeiro display
    PORTC = segmentos[milhar]; // Envia o valor para o display
    delay_ms(5);   // Pequeno delay
    DISPLAY1 = 0;  // Desabilita o primeiro display

    DISPLAY2 = 1;  // Habilita o segundo display
    PORTC = segmentos[centena];
    delay_ms(5);
    DISPLAY2 = 0;

    DISPLAY3 = 1;  // Habilita o terceiro display
    PORTC = segmentos[dezena];
    delay_ms(5);
    DISPLAY3 = 0;

    DISPLAY4 = 1;  // Habilita o quarto display
    PORTC = segmentos[unidade];
    delay_ms(5);
    DISPLAY4 = 0;
}

void main() {
    trisd = 0x00; // Configura PORTD como saída para os displays
    trisc = 0x00; // Configura PORTC como saída para os segmentos
    trisb = 0xFF; // Configura PORTB como entrada para o botão RB0

    while (1) {
        // Verifica o estado do botão
        if (BUTTON == 0) {
            delay_ms(50); // Anti-bouncing
            if (BUTTON == 0) {
                contador++; // Incrementa o contador

                if (contador > (dia * 100 + mes)) { // Verifica se atingiu o limite do dia e mês
                    contador = 0; // Reinicia o contador
                }

                atualizaDisplays(contador); // Atualiza os displays

                while (BUTTON == 0); // Aguarda até que o botão seja solto
            }
        }
    }
}
