
_main:

;ProvaGBFelipeWTESTE.c,22 :: 		void main() {
;ProvaGBFelipeWTESTE.c,23 :: 		PORTA = 0;
	CLRF        PORTA+0 
;ProvaGBFelipeWTESTE.c,24 :: 		TRISA = 1;                // Configura RA como entrada
	MOVLW       1
	MOVWF       TRISA+0 
;ProvaGBFelipeWTESTE.c,25 :: 		ADCON1 = 14;              // Configura RA como portas digitais
	MOVLW       14
	MOVWF       ADCON1+0 
;ProvaGBFelipeWTESTE.c,26 :: 		CMCON = 7;                // Desabilita comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;ProvaGBFelipeWTESTE.c,27 :: 		INTCON2 = 0;
	CLRF        INTCON2+0 
;ProvaGBFelipeWTESTE.c,29 :: 		TRISB0_bit = 1;           // Configura RB0 como entrada
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;ProvaGBFelipeWTESTE.c,30 :: 		TRISB2_bit = 1;           // Configura RB2 como entrada
	BSF         TRISB2_bit+0, BitPos(TRISB2_bit+0) 
;ProvaGBFelipeWTESTE.c,32 :: 		ADC_Init();               // Inicializa ADC
	CALL        _ADC_Init+0, 0
;ProvaGBFelipeWTESTE.c,33 :: 		Lcd_Init();               // Inicializa LCD
	CALL        _Lcd_Init+0, 0
;ProvaGBFelipeWTESTE.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGBFelipeWTESTE.c,35 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGBFelipeWTESTE.c,37 :: 		previousStateRB0 = 0;     // Inicializa o estado anterior de RB0
	BCF         _previousStateRB0+0, BitPos(_previousStateRB0+0) 
;ProvaGBFelipeWTESTE.c,38 :: 		previousStateRB2 = 0;     // Inicializa o estado anterior de RB2
	BCF         _previousStateRB2+0, BitPos(_previousStateRB2+0) 
;ProvaGBFelipeWTESTE.c,40 :: 		while (1) {
L_main0:
;ProvaGBFelipeWTESTE.c,42 :: 		if (RB0_bit == 1 && previousStateRB0 == 0) {
	BTFSS       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main4
	BTFSC       _previousStateRB0+0, BitPos(_previousStateRB0+0) 
	GOTO        L_main4
L__main17:
;ProvaGBFelipeWTESTE.c,43 :: 		previousStateRB0 = 1;  // Atualiza estado anterior
	BSF         _previousStateRB0+0, BitPos(_previousStateRB0+0) 
;ProvaGBFelipeWTESTE.c,46 :: 		Lcd_Out(1, 1, "William Basso");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ProvaGBFelipeWTESTE+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ProvaGBFelipeWTESTE+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProvaGBFelipeWTESTE.c,47 :: 		Lcd_Out(2, 1, "RA 37678");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_ProvaGBFelipeWTESTE+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_ProvaGBFelipeWTESTE+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProvaGBFelipeWTESTE.c,49 :: 		Delay_ms(2000);        // Aguarda 2 segundos
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
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
;ProvaGBFelipeWTESTE.c,50 :: 		Lcd_Cmd(_LCD_CLEAR);   // Limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGBFelipeWTESTE.c,51 :: 		} else if (RB0_bit == 0) {
	GOTO        L_main6
L_main4:
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main7
;ProvaGBFelipeWTESTE.c,52 :: 		previousStateRB0 = 0;  // Atualiza estado anterior
	BCF         _previousStateRB0+0, BitPos(_previousStateRB0+0) 
;ProvaGBFelipeWTESTE.c,53 :: 		}
L_main7:
L_main6:
;ProvaGBFelipeWTESTE.c,56 :: 		if (RB2_bit == 1 && previousStateRB2 == 0) {
	BTFSS       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main10
	BTFSC       _previousStateRB2+0, BitPos(_previousStateRB2+0) 
	GOTO        L_main10
L__main16:
;ProvaGBFelipeWTESTE.c,57 :: 		Delay_ms(50);          // Debounce: Aguarda estabilização do sinal
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
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
;ProvaGBFelipeWTESTE.c,58 :: 		if (RB2_bit == 1) {    // Confirma que o botão ainda está pressionado
	BTFSS       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main12
;ProvaGBFelipeWTESTE.c,59 :: 		previousStateRB2 = 1;  // Atualiza estado anterior
	BSF         _previousStateRB2+0, BitPos(_previousStateRB2+0) 
;ProvaGBFelipeWTESTE.c,61 :: 		counter++;             // Incrementa o contador
	INCF        _counter+0, 1 
;ProvaGBFelipeWTESTE.c,62 :: 		if (counter > 255) {   // Garante que o contador não ultrapasse 255
	MOVF        _counter+0, 0 
	SUBLW       255
	BTFSC       STATUS+0, 0 
	GOTO        L_main13
;ProvaGBFelipeWTESTE.c,63 :: 		counter = 0;
	CLRF        _counter+0 
;ProvaGBFelipeWTESTE.c,64 :: 		}
L_main13:
;ProvaGBFelipeWTESTE.c,67 :: 		ByteToStr(counter, txt);
	MOVF        _counter+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;ProvaGBFelipeWTESTE.c,68 :: 		Lcd_Cmd(_LCD_CLEAR);   // Limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGBFelipeWTESTE.c,69 :: 		Lcd_Out(1, 1, "Conta ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_ProvaGBFelipeWTESTE+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_ProvaGBFelipeWTESTE+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProvaGBFelipeWTESTE.c,70 :: 		Lcd_Out_Cp(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;ProvaGBFelipeWTESTE.c,71 :: 		}
L_main12:
;ProvaGBFelipeWTESTE.c,72 :: 		} else if (RB2_bit == 0) {
	GOTO        L_main14
L_main10:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main15
;ProvaGBFelipeWTESTE.c,73 :: 		previousStateRB2 = 0;  // Atualiza estado anterior
	BCF         _previousStateRB2+0, BitPos(_previousStateRB2+0) 
;ProvaGBFelipeWTESTE.c,74 :: 		}
L_main15:
L_main14:
;ProvaGBFelipeWTESTE.c,75 :: 		}
	GOTO        L_main0
;ProvaGBFelipeWTESTE.c,76 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
