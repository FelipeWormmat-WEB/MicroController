void main() {
     portd = 0; // Desliga o portd
     trisd = 0; // Configura o portd como sa�da
     adcon1 = 15; // Sa�das digitais
     cmcon = 7; // Comparadores desligados
     
     porta = 0; // Desliga porta
     trisa = 0; // Configura porta como sa�da
     RA3_bit = 1; // Liga display de unidade

     while(1){
          portd = 63; // C�digo do zero
          delay_ms(500);
          portd = 6; // C�digo do um
          delay_ms(500);
          portd = 91;
          delay_ms(500);
          portd = 79;
          delay_ms(500);
          portd = 102;
          delay_ms(500);
          portd = 109;
          delay_ms(500);
          portd = 125;
          delay_ms(500);
          portd = 7;
          delay_ms(500);
          portd = 127;
          delay_ms(500);
          portd = 111;
          delay_ms(500);
          
     }
}