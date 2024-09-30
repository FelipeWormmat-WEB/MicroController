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
char valor = 127;
int numero = 10;
float real = 3.1415;
char txt[15];

const char character[] = {7,5,7,0,0,0,0,0};

void CustomChar(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}


void main() {
     lcd_init();
     lcd_cmd(_LCD_CURSOR_OFF);
     lcd_Cmd(_LCD_CLEAR);
     while(1){
         lcd_out(1,1,"valor =");
         bytetostr(valor,txt);
         lcd_out_cp(txt);
         delay_ms(1000);
         
         lcd_out(2,1,"numero =");
         bytetostr(numero,txt);
         lcd_out_cp(txt);
         delay_ms(1000);
         
         lcd_out(1,1,"real = ");
         floattostr(real,txt);
         lcd_out_cp(txt);
         delay_ms(1000);
         
         CustomChar(2,16);
         delay_ms(1000);
         
         lcd_cmd(_LCD_CLEAR);
         delay_ms(1000);

     }
}
