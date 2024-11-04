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

char duty_cycle = 0;//varia de 0  a 255
void setupInicial();

void main(){
  setupInicial();
  pwm1_init(20000);//frequencia de 20KHZ
  pwm1_set_duty(duty_cycle);//inicia o pwm com zero
  pwm1_start();//pwm ligado
  while(1) {
       if(rb0_bit == 0){
          delay_ms(100);
          if(rb0_bit == 0);
          if(duty_cycle < 255) duty_cycle ++;
       }
       if(rb1_bit == 0){
          delay_ms(100);
          if(rb1_bit == 0);
          if(duty_cycle < 255) duty_cycle --;
       }
       pwm1_set_duty(duty_cycle);//atribui ao pw o valor ao duty;
  }
}

void setupInicial() {
  porta = 0;
  portb = 0;
  portc = 0;
  portd = 0;
  porte = 0;

  trisa = 0;        // PORTA como saída
  trisb = 15;
  trisc = 0;      // RC7 (RX) como entrada
  trisd = 0;        // PORTD como saída
  trise = 0;        // PORTE como saída

  adcon1 = 15;      // Todas são entradas digitais
  cmcon = 7;        // Desliga os comparadores
  intcon2 = 0;      // Liga resistor pull-up do PORTB
}
