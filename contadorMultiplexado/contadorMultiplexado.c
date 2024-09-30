// Felipe Wormmat

// VARIAVEIS GLOBAIS
char unidade = 0, 
dezena = 0, 
centena = 0,
milhar = 0;

// PROTIPACAO DE FUNCOES
void setupInicial();
void escreveDisplay();
char decodifica(char uni);
void crescente();
void crescenteRapido();
void reset();

void main()
{
  setupInicial();

  while (1)
  {
    crescente();
    crescenteRapido();
    escreveDisplay();
    reset();
  }
}

void setupInicial()
{
  PORTA = 0; // desliga a porta A
  PORTB = 0; // desliga a porta B
  PORTC = 0; // desliga a porta C.
  PORTD = 0; // desliga a porta D.
  PORTE = 0; // desliga a porta E.

  TRISA = 0;  // configura o porta como sa?da
  TRISB = 7; // define rb0, rb1 e  rb2 como entradas.
  TRISC = 0;  // configura o porta como sa?da
  TRISD = 0;  // configura o porta como sa?da
  TRISE = 0;  // configura o portc como sa?da.

  CMCON = 7;   // comparadores desligados.
  ADCON1 = 15; // todas as saidas digitais.

  INTCON2 = 0; // liga resistor pull-up do PORTB

  unidade = 3;
  dezena = 2;
  centena = 9;
  milhar = 1;
}

void escreveDisplay()
{
  RA3_bit = 0;
  RA2_bit = 0;
  RC4_bit = 0;
  RC5_bit = 0;

  PORTD = decodifica(unidade);
  RA3_bit = 1; // liga a unidade
  delay_ms(1);

  RA3_bit = 0; // desliga a unidade
  PORTD = decodifica(dezena);
  RE2_bit = 1; // liga a dezena
  delay_ms(1);

  RE2_bit = 0; // desliga a dezena
  PORTD = decodifica(centena);
  RC4_bit = 1; // liga a centena
  delay_ms(1);

  RC4_bit = 0; // desliga a centena
  PORTD = decodifica(milhar);
  RC5_bit = 1; // liga a milhar
  delay_ms(1);
}

char decodifica(char uni)
{
  switch (uni)
  {
  case 0:
    return 63;
    break;

  case 1:
    return 6;
    break;

  case 2:
    return 91;
    break;

  case 3:
    return 79;
    break;

  case 4:
    return 102;
    break;

  case 5:
    return 109;
    break;

  case 6:
    return 125;
    break;

  case 7:
    return 7;
    break;

  case 8:
    return 127;
    break;

  case 9:
    return 111;
    break;
  }
}

void crescente()
{
  if (RB0_bit == 0)
  {
    while (RB0_bit == 0)
      escreveDisplay();
    unidade++;
    if (unidade == 10)
    {
      unidade = 0;
      dezena++;
    }
    if (dezena == 10)
    {
      dezena = 0;
      centena++;
    }
    if (centena == 10)
    {
      centena = 0;
      milhar++;
    }
    if (milhar == 10)
    {
      milhar = 0;
    }
  }
}
void crescenteRapido()
{
  if (RB1_bit == 0)
  {
    escreveDisplay();
    if (RB1_bit == 0)
    {
      unidade++;
      if (unidade == 10)
      {
        unidade = 0;
        dezena++;
      }
      if (dezena == 10)
      {
        dezena = 0;
        centena++;
      }
      if (centena == 10)
      {
        centena = 0;
        milhar++;
      }
      if (milhar == 10)
      {
        milhar = 0;
      }
    }
  }
}

void reset()
{
  if (RB2_bit == 0)
  {
    while (RB2_bit == 0)
      escreveDisplay();
    unidade = 0;
    dezena = 0;
    centena = 0;
    milhar = 0;
  }
}