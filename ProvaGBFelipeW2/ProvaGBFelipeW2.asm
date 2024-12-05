
_displayNumber:

;ProvaGBFelipeW2.c,35 :: 		void displayNumber(unsigned char digit, unsigned char position) {
;ProvaGBFelipeW2.c,36 :: 		PORTD = segment_codes[digit]; // Envia o código do dígito para os segmentos
	MOVLW       _segment_codes+0
	ADDWF       FARG_displayNumber_digit+0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(_segment_codes+0)
	MOVWF       TBLPTR+1 
	MOVLW       0
	ADDWFC      TBLPTR+1, 1 
	MOVLW       higher_addr(_segment_codes+0)
	MOVWF       TBLPTR+2 
	MOVLW       0
	ADDWFC      TBLPTR+2, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTD+0
;ProvaGBFelipeW2.c,37 :: 		switch (position) {
	GOTO        L_displayNumber0
;ProvaGBFelipeW2.c,38 :: 		case 1: RB7_bit = 1; break; // Unidade de milhar
L_displayNumber2:
	BSF         RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_displayNumber1
;ProvaGBFelipeW2.c,39 :: 		case 2: RB6_bit = 1; break; // Centena
L_displayNumber3:
	BSF         RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_displayNumber1
;ProvaGBFelipeW2.c,40 :: 		case 3: RB5_bit = 1; break; // Dezena
L_displayNumber4:
	BSF         RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L_displayNumber1
;ProvaGBFelipeW2.c,41 :: 		case 4: RB4_bit = 1; break; // Unidade
L_displayNumber5:
	BSF         RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L_displayNumber1
;ProvaGBFelipeW2.c,42 :: 		}
L_displayNumber0:
	MOVF        FARG_displayNumber_position+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_displayNumber2
	MOVF        FARG_displayNumber_position+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_displayNumber3
	MOVF        FARG_displayNumber_position+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_displayNumber4
	MOVF        FARG_displayNumber_position+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_displayNumber5
L_displayNumber1:
;ProvaGBFelipeW2.c,43 :: 		Delay_ms(200); // Breve atraso para estabilizar a exibição
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_displayNumber6:
	DECFSZ      R13, 1, 1
	BRA         L_displayNumber6
	DECFSZ      R12, 1, 1
	BRA         L_displayNumber6
	DECFSZ      R11, 1, 1
	BRA         L_displayNumber6
	NOP
	NOP
;ProvaGBFelipeW2.c,44 :: 		RB7_bit = RB6_bit = RB5_bit = RB4_bit = 0; // Desliga os displays
	BCF         RB4_bit+0, BitPos(RB4_bit+0) 
	BTFSC       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L__displayNumber24
	BCF         RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__displayNumber25
L__displayNumber24:
	BSF         RB5_bit+0, BitPos(RB5_bit+0) 
L__displayNumber25:
	BTFSC       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__displayNumber26
	BCF         RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__displayNumber27
L__displayNumber26:
	BSF         RB6_bit+0, BitPos(RB6_bit+0) 
L__displayNumber27:
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__displayNumber28
	BCF         RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L__displayNumber29
L__displayNumber28:
	BSF         RB7_bit+0, BitPos(RB7_bit+0) 
L__displayNumber29:
;ProvaGBFelipeW2.c,45 :: 		}
L_end_displayNumber:
	RETURN      0
; end of _displayNumber

_main:

