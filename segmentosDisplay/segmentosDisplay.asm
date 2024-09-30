
_main:

;segmentosDisplay.c,1 :: 		void main() {
;segmentosDisplay.c,2 :: 		porta = 0; // Desliga a porta
	CLRF        PORTA+0 
;segmentosDisplay.c,3 :: 		trisa = 0; // Configura RA4 3 RA5 como entrada
	CLRF        TRISA+0 
;segmentosDisplay.c,4 :: 		portc = 0; // Desliga o portc
	CLRF        PORTC+0 
;segmentosDisplay.c,5 :: 		trisc = 0; // Configura portc como saida
	CLRF        TRISC+0 
;segmentosDisplay.c,6 :: 		cmcon = 7; // Comparadores desligados
	MOVLW       7
	MOVWF       CMCON+0 
;segmentosDisplay.c,7 :: 		adcon1 = 15; // Todas as saidas
	MOVLW       15
	MOVWF       ADCON1+0 
;segmentosDisplay.c,8 :: 		porte = 0;
	CLRF        PORTE+0 
;segmentosDisplay.c,9 :: 		trise = 0;
	CLRF        TRISE+0 
;segmentosDisplay.c,10 :: 		portd = 0;
	CLRF        PORTD+0 
;segmentosDisplay.c,11 :: 		trisd = 0;
	CLRF        TRISD+0 
;segmentosDisplay.c,13 :: 		while(1){
L_main0:
;segmentosDisplay.c,14 :: 		portd = 1; // Liga o segmento a
	MOVLW       1
	MOVWF       PORTD+0 
;segmentosDisplay.c,15 :: 		rc5_bit = 1; // Liga o display
	BSF         RC5_bit+0, BitPos(RC5_bit+0) 
;segmentosDisplay.c,16 :: 		rc4_bit = 0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;segmentosDisplay.c,17 :: 		re2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;segmentosDisplay.c,18 :: 		ra3_bit = 0;
	BCF         RA3_bit+0, BitPos(RA3_bit+0) 
;segmentosDisplay.c,19 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;segmentosDisplay.c,21 :: 		rc5_bit = 0;
	BCF         RC5_bit+0, BitPos(RC5_bit+0) 
;segmentosDisplay.c,22 :: 		rc4_bit = 1;
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
;segmentosDisplay.c,23 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;segmentosDisplay.c,25 :: 		rc4_bit = 0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;segmentosDisplay.c,26 :: 		re2_bit = 1;
	BSF         RE2_bit+0, BitPos(RE2_bit+0) 
;segmentosDisplay.c,27 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;segmentosDisplay.c,29 :: 		re2_bit = 0; // Liga o display
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;segmentosDisplay.c,30 :: 		rA3_bit = 1;
	BSF         RA3_bit+0, BitPos(RA3_bit+0) 
;segmentosDisplay.c,31 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
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
;segmentosDisplay.c,33 :: 		portd = 2;
	MOVLW       2
	MOVWF       PORTD+0 
;segmentosDisplay.c,34 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;segmentosDisplay.c,36 :: 		portd = 4;
	MOVLW       4
	MOVWF       PORTD+0 
;segmentosDisplay.c,37 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
	NOP
;segmentosDisplay.c,39 :: 		portd = 8;
	MOVLW       8
	MOVWF       PORTD+0 
;segmentosDisplay.c,40 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
	NOP
;segmentosDisplay.c,42 :: 		portd = 16;
	MOVLW       16
	MOVWF       PORTD+0 
;segmentosDisplay.c,43 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	NOP
;segmentosDisplay.c,45 :: 		portd = 32;
	MOVLW       32
	MOVWF       PORTD+0 
;segmentosDisplay.c,46 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
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
;segmentosDisplay.c,48 :: 		portd = 64;
	MOVLW       64
	MOVWF       PORTD+0 
;segmentosDisplay.c,49 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
	NOP
;segmentosDisplay.c,51 :: 		portd = 128;
	MOVLW       128
	MOVWF       PORTD+0 
;segmentosDisplay.c,52 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
	NOP
;segmentosDisplay.c,53 :: 		}
	GOTO        L_main0
;segmentosDisplay.c,54 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
