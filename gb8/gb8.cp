#line 1 "C:/Users/Felipe/Desktop/Microcontroladores/gb8/gb8.c"
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

void CreateCustomChar() {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i < 8; i++) {
 Lcd_Chr_Cp(customChar[i]);
 }
 Lcd_Cmd(_LCD_RETURN_HOME);
}

unsigned char counter = 0;
int value = 0;
bit previousStateRB0, previousStateRB1, previousStateRB2, previousStateRB3;
char txt[7];
int rb2Ativo = 0, rb3Ativo = 0;

const unsigned char segment_codes[] = {
 0b00111111,
 0b00000110,
 0b01011011,
 0b01001111,
 0b01100110,
 0b01101101,
 0b01111101,
 0b00000111,
 0b01111111,
 0b01101111
};

void displayNumber(unsigned char digit, unsigned char position) {
 PORTD = segment_codes[digit];
 switch (position) {
 case 1: RB7_bit = 1; break;
 case 2: RB6_bit = 1; break;
 case 3: RB5_bit = 1; break;
 case 4: RB4_bit = 1; break;
 }
 Delay_ms(200);
 RB7_bit = RB6_bit = RB5_bit = RB4_bit = 0;
}

void main() {
 previousStateRB0 = 0;
 previousStateRB1 = 0;
 previousStateRB2 = 0;
 previousStateRB3 = 0;
 PORTA = 0;
 TRISA = 4;
 ADCON1 = 12;
 CMCON = 7;
 INTCON2 = 0;
 TRISB0_bit = 1;
 TRISB1_bit = 1;
 TRISB2_bit = 1;
 TRISD = 0;
 TRISB4_bit = 0;
 TRISB5_bit = 0;
 TRISB6_bit = 0;
 TRISB7_bit = 0;

 ADC_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 CreateCustomChar();
 pwm1_init(20000);
 pwm1_set_duty(0);
 pwm1_start();

 while (1) {
 unsigned int adcValue;
 char adcTxt[7];
 Lcd_Chr(2, 16, 0);

 if (RB0_bit == 1 && previousStateRB0 == 0) {
 previousStateRB0 = 1;

 Lcd_Out(1, 1, "Felipe Wormmat");
 Lcd_Out(2, 1, "RA 38579");

 Delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);
 } else if (RB0_bit == 0) {
 previousStateRB0 = 0;
 }

 if (RB1_bit == 1 && previousStateRB1 == 0) {
 previousStateRB1 = 1;

 displayNumber(3, 1);
 displayNumber(8, 2);
 displayNumber(5, 3);
 displayNumber(7, 4);

 Delay_ms(200);
 } else if (RB1_bit == 0) {
 previousStateRB1 = 0;
 }

 if (RB2_bit == 1 && previousStateRB2 == 0) {
 Delay_ms(50);
 if (RB2_bit == 1) {
 previousStateRB2 = 1;

 if (rb2Ativo == 1) counter++;
 if (counter > 255) counter = 0;

 if (rb2Ativo == 1) {
 pwm1_set_duty(counter);

 ByteToStr(counter, txt);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Conta ");
 Lcd_Out_Cp(txt);
 adcValue = ADC_Read(2);
 WordToStr(adcValue, adcTxt);
 Lcd_Out(2, 1, "ADC2:");
 Lcd_Out_Cp(adcTxt);
 }
 }
 } else if (RB2_bit == 0) {
 rb2Ativo = 1;
 previousStateRB2 = 0;
 }

 if (RB3_bit == 1 && previousStateRB3 == 0) {
 Delay_ms(50);
 if (RB3_bit == 1) {
 previousStateRB3 = 1;

 if (rb3Ativo == 1) counter--;
 if (counter < 1) counter = 255;

 if (rb3Ativo == 1) {
 pwm1_set_duty(counter);

 ByteToStr(counter, txt);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Conta ");
 Lcd_Out_Cp(txt);
 adcValue = ADC_Read(2);
 WordToStr(adcValue, adcTxt);
 Lcd_Out(2, 1, "ADC2:");
 Lcd_Out_Cp(adcTxt);
 }
 }
 } else if (RB3_bit == 0) {
 rb3Ativo = 1;
 previousStateRB3 = 0;
 }
 }
}
