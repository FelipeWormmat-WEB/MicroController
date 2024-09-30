
_main:

;conversorAd.c,19 :: 		void main() {
;conversorAd.c,20 :: 		porta = 0;//desliga porta
	CLRF        PORTA+0 
;conversorAd.c,21 :: 		trisa = 1;//apenas RA0
	MOVLW       1
	MOVWF       TRISA+0 
;conversorAd.c,22 :: 		adcon1 = 14;// configura como portas digitais
	MOVLW       14
	MOVWF       ADCON1+0 
;conversorAd.c,23 :: 		cmcon = 7;//Desliga comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;conversorAd.c,24 :: 		intcon2 = 0;// Liga resistor
	CLRF        INTCON2+0 
;conversorAd.c,25 :: 		adc_init();//inicializa o AD
	CALL        _ADC_Init+0, 0
;conversorAd.c,26 :: 		lcd_init();//inicializa o lcd
	CALL        _Lcd_Init+0, 0
;conversorAd.c,27 :: 		lcd_cmd(_LCD_CURSOR_OFF);//apaga
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;conversorAd.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);//limpa
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;conversorAd.c,29 :: 		while(1){
L_main0:
;conversorAd.c,30 :: 		valor = adc_read(0); // Le a entrada RA0
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _valor+0 
	MOVF        R1, 0 
	MOVWF       _valor+1 
;conversorAd.c,31 :: 		resposta = (valor * 0.4901) + 0.3937;
	CALL        _int2double+0, 0
	MOVLW       99
	MOVWF       R4 
	MOVLW       238
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       12
	MOVWF       R4 
	MOVLW       147
	MOVWF       R5 
	MOVLW       73
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _resposta+0 
	MOVF        R1, 0 
	MOVWF       _resposta+1 
;conversorAd.c,32 :: 		inttostr(resposta,txt);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;conversorAd.c,33 :: 		lcd_out(1,1," Papo = ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_conversorAd+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_conversorAd+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;conversorAd.c,34 :: 		lcd_out_cp(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;conversorAd.c,35 :: 		}
	GOTO        L_main0
;conversorAd.c,36 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
