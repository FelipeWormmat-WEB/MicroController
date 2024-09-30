
_main:

;leituraChaves.c,1 :: 		void main() {
;leituraChaves.c,2 :: 		porta = 0; // Desliga a porta
	CLRF        PORTA+0 
;leituraChaves.c,3 :: 		trisa = 48; // Configura RA4 3 RA5 como entrada
	MOVLW       48
	MOVWF       TRISA+0 
;leituraChaves.c,4 :: 		portc = 0; // Desliga o portc
	CLRF        PORTC+0 
;leituraChaves.c,5 :: 		trisc = 0; // Configura portc como saida
	CLRF        TRISC+0 
;leituraChaves.c,6 :: 		cmcon = 7; // Comparadores desligados
	MOVLW       7
	MOVWF       CMCON+0 
;leituraChaves.c,7 :: 		adcon1 = 15; // Todas as saidas
	MOVLW       15
	MOVWF       ADCON1+0 
;leituraChaves.c,8 :: 		while(1){
L_main0:
;leituraChaves.c,9 :: 		if(ra4_bit == 1){
	BTFSS       RA4_bit+0, BitPos(RA4_bit+0) 
	GOTO        L_main2
;leituraChaves.c,10 :: 		while(ra4_bit == 1)delay_ms(100);
L_main3:
	BTFSS       RA4_bit+0, BitPos(RA4_bit+0) 
	GOTO        L_main4
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
	GOTO        L_main3
L_main4:
;leituraChaves.c,12 :: 		portc = 4;// liga apenas RC2
	MOVLW       4
	MOVWF       PORTC+0 
;leituraChaves.c,13 :: 		}
L_main2:
;leituraChaves.c,14 :: 		if(ra5_bit == 1){
	BTFSS       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L_main6
;leituraChaves.c,15 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;leituraChaves.c,16 :: 		while(ra5_bit == 1)delay_ms(100);
L_main8:
	BTFSS       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L_main9
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
	NOP
	GOTO        L_main8
L_main9:
;leituraChaves.c,17 :: 		portc = 0;
	CLRF        PORTC+0 
;leituraChaves.c,18 :: 		}
L_main6:
;leituraChaves.c,19 :: 		}
	GOTO        L_main0
;leituraChaves.c,20 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
