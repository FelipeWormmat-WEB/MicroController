void main() {
     porta = 0; // Desliga a porta
     trisa = 0; // Configura RA4 3 RA5 como entrada
     portc = 0; // Desliga o portc
     trisc = 0; // Configura portc como saida
     cmcon = 7; // Comparadores desligados
     adcon1 = 15; // Todas as saidas
     porte = 0;
     trise = 0;
     portd = 0;
     trisd = 0;
     
     while(1){
          portd = 1; // Liga o segmento a
          rc5_bit = 1; // Liga o display
          rc4_bit = 0;
          re2_bit = 0;
          ra3_bit = 0;
          delay_ms(250);
          
          rc5_bit = 0;
          rc4_bit = 1;
          delay_ms(250);
          
          rc4_bit = 0;
          re2_bit = 1;
          delay_ms(250);

          re2_bit = 0; // Liga o display
          rA3_bit = 1;
          delay_ms(250);
          
          portd = 2;
          delay_ms(250);
          
          portd = 4;
          delay_ms(250);
          
          portd = 8;
          delay_ms(250);
          
          portd = 16;
          delay_ms(250);
          
          portd = 32;
          delay_ms(250);
          
          portd = 64;
          delay_ms(250);
          
          portd = 128;
          delay_ms(250);
     }
}