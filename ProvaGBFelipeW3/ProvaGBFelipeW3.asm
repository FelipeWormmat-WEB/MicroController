
_displayNumber:

;ProvaGBFelipeW3.c,38 :: 		void displayNumber(unsigned char digit, unsigned char position) {
;ProvaGBFelipeW3.c,39 :: 		PORTD = segment_codes[digit]; // Envia o código do dígito para os segmentos
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
;ProvaGBFelipeW3.c,40 :: 		switch (position) {
	GOTO        L_displayNumber0
;ProvaGBFelipeW3.c,41 :: 		case 1: RB7_bit = 1; break; // Unidade de milhar
L_displayNumber2:
	BSF         RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_displayNumber1
;ProvaGBFelipeW3.c,42 :: 		case 2: RB6_bit = 1; break; // Centena
L_displayNumber3:
	BSF         RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_displayNumber1
;ProvaGBFelipeW3.c,43 :: 		case 3: RB5_bit = 1; break; // Dezena
L_displayNumber4:
	BSF         RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L_displayNumber1
;ProvaGBFelipeW3.c,44 :: 		case 4: RB4_bit = 1; break; // Unidade
L_displayNumber5:
	BSF         RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L_displayNumber1
;ProvaGBFelipeW3.c,45 :: 		}
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
;ProvaGBFelipeW3.c,46 :: 		Delay_ms(200); // Breve atraso para estabilizar a exibição
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
;ProvaGBFelipeW3.c,47 :: 		RB7_bit = RB6_bit = RB5_bit = RB4_bit = 0; // Desliga os displays
	BCF         RB4_bit+0, BitPos(RB4_bit+0) 
	BTFSC       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L__displayNumber35
	BCF         RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__displayNumber36
L__displayNumber35:
	BSF         RB5_bit+0, BitPos(RB5_bit+0) 
L__displayNumber36:
	BTFSC       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__displayNumber37
	BCF         RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__displayNumber38
L__displayNumber37:
	BSF         RB6_bit+0, BitPos(RB6_bit+0) 
L__displayNumber38:
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__displayNumber39
	BCF         RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L__displayNumber40
L__displayNumber39:
	BSF         RB7_bit+0, BitPos(RB7_bit+0) 
L__displayNumber40:
;ProvaGBFelipeW3.c,48 :: 		}
L_end_displayNumber:
	RETURN      0
; end of _displayNumber

_main:

