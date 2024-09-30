
_main:

;ledPisca.c,1 :: 		void main() {
;ledPisca.c,2 :: 		portc = 0;
	CLRF        PORTC+0 
;ledPisca.c,3 :: 		trisc = 0;
	CLRF        TRISC+0 
;ledPisca.c,4 :: 		adcon1= 15;
	MOVLW       15
	MOVWF       ADCON1+0 
;ledPisca.c,5 :: 		cmcon= 7;
	MOVLW       7
	MOVWF       CMCON+0 
;ledPisca.c,7 :: 		while(1){
L_main0:
;ledPisca.c,8 :: 		portc = 0;
	CLRF        PORTC+0 
;ledPisca.c,9 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;ledPisca.c,10 :: 		portc = 1;
	MOVLW       1
	MOVWF       PORTC+0 
;ledPisca.c,11 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;ledPisca.c,12 :: 		portc = 9;
	MOVLW       9
	MOVWF       PORTC+0 
;ledPisca.c,13 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
;ledPisca.c,14 :: 		portc = 11;
	MOVLW       11
	MOVWF       PORTC+0 
;ledPisca.c,15 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;ledPisca.c,16 :: 		portc = 15;
	MOVLW       15
	MOVWF       PORTC+0 
;ledPisca.c,17 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
;ledPisca.c,18 :: 		portc = 14;
	MOVLW       14
	MOVWF       PORTC+0 
;ledPisca.c,19 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;ledPisca.c,20 :: 		portc = 6;
	MOVLW       6
	MOVWF       PORTC+0 
;ledPisca.c,21 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
;ledPisca.c,22 :: 		portc = 4;
	MOVLW       4
	MOVWF       PORTC+0 
;ledPisca.c,23 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
;ledPisca.c,24 :: 		}
	GOTO        L_main0
;ledPisca.c,25 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
