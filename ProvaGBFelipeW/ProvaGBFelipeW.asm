
_main:

;ProvaGBFelipeW.c,21 :: 		void main() {
;ProvaGBFelipeW.c,22 :: 		previousState = 0;  // Inicializa o valor do bit no início do programa
	BCF         _previousState+0, BitPos(_previousState+0) 
;ProvaGBFelipeW.c,24 :: 		PORTA = 0;
	CLRF        PORTA+0 
;ProvaGBFelipeW.c,25 :: 		TRISA = 1;          // Configura RA como entrada
	MOVLW       1
	MOVWF       TRISA+0 
;ProvaGBFelipeW.c,26 :: 		ADCON1 = 14;        // Configura RA como portas digitais
	MOVLW       14
	MOVWF       ADCON1+0 
;ProvaGBFelipeW.c,27 :: 		CMCON = 7;          // Desabilita comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;ProvaGBFelipeW.c,28 :: 		INTCON2 = 0;
	CLRF        INTCON2+0 
;ProvaGBFelipeW.c,30 :: 		TRISB0_bit = 1;     // Configura RB0 como entrada
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;ProvaGBFelipeW.c,32 :: 		ADC_Init();         // Inicializa ADC
	CALL        _ADC_Init+0, 0
;ProvaGBFelipeW.c,33 :: 		Lcd_Init();         // Inicializa LCD
	CALL        _Lcd_Init+0, 0
;ProvaGBFelipeW.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGBFelipeW.c,35 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGBFelipeW.c,37 :: 		while (1) {
L_main0:
;ProvaGBFelipeW.c,38 :: 		if (RB0_bit == 1 && previousState == 0) {  // Detecção de borda de subida
	BTFSS       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main4
	BTFSC       _previousState+0, BitPos(_previousState+0) 
	GOTO        L_main4
L__main8:
;ProvaGBFelipeW.c,39 :: 		previousState = 1;  // Atualiza estado anterior
	BSF         _previousState+0, BitPos(_previousState+0) 
;ProvaGBFelipeW.c,42 :: 		Lcd_Out(1, 1, "Felipe Wormmat");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ProvaGBFelipeW+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ProvaGBFelipeW+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProvaGBFelipeW.c,43 :: 		Lcd_Out(2, 1, "RA 38579");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_ProvaGBFelipeW+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_ProvaGBFelipeW+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProvaGBFelipeW.c,45 :: 		Delay_ms(200);    // Aguarda 2 segundos
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
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
;ProvaGBFelipeW.c,47 :: 		Lcd_Cmd(_LCD_CLEAR);  // Limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGBFelipeW.c,48 :: 		} else if (RB0_bit == 0) {
	GOTO        L_main6
L_main4:
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main7
;ProvaGBFelipeW.c,49 :: 		previousState = 0;  // Atualiza estado anterior
	BCF         _previousState+0, BitPos(_previousState+0) 
;ProvaGBFelipeW.c,50 :: 		}
L_main7:
L_main6:
;ProvaGBFelipeW.c,51 :: 		}
	GOTO        L_main0
;ProvaGBFelipeW.c,52 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