;ProvaGBFelipeW2.c,47 :: 		void main() {
;ProvaGBFelipeW2.c,48 :: 		previousStateRB0 = 0; // Inicializa estados anteriores
	BCF         _previousStateRB0+0, BitPos(_previousStateRB0+0) 
;ProvaGBFelipeW2.c,49 :: 		previousStateRB1 = 0;
	BCF         _previousStateRB1+0, BitPos(_previousStateRB1+0) 
;ProvaGBFelipeW2.c,52 :: 		PORTA = 0;
	CLRF        PORTA+0 
;ProvaGBFelipeW2.c,53 :: 		TRISA = 1;          // Configura RA como entrada
	MOVLW       1
	MOVWF       TRISA+0 
;ProvaGBFelipeW2.c,54 :: 		ADCON1 = 14;        // Configura RA como portas digitais
	MOVLW       14
	MOVWF       ADCON1+0 
;ProvaGBFelipeW2.c,55 :: 		CMCON = 7;          // Desabilita comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;ProvaGBFelipeW2.c,56 :: 		INTCON2 = 0;
	CLRF        INTCON2+0 
;ProvaGBFelipeW2.c,58 :: 		TRISB0_bit = 1;     // Configura RB0 como entrada
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;ProvaGBFelipeW2.c,59 :: 		TRISB1_bit = 1;     // Configura RB1 como entrada
	BSF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;ProvaGBFelipeW2.c,61 :: 		TRISD = 0;          // Configura PORTD como saída
	CLRF        TRISD+0 
;ProvaGBFelipeW2.c,62 :: 		TRISB4_bit = 0;     // Configura RB4 (unidade) como saída
	BCF         TRISB4_bit+0, BitPos(TRISB4_bit+0) 
;ProvaGBFelipeW2.c,63 :: 		TRISB5_bit = 0;     // Configura RB5 (dezena) como saída
	BCF         TRISB5_bit+0, BitPos(TRISB5_bit+0) 
;ProvaGBFelipeW2.c,64 :: 		TRISB6_bit = 0;     // Configura RB6 (centena) como saída
	BCF         TRISB6_bit+0, BitPos(TRISB6_bit+0) 
;ProvaGBFelipeW2.c,65 :: 		TRISB7_bit = 0;     // Configura RB7 (milhar) como saída
	BCF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;ProvaGBFelipeW2.c,67 :: 		ADC_Init();         // Inicializa ADC
	CALL        _ADC_Init+0, 0
;ProvaGBFelipeW2.c,68 :: 		Lcd_Init();         // Inicializa LCD
	CALL        _Lcd_Init+0, 0
;ProvaGBFelipeW2.c,69 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGBFelipeW2.c,70 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGBFelipeW2.c,72 :: 		while (1) {
L_main7:
;ProvaGBFelipeW2.c,74 :: 		if (RB0_bit == 1 && previousStateRB0 == 0) {
	BTFSS       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main11
	BTFSC       _previousStateRB0+0, BitPos(_previousStateRB0+0) 
	GOTO        L_main11
L__main22:
;ProvaGBFelipeW2.c,75 :: 		previousStateRB0 = 1;
	BSF         _previousStateRB0+0, BitPos(_previousStateRB0+0) 
;ProvaGBFelipeW2.c,78 :: 		Lcd_Out(1, 1, "Felipe Wormmat");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ProvaGBFelipeW2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ProvaGBFelipeW2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProvaGBFelipeW2.c,79 :: 		Lcd_Out(2, 1, "RA 38579");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_ProvaGBFelipeW2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_ProvaGBFelipeW2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProvaGBFelipeW2.c,81 :: 		Delay_ms(200);    // Aguarda 2 segundos
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
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
;ProvaGBFelipeW2.c,82 :: 		} else if (RB0_bit == 0) {
	GOTO        L_main13
L_main11:
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main14
;ProvaGBFelipeW2.c,83 :: 		previousStateRB0 = 0;
	BCF         _previousStateRB0+0, BitPos(_previousStateRB0+0) 
;ProvaGBFelipeW2.c,84 :: 		}
L_main14:
L_main13:
;ProvaGBFelipeW2.c,87 :: 		if (RB1_bit == 1 && previousStateRB1 == 0) {
	BTFSS       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main17
	BTFSC       _previousStateRB1+0, BitPos(_previousStateRB1+0) 
	GOTO        L_main17
L__main21:
;ProvaGBFelipeW2.c,88 :: 		previousStateRB1 = 1;
	BSF         _previousStateRB1+0, BitPos(_previousStateRB1+0) 
;ProvaGBFelipeW2.c,91 :: 		displayNumber(3, 1); // Milhar
	MOVLW       3
	MOVWF       FARG_displayNumber_digit+0 
	MOVLW       1
	MOVWF       FARG_displayNumber_position+0 
	CALL        _displayNumber+0, 0
;ProvaGBFelipeW2.c,92 :: 		displayNumber(8, 2); // Centena
	MOVLW       8
	MOVWF       FARG_displayNumber_digit+0 
	MOVLW       2
	MOVWF       FARG_displayNumber_position+0 
	CALL        _displayNumber+0, 0
;ProvaGBFelipeW2.c,93 :: 		displayNumber(5, 3); // Dezena
	MOVLW       5
	MOVWF       FARG_displayNumber_digit+0 
	MOVLW       3
	MOVWF       FARG_displayNumber_position+0 
	CALL        _displayNumber+0, 0
;ProvaGBFelipeW2.c,94 :: 		displayNumber(7, 4); // Unidade
	MOVLW       7
	MOVWF       FARG_displayNumber_digit+0 
	MOVLW       4
	MOVWF       FARG_displayNumber_position+0 
	CALL        _displayNumber+0, 0
;ProvaGBFelipeW2.c,96 :: 		Delay_ms(200); // Pequeno atraso para evitar múltiplas detecções
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	DECFSZ      R11, 1, 1
	BRA         L_main18
	NOP
	NOP
;ProvaGBFelipeW2.c,97 :: 		} else if (RB1_bit == 0) {
	GOTO        L_main19
L_main17:
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main20
;ProvaGBFelipeW2.c,98 :: 		previousStateRB1 = 0;
	BCF         _previousStateRB1+0, BitPos(_previousStateRB1+0) 
;ProvaGBFelipeW2.c,99 :: 		}
L_main20:
L_main19:
;ProvaGBFelipeW2.c,100 :: 		}
	GOTO        L_main7
;ProvaGBFelipeW2.c,101 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
