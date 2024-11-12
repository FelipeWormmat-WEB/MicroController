
_main:

;conversorAdDuplo.c,28 :: 		void main() {
;conversorAdDuplo.c,29 :: 		setup_inicial();
	CALL        _setup_inicial+0, 0
;conversorAdDuplo.c,30 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;conversorAdDuplo.c,31 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;conversorAdDuplo.c,32 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;conversorAdDuplo.c,33 :: 		lcd_out(1,1, " AD");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_conversorAdDuplo+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_conversorAdDuplo+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;conversorAdDuplo.c,34 :: 		lcd_out(2,1, " Tudojunto");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_conversorAdDuplo+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_conversorAdDuplo+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;conversorAdDuplo.c,35 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;conversorAdDuplo.c,36 :: 		adc_init();
	CALL        _ADC_Init+0, 0
;conversorAdDuplo.c,37 :: 		while(1){
L_main1:
;conversorAdDuplo.c,39 :: 		soma1 = soma1 + adc_read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	ADDWF       _soma1+0, 1 
	MOVF        R1, 0 
	ADDWFC      _soma1+1, 1 
	MOVLW       0
	ADDWFC      _soma1+2, 1 
	ADDWFC      _soma1+3, 1 
;conversorAdDuplo.c,40 :: 		soma2 = soma2 + adc_read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	ADDWF       _soma2+0, 1 
	MOVF        R1, 0 
	ADDWFC      _soma2+1, 1 
	MOVLW       0
	ADDWFC      _soma2+2, 1 
	ADDWFC      _soma2+3, 1 
;conversorAdDuplo.c,41 :: 		conta ++;
	INFSNZ      _conta+0, 1 
	INCF        _conta+1, 1 
;conversorAdDuplo.c,42 :: 		if(conta == 500){
	MOVF        _conta+1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main5
	MOVLW       244
	XORWF       _conta+0, 0 
L__main5:
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;conversorAdDuplo.c,43 :: 		valor1 = soma1/ conta;
	MOVF        _conta+0, 0 
	MOVWF       R4 
	MOVF        _conta+1, 0 
	MOVWF       R5 
	MOVLW       0
	BTFSC       _conta+1, 7 
	MOVLW       255
	MOVWF       R6 
	MOVWF       R7 
	MOVF        _soma1+0, 0 
	MOVWF       R0 
	MOVF        _soma1+1, 0 
	MOVWF       R1 
	MOVF        _soma1+2, 0 
	MOVWF       R2 
	MOVF        _soma1+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       _valor1+0 
	MOVF        R1, 0 
	MOVWF       _valor1+1 
;conversorAdDuplo.c,44 :: 		resposta1 = (valor1 * 2 + resposta1 * 8)/10;
	MOVF        R0, 0 
	MOVWF       R5 
	MOVF        R1, 0 
	MOVWF       R6 
	RLCF        R5, 1 
	BCF         R5, 0 
	RLCF        R6, 1 
	MOVLW       3
	MOVWF       R2 
	MOVF        _resposta1+0, 0 
	MOVWF       R0 
	MOVF        _resposta1+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__main6:
	BZ          L__main7
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__main6
L__main7:
	MOVF        R5, 0 
	ADDWF       R0, 1 
	MOVF        R6, 0 
	ADDWFC      R1, 1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       _resposta1+0 
	MOVF        R1, 0 
	MOVWF       _resposta1+1 
;conversorAdDuplo.c,45 :: 		resposta1 = resposta1 / 2.038;
	CALL        _int2double+0, 0
	MOVLW       152
	MOVWF       R4 
	MOVLW       110
	MOVWF       R5 
	MOVLW       2
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       _resposta1+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       _resposta1+1 
;conversorAdDuplo.c,46 :: 		valor2 = soma2/ conta;
	MOVF        _conta+0, 0 
	MOVWF       R4 
	MOVF        _conta+1, 0 
	MOVWF       R5 
	MOVLW       0
	BTFSC       _conta+1, 7 
	MOVLW       255
	MOVWF       R6 
	MOVWF       R7 
	MOVF        _soma2+0, 0 
	MOVWF       R0 
	MOVF        _soma2+1, 0 
	MOVWF       R1 
	MOVF        _soma2+2, 0 
	MOVWF       R2 
	MOVF        _soma2+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       _valor2+0 
	MOVF        R1, 0 
	MOVWF       _valor2+1 
;conversorAdDuplo.c,47 :: 		resposta2 = (valor2 * 2 + resposta2 *8)/10;
	MOVF        R0, 0 
	MOVWF       R5 
	MOVF        R1, 0 
	MOVWF       R6 
	RLCF        R5, 1 
	BCF         R5, 0 
	RLCF        R6, 1 
	MOVLW       3
	MOVWF       R2 
	MOVF        _resposta2+0, 0 
	MOVWF       R0 
	MOVF        _resposta2+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__main8:
	BZ          L__main9
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__main8
L__main9:
	MOVF        R5, 0 
	ADDWF       R0, 1 
	MOVF        R6, 0 
	ADDWFC      R1, 1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       _resposta2+0 
	MOVF        R1, 0 
	MOVWF       _resposta2+1 
;conversorAdDuplo.c,48 :: 		soma1 = 0;
	CLRF        _soma1+0 
	CLRF        _soma1+1 
	CLRF        _soma1+2 
	CLRF        _soma1+3 
;conversorAdDuplo.c,49 :: 		soma2 = 0;
	CLRF        _soma2+0 
	CLRF        _soma2+1 
	CLRF        _soma2+2 
	CLRF        _soma2+3 
;conversorAdDuplo.c,50 :: 		conta = 0;
	CLRF        _conta+0 
	CLRF        _conta+1 
;conversorAdDuplo.c,51 :: 		inttostr(resposta1,txt);
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;conversorAdDuplo.c,52 :: 		lcd_out(1,1,"Resposta1=");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_conversorAdDuplo+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_conversorAdDuplo+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;conversorAdDuplo.c,53 :: 		lcd_out_cp(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;conversorAdDuplo.c,56 :: 		inttostr(resposta2,txt);
	MOVF        _resposta2+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _resposta2+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;conversorAdDuplo.c,57 :: 		lcd_out(2,1,"Resposta2=");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_conversorAdDuplo+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_conversorAdDuplo+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;conversorAdDuplo.c,58 :: 		lcd_out_cp(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;conversorAdDuplo.c,59 :: 		}
L_main3:
;conversorAdDuplo.c,60 :: 		}
	GOTO        L_main1
;conversorAdDuplo.c,61 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_setup_inicial:

;conversorAdDuplo.c,62 :: 		void setup_inicial(){
;conversorAdDuplo.c,63 :: 		porta = 0;
	CLRF        PORTA+0 
;conversorAdDuplo.c,64 :: 		portb = 0;
	CLRF        PORTB+0 
;conversorAdDuplo.c,65 :: 		portc = 0;
	CLRF        PORTC+0 
;conversorAdDuplo.c,66 :: 		portd = 0;
	CLRF        PORTD+0 
;conversorAdDuplo.c,67 :: 		porte = 0;
	CLRF        PORTE+0 
;conversorAdDuplo.c,68 :: 		trisa = 3;  //RA0,RA1 como entradas
	MOVLW       3
	MOVWF       TRISA+0 
;conversorAdDuplo.c,69 :: 		trisb = 0;
	CLRF        TRISB+0 
;conversorAdDuplo.c,70 :: 		trisc = 0;
	CLRF        TRISC+0 
;conversorAdDuplo.c,71 :: 		trisd = 0;
	CLRF        TRISD+0 
;conversorAdDuplo.c,72 :: 		trise = 0;
	CLRF        TRISE+0 
;conversorAdDuplo.c,73 :: 		adcon1 = 13; //Configura como portas digitais
	MOVLW       13
	MOVWF       ADCON1+0 
;conversorAdDuplo.c,74 :: 		cmcon = 7;   //desliga os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;conversorAdDuplo.c,75 :: 		intcon2 = 0; //liga resistor pull up do portb
	CLRF        INTCON2+0 
;conversorAdDuplo.c,76 :: 		ADC_init();// inicia o conversor ad
	CALL        _ADC_Init+0, 0
;conversorAdDuplo.c,77 :: 		}
L_end_setup_inicial:
	RETURN      0
; end of _setup_inicial
