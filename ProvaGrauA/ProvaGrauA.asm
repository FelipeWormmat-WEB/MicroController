
_main:

;ProvaGrauA.c,20 :: 		void main() {
;ProvaGrauA.c,21 :: 		porta = 0;
	CLRF        PORTA+0 
;ProvaGrauA.c,22 :: 		trisa = 1;
	MOVLW       1
	MOVWF       TRISA+0 
;ProvaGrauA.c,23 :: 		adcon1 = 14;
	MOVLW       14
	MOVWF       ADCON1+0 
;ProvaGrauA.c,24 :: 		cmcon = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;ProvaGrauA.c,25 :: 		intcon2 = 0;
	CLRF        INTCON2+0 
;ProvaGrauA.c,27 :: 		adc_init();
	CALL        _ADC_Init+0, 0
;ProvaGrauA.c,28 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;ProvaGrauA.c,29 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGrauA.c,30 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGrauA.c,32 :: 		while(1) {
L_main0:
;ProvaGrauA.c,33 :: 		if(rb2_bit == 0) {
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main2
;ProvaGrauA.c,34 :: 		while(rb2_bit == 0) {
L_main3:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main4
;ProvaGrauA.c,35 :: 		delay_ms(100);
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
;ProvaGrauA.c,36 :: 		value = adc_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _value+0 
	MOVF        R1, 0 
	MOVWF       _value+1 
;ProvaGrauA.c,38 :: 		lcd_out(1, 1, "Felipe Wormmat");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ProvaGrauA+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ProvaGrauA+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProvaGrauA.c,39 :: 		lcd_out(2, 1, "38579");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_ProvaGrauA+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_ProvaGrauA+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProvaGrauA.c,40 :: 		}
	GOTO        L_main3
L_main4:
;ProvaGrauA.c,41 :: 		}
L_main2:
;ProvaGrauA.c,42 :: 		}
	GOTO        L_main0
;ProvaGrauA.c,43 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
