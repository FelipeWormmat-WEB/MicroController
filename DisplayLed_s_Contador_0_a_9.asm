
_main:

;DisplayLed_s_Contador_0_a_9.c,1 :: 		void main() {
;DisplayLed_s_Contador_0_a_9.c,2 :: 		portd = 0; // Desliga o portd
	CLRF        PORTD+0 
;DisplayLed_s_Contador_0_a_9.c,3 :: 		trisd = 0; // Configura o portd como saída
	CLRF        TRISD+0 
;DisplayLed_s_Contador_0_a_9.c,4 :: 		adcon1 = 15; // Saídas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;DisplayLed_s_Contador_0_a_9.c,5 :: 		cmcon = 7; // Comparadores desligados
	MOVLW       7
	MOVWF       CMCON+0 
;DisplayLed_s_Contador_0_a_9.c,7 :: 		porta = 0; // Desliga porta
	CLRF        PORTA+0 
;DisplayLed_s_Contador_0_a_9.c,8 :: 		trisa = 0; // Configura porta como saída
	CLRF        TRISA+0 
;DisplayLed_s_Contador_0_a_9.c,9 :: 		RA3_bit = 1; // Liga display de unidade
	BSF         RA3_bit+0, BitPos(RA3_bit+0) 
;DisplayLed_s_Contador_0_a_9.c,11 :: 		while(1){
L_main0:
;DisplayLed_s_Contador_0_a_9.c,12 :: 		portd = 63; // Código do zero
	MOVLW       63
	MOVWF       PORTD+0 
;DisplayLed_s_Contador_0_a_9.c,13 :: 		delay_ms(500);
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
;DisplayLed_s_Contador_0_a_9.c,14 :: 		portd = 6; // Código do um
	MOVLW       6
	MOVWF       PORTD+0 
;DisplayLed_s_Contador_0_a_9.c,15 :: 		delay_ms(500);
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
;DisplayLed_s_Contador_0_a_9.c,16 :: 		portd = 91;
	MOVLW       91
	MOVWF       PORTD+0 
;DisplayLed_s_Contador_0_a_9.c,17 :: 		delay_ms(500);
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
;DisplayLed_s_Contador_0_a_9.c,18 :: 		portd = 79;
	MOVLW       79
	MOVWF       PORTD+0 
;DisplayLed_s_Contador_0_a_9.c,19 :: 		delay_ms(500);
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
;DisplayLed_s_Contador_0_a_9.c,20 :: 		portd = 102;
	MOVLW       102
	MOVWF       PORTD+0 
;DisplayLed_s_Contador_0_a_9.c,21 :: 		delay_ms(500);
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
;DisplayLed_s_Contador_0_a_9.c,22 :: 		portd = 109;
	MOVLW       109
	MOVWF       PORTD+0 
;DisplayLed_s_Contador_0_a_9.c,23 :: 		delay_ms(500);
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
;DisplayLed_s_Contador_0_a_9.c,24 :: 		portd = 125;
	MOVLW       125
	MOVWF       PORTD+0 
;DisplayLed_s_Contador_0_a_9.c,25 :: 		delay_ms(500);
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
;DisplayLed_s_Contador_0_a_9.c,26 :: 		portd = 7;
	MOVLW       7
	MOVWF       PORTD+0 
;DisplayLed_s_Contador_0_a_9.c,27 :: 		delay_ms(500);
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
;DisplayLed_s_Contador_0_a_9.c,28 :: 		portd = 127;
	MOVLW       127
	MOVWF       PORTD+0 
;DisplayLed_s_Contador_0_a_9.c,29 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
;DisplayLed_s_Contador_0_a_9.c,30 :: 		portd = 111;
	MOVLW       111
	MOVWF       PORTD+0 
;DisplayLed_s_Contador_0_a_9.c,31 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
;DisplayLed_s_Contador_0_a_9.c,33 :: 		}
	GOTO        L_main0
;DisplayLed_s_Contador_0_a_9.c,34 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
