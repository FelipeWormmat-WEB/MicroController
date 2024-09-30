void main() {
    portc = 0;
    trisc = 0;
    adcon1= 15;
    cmcon= 7;
    
    while(1){
        portc = 0;
        delay_ms(500);
        portc = 1;
        delay_ms(500);
        portc = 9;
        delay_ms(500);
        portc = 11;
        delay_ms(500);
        portc = 15;
        delay_ms(500);
        portc = 14;
        delay_ms(500);
        portc = 6;
        delay_ms(500);
        portc = 4;
        delay_ms(500);
    }
}