
_main:

;mediaPonderada.c,29 :: 		void main()
;mediaPonderada.c,32 :: 		setupInicial();
	CALL        _setupInicial+0, 0
;mediaPonderada.c,33 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;mediaPonderada.c,34 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;mediaPonderada.c,35 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;mediaPonderada.c,37 :: 		while(1)
L_main0:
;mediaPonderada.c,39 :: 		valorLido = adc_read(0); // faz a leitura em RA0
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _valorLido+0 
	MOVF        R1, 0 
	MOVWF       _valorLido+1 
;mediaPonderada.c,41 :: 		soma = soma + valorLido;
	MOVF        R0, 0 
	ADDWF       _soma+0, 1 
	MOVF        R1, 0 
	ADDWFC      _soma+1, 1 
	MOVLW       0
	BTFSC       R1, 7 
	MOVLW       255
	ADDWFC      _soma+2, 1 
	ADDWFC      _soma+3, 1 
;mediaPonderada.c,42 :: 		contaMedidas++;
	INFSNZ      _contaMedidas+0, 1 
	INCF        _contaMedidas+1, 1 
;mediaPonderada.c,44 :: 		if(contaMedidas >= 500)
	MOVLW       128
	XORWF       _contaMedidas+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main4
	MOVLW       244
	SUBWF       _contaMedidas+0, 0 
L__main4:
	BTFSS       STATUS+0, 0 
	GOTO        L_main2
;mediaPonderada.c,46 :: 		media = soma / contaMedidas;
	MOVF        _contaMedidas+0, 0 
	MOVWF       R4 
	MOVF        _contaMedidas+1, 0 
	MOVWF       R5 
	MOVLW       0
	BTFSC       _contaMedidas+1, 7 
	MOVLW       255
	MOVWF       R6 
	MOVWF       R7 
	MOVF        _soma+0, 0 
	MOVWF       R0 
	MOVF        _soma+1, 0 
	MOVWF       R1 
	MOVF        _soma+2, 0 
	MOVWF       R2 
	MOVF        _soma+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       _media+0 
	MOVF        R1, 0 
	MOVWF       _media+1 
;mediaPonderada.c,47 :: 		soma = 0;
	CLRF        _soma+0 
	CLRF        _soma+1 
	CLRF        _soma+2 
	CLRF        _soma+3 
;mediaPonderada.c,48 :: 		contaMedidas = 0;
	CLRF        _contaMedidas+0 
	CLRF        _contaMedidas+1 
;mediaPonderada.c,54 :: 		f0=f1;
	MOVF        _f1+0, 0 
	MOVWF       _f0+0 
	MOVF        _f1+1, 0 
	MOVWF       _f0+1 
;mediaPonderada.c,55 :: 		f1=f2;
	MOVF        _f2+0, 0 
	MOVWF       _f1+0 
	MOVF        _f2+1, 0 
	MOVWF       _f1+1 
;mediaPonderada.c,56 :: 		f2=f3;
	MOVF        _f3+0, 0 
	MOVWF       _f2+0 
	MOVF        _f3+1, 0 
	MOVWF       _f2+1 
;mediaPonderada.c,57 :: 		f3=f4;
	MOVF        _f4+0, 0 
	MOVWF       _f3+0 
	MOVF        _f4+1, 0 
	MOVWF       _f3+1 
;mediaPonderada.c,58 :: 		f4=f5;
	MOVF        _f5+0, 0 
	MOVWF       _f4+0 
	MOVF        _f5+1, 0 
	MOVWF       _f4+1 
;mediaPonderada.c,59 :: 		f5=f6;
	MOVF        _f6+0, 0 
	MOVWF       _f5+0 
	MOVF        _f6+1, 0 
	MOVWF       _f5+1 
;mediaPonderada.c,60 :: 		f6=f7;
	MOVF        _f7+0, 0 
	MOVWF       _f6+0 
	MOVF        _f7+1, 0 
	MOVWF       _f6+1 
;mediaPonderada.c,61 :: 		f7=f8;
	MOVF        _f8+0, 0 
	MOVWF       _f7+0 
	MOVF        _f8+1, 0 
	MOVWF       _f7+1 
;mediaPonderada.c,62 :: 		f8=f9;
	MOVF        _f9+0, 0 
	MOVWF       _f8+0 
	MOVF        _f9+1, 0 
	MOVWF       _f8+1 
;mediaPonderada.c,63 :: 		f9=media;
	MOVF        R0, 0 
	MOVWF       _f9+0 
	MOVF        R1, 0 
	MOVWF       _f9+1 