;ProvaGBFelipeW3.c,50 :: 		void main() {
;ProvaGBFelipeW3.c,51 :: 		previousStateRB0 = 0;
	BCF         _previousStateRB0+0, BitPos(_previousStateRB0+0) 
;ProvaGBFelipeW3.c,52 :: 		previousStateRB1 = 0;
	BCF         _previousStateRB1+0, BitPos(_previousStateRB1+0) 
;ProvaGBFelipeW3.c,53 :: 		previousStateRB2 = 0;
	BCF         _previousStateRB2+0, BitPos(_previousStateRB2+0) 
;ProvaGBFelipeW3.c,56 :: 		PORTA = 0;
	CLRF        PORTA+0 
;ProvaGBFelipeW3.c,57 :: 		TRISA = 1;          // Configura RA como entrada
	MOVLW       1
	MOVWF       TRISA+0 
;ProvaGBFelipeW3.c,58 :: 		ADCON1 = 14;        // Configura RA como portas digitais
	MOVLW       14
	MOVWF       ADCON1+0 
;ProvaGBFelipeW3.c,59 :: 		CMCON = 7;          // Desabilita comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;ProvaGBFelipeW3.c,60 :: 		INTCON2 = 0;
	CLRF        INTCON2+0 
;ProvaGBFelipeW3.c,62 :: 		TRISB0_bit = 1;     // Configura RB0 como entrada
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;ProvaGBFelipeW3.c,63 :: 		TRISB1_bit = 1;     // Configura RB1 como entrada
	BSF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;ProvaGBFelipeW3.c,64 :: 		TRISB2_bit = 1;     // Configura RB2 como entrada
	BSF         TRISB2_bit+0, BitPos(TRISB2_bit+0) 
;ProvaGBFelipeW3.c,66 :: 		TRISD = 0;          // Configura PORTD como saída
	CLRF        TRISD+0 
;ProvaGBFelipeW3.c,67 :: 		TRISB4_bit = 0;     // Configura RB4 (unidade) como saída
	BCF         TRISB4_bit+0, BitPos(TRISB4_bit+0) 
;ProvaGBFelipeW3.c,68 :: 		TRISB5_bit = 0;     // Configura RB5 (dezena) como saída
	BCF         TRISB5_bit+0, BitPos(TRISB5_bit+0) 
;ProvaGBFelipeW3.c,69 :: 		TRISB6_bit = 0;     // Configura RB6 (centena) como saída
	BCF         TRISB6_bit+0, BitPos(TRISB6_bit+0) 
;ProvaGBFelipeW3.c,70 :: 		TRISB7_bit = 0;     // Configura RB7 (milhar) como saída
	BCF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;ProvaGBFelipeW3.c,72 :: 		ADC_Init();         // Inicializa ADC
	CALL        _ADC_Init+0, 0
;ProvaGBFelipeW3.c,73 :: 		Lcd_Init();         // Inicializa LCD
	CALL        _Lcd_Init+0, 0
;ProvaGBFelipeW3.c,74 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGBFelipeW3.c,75 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGBFelipeW3.c,77 :: 		while (1) {
L_main7:
;ProvaGBFelipeW3.c,79 :: 		if (RB0_bit == 1 && previousStateRB0 == 0) {
	BTFSS       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main11
	BTFSC       _previousStateRB0+0, BitPos(_previousStateRB0+0) 
	GOTO        L_main11
L__main33:
;ProvaGBFelipeW3.c,80 :: 		previousStateRB0 = 1;
	BSF         _previousStateRB0+0, BitPos(_previousStateRB0+0) 
;ProvaGBFelipeW3.c,82 :: 		Lcd_Out(1, 1, "Felipe Wormmat");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ProvaGBFelipeW3+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ProvaGBFelipeW3+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProvaGBFelipeW3.c,83 :: 		Lcd_Out(2, 1, "RA 38579");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_ProvaGBFelipeW3+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_ProvaGBFelipeW3+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProvaGBFelipeW3.c,85 :: 		Delay_ms(2000);    // Aguarda 2 segundos
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
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
;ProvaGBFelipeW3.c,86 :: 		Lcd_Cmd(_LCD_CLEAR);  // Limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGBFelipeW3.c,87 :: 		} else if (RB0_bit == 0) {
	GOTO        L_main13
L_main11:
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main14
;ProvaGBFelipeW3.c,88 :: 		previousStateRB0 = 0;
	BCF         _previousStateRB0+0, BitPos(_previousStateRB0+0) 
;ProvaGBFelipeW3.c,89 :: 		}
L_main14:
L_main13:
;ProvaGBFelipeW3.c,92 :: 		if (RB1_bit == 1 && previousStateRB1 == 0) {
	BTFSS       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main17
	BTFSC       _previousStateRB1+0, BitPos(_previousStateRB1+0) 
	GOTO        L_main17
L__main32:
;ProvaGBFelipeW3.c,93 :: 		previousStateRB1 = 1;
	BSF         _previousStateRB1+0, BitPos(_previousStateRB1+0) 
;ProvaGBFelipeW3.c,95 :: 		displayNumber(3, 1); // Milhar
	MOVLW       3
	MOVWF       FARG_displayNumber_digit+0 
	MOVLW       1
	MOVWF       FARG_displayNumber_position+0 
	CALL        _displayNumber+0, 0
;ProvaGBFelipeW3.c,96 :: 		displayNumber(8, 2); // Centena
	MOVLW       8
	MOVWF       FARG_displayNumber_digit+0 
	MOVLW       2
	MOVWF       FARG_displayNumber_position+0 
	CALL        _displayNumber+0, 0
;ProvaGBFelipeW3.c,97 :: 		displayNumber(5, 3); // Dezena
	MOVLW       5
	MOVWF       FARG_displayNumber_digit+0 
	MOVLW       3
	MOVWF       FARG_displayNumber_position+0 
	CALL        _displayNumber+0, 0
;ProvaGBFelipeW3.c,98 :: 		displayNumber(7, 4); // Unidade
	MOVLW       7
	MOVWF       FARG_displayNumber_digit+0 
	MOVLW       4
	MOVWF       FARG_displayNumber_position+0 
	CALL        _displayNumber+0, 0
;ProvaGBFelipeW3.c,100 :: 		Delay_ms(200); // Pequeno atraso para evitar múltiplas detecções
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
;ProvaGBFelipeW3.c,101 :: 		} else if (RB1_bit == 0) {
	GOTO        L_main19
L_main17:
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main20
;ProvaGBFelipeW3.c,102 :: 		previousStateRB1 = 0;
	BCF         _previousStateRB1+0, BitPos(_previousStateRB1+0) 
;ProvaGBFelipeW3.c,103 :: 		}
L_main20:
L_main19:
;ProvaGBFelipeW3.c,106 :: 		if (RB2_bit == 1 && previousStateRB2 == 0) {
	BTFSS       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main23
	BTFSC       _previousStateRB2+0, BitPos(_previousStateRB2+0) 
	GOTO        L_main23
L__main31:
;ProvaGBFelipeW3.c,107 :: 		Delay_ms(50);          // Debounce
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main24:
	DECFSZ      R13, 1, 1
	BRA         L_main24
	DECFSZ      R12, 1, 1
	BRA         L_main24
	DECFSZ      R11, 1, 1
	BRA         L_main24
	NOP
	NOP
;ProvaGBFelipeW3.c,108 :: 		if (RB2_bit == 1) {    // Confirma botão pressionado
	BTFSS       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main25
;ProvaGBFelipeW3.c,109 :: 		previousStateRB2 = 1;
	BSF         _previousStateRB2+0, BitPos(_previousStateRB2+0) 
;ProvaGBFelipeW3.c,111 :: 		if (rb2Ativo == 1) counter++;
	MOVLW       0
	XORWF       _rb2Ativo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main42
	MOVLW       1
	XORWF       _rb2Ativo+0, 0 
L__main42:
	BTFSS       STATUS+0, 2 
	GOTO        L_main26
	INCF        _counter+0, 1 
L_main26:
;ProvaGBFelipeW3.c,112 :: 		if (counter > 255) counter = 0;
	MOVF        _counter+0, 0 
	SUBLW       255
	BTFSC       STATUS+0, 0 
	GOTO        L_main27
	CLRF        _counter+0 
L_main27:
;ProvaGBFelipeW3.c,114 :: 		if (rb2Ativo == 1) {
	MOVLW       0
	XORWF       _rb2Ativo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main43
	MOVLW       1
	XORWF       _rb2Ativo+0, 0 
L__main43:
	BTFSS       STATUS+0, 2 
	GOTO        L_main28
;ProvaGBFelipeW3.c,115 :: 		ByteToStr(counter, txt); // Converte contador para string
	MOVF        _counter+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;ProvaGBFelipeW3.c,116 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGBFelipeW3.c,117 :: 		Lcd_Out(1, 1, "Conta ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_ProvaGBFelipeW3+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_ProvaGBFelipeW3+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProvaGBFelipeW3.c,118 :: 		Lcd_Out_Cp(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;ProvaGBFelipeW3.c,119 :: 		}
L_main28:
;ProvaGBFelipeW3.c,120 :: 		}
L_main25:
;ProvaGBFelipeW3.c,121 :: 		} else if (RB2_bit == 0) {
	GOTO        L_main29
L_main23:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main30
;ProvaGBFelipeW3.c,122 :: 		rb2Ativo = 1;
	MOVLW       1
	MOVWF       _rb2Ativo+0 
	MOVLW       0
	MOVWF       _rb2Ativo+1 
;ProvaGBFelipeW3.c,123 :: 		previousStateRB2 = 0;
	BCF         _previousStateRB2+0, BitPos(_previousStateRB2+0) 
;ProvaGBFelipeW3.c,124 :: 		}
L_main30:
L_main29:
;ProvaGBFelipeW3.c,125 :: 		}
	GOTO        L_main7
;ProvaGBFelipeW3.c,126 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
