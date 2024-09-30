void main() {
     porta = 0; // Desliga a porta
     trisa = 48; // Configura RA4 3 RA5 como entrada
     portc = 0; // Desliga o portc
     trisc = 0; // Configura portc como saida
     cmcon = 7; // Comparadores desligados
     adcon1 = 15; // Todas as saidas
     while(1){
          if(ra4_bit == 1){
             while(ra4_bit == 1)delay_ms(100);
             //rc2_bit = 1; // liga o led RC2
             portc = 4;// liga apenas RC2
          }
          if(ra5_bit == 1){
             delay_ms(1000);
             while(ra5_bit == 1)delay_ms(100);
             portc = 0;
          }
     }
}