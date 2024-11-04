#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/PWM/PWM.c"
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

char duty_cycle = 0;
void setupInicial();

void main(){
 setupInicial();
 pwm1_init(20000);
 pwm1_set_duty(duty_cycle);
 pwm1_start();
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
 pwm1_set_duty(duty_cycle);
 }
}

void setupInicial() {
 porta = 0;
 portb = 0;
 portc = 0;
 portd = 0;
 porte = 0;

 trisa = 0;
 trisb = 15;
 trisc = 0;
 trisd = 0;
 trise = 0;

 adcon1 = 15;
 cmcon = 7;
 intcon2 = 0;
}