;mediaPonderada.c,64 :: 		fir=(f0+f1+f2+f3+f4+f5+f6+f7+f8+f9)/10;
	MOVF        _f1+0, 0 
	ADDWF       _f0+0, 0 
	MOVWF       R4 
	MOVF        _f1+1, 0 
	ADDWFC      _f0+1, 0 
	MOVWF       R5 
	MOVF        _f2+0, 0 
	ADDWF       R4, 1 
	MOVF        _f2+1, 0 
	ADDWFC      R5, 1 
	MOVF        _f3+0, 0 
	ADDWF       R4, 1 
	MOVF        _f3+1, 0 
	ADDWFC      R5, 1 
	MOVF        _f4+0, 0 
	ADDWF       R4, 1 
	MOVF        _f4+1, 0 
	ADDWFC      R5, 1 
	MOVF        _f5+0, 0 
	ADDWF       R4, 1 
	MOVF        _f5+1, 0 
	ADDWFC      R5, 1 
	MOVF        _f6+0, 0 
	ADDWF       R4, 1 
	MOVF        _f6+1, 0 
	ADDWFC      R5, 1 
	MOVF        _f7+0, 0 
	ADDWF       R4, 1 
	MOVF        _f7+1, 0 
	ADDWFC      R5, 1 
	MOVF        _f8+0, 0 
	ADDWF       R4, 1 
	MOVF        _f8+1, 0 
	ADDWFC      R5, 1 
	MOVF        R4, 0 
	ADDWF       R0, 1 
	MOVF        R5, 0 
	ADDWFC      R1, 1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       _fir+0 
	MOVF        R1, 0 
	MOVWF       _fir+1 
;mediaPonderada.c,70 :: 		ponderada = ((ponderada * 8) + (fir * 2)) / 10;
	MOVLW       3
	MOVWF       R2 
	MOVF        _ponderada+0, 0 
	MOVWF       R5 
	MOVF        _ponderada+1, 0 
	MOVWF       R6 
	MOVF        R2, 0 
L__main5:
	BZ          L__main6
	RLCF        R5, 1 
	BCF         R5, 0 
	RLCF        R6, 1 
	ADDLW       255
	GOTO        L__main5
L__main6:
	MOVF        R0, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	MOVWF       R3 
	RLCF        R2, 1 
	BCF         R2, 0 
	RLCF        R3, 1 
	MOVF        R2, 0 
	ADDWF       R5, 0 
	MOVWF       R0 
	MOVF        R3, 0 
	ADDWFC      R6, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       _ponderada+0 
	MOVF        R1, 0 
	MOVWF       _ponderada+1 
;mediaPonderada.c,72 :: 		inttostr(ponderada,txt);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;mediaPonderada.c,73 :: 		lcd_out(1,1,"Temperatura: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_mediaPonderada+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_mediaPonderada+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;mediaPonderada.c,74 :: 		lcd_Out_CP(ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;mediaPonderada.c,75 :: 		}
L_main2:
;mediaPonderada.c,80 :: 		}
	GOTO        L_main0
;mediaPonderada.c,81 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_setupInicial:

;mediaPonderada.c,83 :: 		void setupInicial()
;mediaPonderada.c,85 :: 		porta = 0;
	CLRF        PORTA+0 
;mediaPonderada.c,86 :: 		portb = 0;
	CLRF        PORTB+0 
;mediaPonderada.c,87 :: 		portc = 0;
	CLRF        PORTC+0 
;mediaPonderada.c,88 :: 		portd = 0;
	CLRF        PORTD+0 
;mediaPonderada.c,89 :: 		porte = 0;
	CLRF        PORTE+0 
;mediaPonderada.c,91 :: 		trisa = 1; // ra0 entrada analogica
	MOVLW       1
	MOVWF       TRISA+0 
;mediaPonderada.c,92 :: 		trisb = 15;
	MOVLW       15
	MOVWF       TRISB+0 
;mediaPonderada.c,93 :: 		trisc = 0; // tudo como saída
	CLRF        TRISC+0 
;mediaPonderada.c,94 :: 		trisd = 0; // tudo como saída
	CLRF        TRISD+0 
;mediaPonderada.c,95 :: 		trise = 0; // tudo como saída
	CLRF        TRISE+0 
;mediaPonderada.c,97 :: 		adcon1 = 14; // Apenas ra0 como entrada analogica
	MOVLW       14
	MOVWF       ADCON1+0 
;mediaPonderada.c,98 :: 		cmcon = 7;   // desliga os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;mediaPonderada.c,99 :: 		intcon2 = 0; // liga resistor pull up do portb
	CLRF        INTCON2+0 
;mediaPonderada.c,101 :: 		ADC_Init(); // inicializa o conversor ad
	CALL        _ADC_Init+0, 0
;mediaPonderada.c,102 :: 		}
L_end_setupInicial:
	RETURN      0
; end of _setupInicial
