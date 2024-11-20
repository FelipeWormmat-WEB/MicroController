
_CustomChar:

;Termometro_LCD.c,32 :: 		void CustomChar(char pos_row, char pos_char) {
;Termometro_LCD.c,34 :: 		Lcd_Cmd(64); // Manda para a posição da memória CGRAM
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Termometro_LCD.c,35 :: 		for (i = 0; i <= 7; i++) {
	CLRF        CustomChar_i_L0+0 
L_CustomChar0:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar1
;Termometro_LCD.c,36 :: 		Lcd_Chr_CP(character[i]); // Carrega o caractere na memória
	MOVLW       _character+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(_character+0)
	MOVWF       TBLPTR+1 
	MOVLW       0
	ADDWFC      TBLPTR+1, 1 
	MOVLW       higher_addr(_character+0)
	MOVWF       TBLPTR+2 
	MOVLW       0
	ADDWFC      TBLPTR+2, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
;Termometro_LCD.c,35 :: 		for (i = 0; i <= 7; i++) {
	INCF        CustomChar_i_L0+0, 1 
;Termometro_LCD.c,37 :: 		}
	GOTO        L_CustomChar0
L_CustomChar1:
;Termometro_LCD.c,38 :: 		Lcd_Cmd(_LCD_RETURN_HOME); // Volta para o cursor inicial
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Termometro_LCD.c,39 :: 		Lcd_Chr(pos_row, pos_char, 0); // Exibe o caractere na posição especificada
	MOVF        FARG_CustomChar_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Termometro_LCD.c,40 :: 		}
L_end_CustomChar:
	RETURN      0
; end of _CustomChar

_main:

;Termometro_LCD.c,42 :: 		void main() {
;Termometro_LCD.c,43 :: 		setupInicial();
	CALL        _setupInicial+0, 0
;Termometro_LCD.c,44 :: 		conta = FLASH_Read(0x7f00);
	MOVLW       0
	MOVWF       FARG_FLASH_Read_address+0 
	MOVLW       127
	MOVWF       FARG_FLASH_Read_address+1 
	MOVLW       0
	MOVWF       FARG_FLASH_Read_address+2 
	MOVWF       FARG_FLASH_Read_address+3 
	CALL        _FLASH_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _conta+0 
	MOVLW       0
	MOVWF       _conta+1 
;Termometro_LCD.c,46 :: 		adc_init();
	CALL        _ADC_Init+0, 0
;Termometro_LCD.c,48 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Termometro_LCD.c,49 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Termometro_LCD.c,50 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Termometro_LCD.c,52 :: 		while(1){
L_main3:
;Termometro_LCD.c,54 :: 		somaMedia = somaMedia + adc_read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	ADDWF       _somaMedia+0, 1 
	MOVF        R1, 0 
	ADDWFC      _somaMedia+1, 1 
	MOVLW       0
	ADDWFC      _somaMedia+2, 1 
	ADDWFC      _somaMedia+3, 1 
;Termometro_LCD.c,55 :: 		contaMedidas++;
	INFSNZ      _contaMedidas+0, 1 
	INCF        _contaMedidas+1, 1 
;Termometro_LCD.c,57 :: 		if(contaMedidas >= 100){
	MOVLW       128
	XORWF       _contaMedidas+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main22
	MOVLW       100
	SUBWF       _contaMedidas+0, 0 
L__main22:
	BTFSS       STATUS+0, 0 
	GOTO        L_main5
;Termometro_LCD.c,58 :: 		valorMedio = somaMedia / contaMedidas;
	MOVF        _contaMedidas+0, 0 
	MOVWF       R4 
	MOVF        _contaMedidas+1, 0 
	MOVWF       R5 
	MOVLW       0
	BTFSC       _contaMedidas+1, 7 
	MOVLW       255
	MOVWF       R6 
	MOVWF       R7 
	MOVF        _somaMedia+0, 0 
	MOVWF       R0 
	MOVF        _somaMedia+1, 0 
	MOVWF       R1 
	MOVF        _somaMedia+2, 0 
	MOVWF       R2 
	MOVF        _somaMedia+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       _valorMedio+0 
	MOVF        R1, 0 
	MOVWF       _valorMedio+1 
;Termometro_LCD.c,59 :: 		contaMedidas = 0;
	CLRF        _contaMedidas+0 
	CLRF        _contaMedidas+1 
;Termometro_LCD.c,60 :: 		somaMedia = 0;
	CLRF        _somaMedia+0 
	CLRF        _somaMedia+1 
	CLRF        _somaMedia+2 
	CLRF        _somaMedia+3 
;Termometro_LCD.c,61 :: 		IntToStr(valorMedio,txt);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Termometro_LCD.c,62 :: 		Lcd_Out(2,1,"ADC0=");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Termometro_LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Termometro_LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Termometro_LCD.c,63 :: 		Lcd_Out_CP(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Termometro_LCD.c,64 :: 		}
L_main5:
;Termometro_LCD.c,72 :: 		if(rb0_bit ==0 ){
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main6
;Termometro_LCD.c,73 :: 		while(rb0_bit ==0) Delay_ms(100);
L_main7:
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main8
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	NOP
	GOTO        L_main7
L_main8:
;Termometro_LCD.c,74 :: 		conta++;
	INFSNZ      _conta+0, 1 
	INCF        _conta+1, 1 
;Termometro_LCD.c,75 :: 		vetor[0] = conta;
	MOVF        _conta+0, 0 
	MOVWF       _vetor+0 
	MOVF        _conta+1, 0 
	MOVWF       _vetor+1 
;Termometro_LCD.c,76 :: 		FLASH_Erase_Write_64(0x7f00,vetor);
	MOVLW       0
	MOVWF       FARG_FLASH_Erase_Write_64_address+0 
	MOVLW       127
	MOVWF       FARG_FLASH_Erase_Write_64_address+1 
	MOVLW       0
	MOVWF       FARG_FLASH_Erase_Write_64_address+2 
	MOVWF       FARG_FLASH_Erase_Write_64_address+3 
	MOVLW       _vetor+0
	MOVWF       FARG_FLASH_Erase_Write_64_data_+0 
	MOVLW       hi_addr(_vetor+0)
	MOVWF       FARG_FLASH_Erase_Write_64_data_+1 
	CALL        _FLASH_Erase_Write_64+0, 0
;Termometro_LCD.c,77 :: 		}
L_main6:
;Termometro_LCD.c,78 :: 		if(rb1_bit ==0 ){
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main10
;Termometro_LCD.c,79 :: 		while(rb1_bit ==0) Delay_ms(100);
L_main11:
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main12
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
	NOP
	NOP
	GOTO        L_main11
L_main12:
;Termometro_LCD.c,80 :: 		conta--;
	MOVLW       1
	SUBWF       _conta+0, 1 
	MOVLW       0
	SUBWFB      _conta+1, 1 
;Termometro_LCD.c,81 :: 		vetor[0] = conta;
	MOVF        _conta+0, 0 
	MOVWF       _vetor+0 
	MOVF        _conta+1, 0 
	MOVWF       _vetor+1 
;Termometro_LCD.c,82 :: 		FLASH_Erase_Write_64(0x7f00,vetor);
	MOVLW       0
	MOVWF       FARG_FLASH_Erase_Write_64_address+0 
	MOVLW       127
	MOVWF       FARG_FLASH_Erase_Write_64_address+1 
	MOVLW       0
	MOVWF       FARG_FLASH_Erase_Write_64_address+2 
	MOVWF       FARG_FLASH_Erase_Write_64_address+3 
	MOVLW       _vetor+0
	MOVWF       FARG_FLASH_Erase_Write_64_data_+0 
	MOVLW       hi_addr(_vetor+0)
	MOVWF       FARG_FLASH_Erase_Write_64_data_+1 
	CALL        _FLASH_Erase_Write_64+0, 0
;Termometro_LCD.c,83 :: 		}
L_main10:
;Termometro_LCD.c,84 :: 		if(rb2_bit ==0 ){
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main14
;Termometro_LCD.c,85 :: 		while(rb2_bit ==0) Delay_ms(100);
L_main15:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main16
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
	NOP
	NOP
	GOTO        L_main15
L_main16:
;Termometro_LCD.c,87 :: 		conta = 0;
	CLRF        _conta+0 
	CLRF        _conta+1 
;Termometro_LCD.c,88 :: 		vetor[0]= conta;
	CLRF        _vetor+0 
	CLRF        _vetor+1 
;Termometro_LCD.c,89 :: 		FLASH_Erase_Write_64(0x7f00,vetor);
	MOVLW       0
	MOVWF       FARG_FLASH_Erase_Write_64_address+0 
	MOVLW       127
	MOVWF       FARG_FLASH_Erase_Write_64_address+1 
	MOVLW       0
	MOVWF       FARG_FLASH_Erase_Write_64_address+2 
	MOVWF       FARG_FLASH_Erase_Write_64_address+3 
	MOVLW       _vetor+0
	MOVWF       FARG_FLASH_Erase_Write_64_data_+0 
	MOVLW       hi_addr(_vetor+0)
	MOVWF       FARG_FLASH_Erase_Write_64_data_+1 
	CALL        _FLASH_Erase_Write_64+0, 0
;Termometro_LCD.c,90 :: 		}
L_main14:
;Termometro_LCD.c,91 :: 		lcd_out(1,1,"Conta=");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Termometro_LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Termometro_LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Termometro_LCD.c,92 :: 		IntToStr(conta,txt);
	MOVF        _conta+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _conta+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Termometro_LCD.c,93 :: 		Lcd_Out_CP(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Termometro_LCD.c,94 :: 		lcd_out(2,1,"Temp=");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Termometro_LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Termometro_LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Termometro_LCD.c,95 :: 		inttostr(valorMedio,txt);
	MOVF        _valorMedio+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _valorMedio+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Termometro_LCD.c,96 :: 		lcd_out_cp(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Termometro_LCD.c,97 :: 		CustomChar(2,15);
	MOVLW       2
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       15
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
;Termometro_LCD.c,98 :: 		lcd_out_cp("C");
	MOVLW       ?lstr4_Termometro_LCD+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr4_Termometro_LCD+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Termometro_LCD.c,99 :: 		if(valorMedio > conta){
	MOVLW       128
	XORWF       _conta+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _valorMedio+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main23
	MOVF        _valorMedio+0, 0 
	SUBWF       _conta+0, 0 
L__main23:
	BTFSC       STATUS+0, 0 
	GOTO        L_main18
;Termometro_LCD.c,100 :: 		rc0_bit = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;Termometro_LCD.c,101 :: 		}else{
	GOTO        L_main19
L_main18:
;Termometro_LCD.c,102 :: 		rc0_bit = 0;
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;Termometro_LCD.c,103 :: 		}
L_main19:
;Termometro_LCD.c,104 :: 		}
	GOTO        L_main3
;Termometro_LCD.c,105 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_setupInicial:

;Termometro_LCD.c,107 :: 		void setupInicial(){
;Termometro_LCD.c,108 :: 		PORTA = 0;
	CLRF        PORTA+0 
;Termometro_LCD.c,109 :: 		PORTB = 0;
	CLRF        PORTB+0 
;Termometro_LCD.c,110 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Termometro_LCD.c,111 :: 		PORTD = 0;
	CLRF        PORTD+0 
;Termometro_LCD.c,112 :: 		PORTE = 0;
	CLRF        PORTE+0 
;Termometro_LCD.c,114 :: 		TRISA = 1;
	MOVLW       1
	MOVWF       TRISA+0 
;Termometro_LCD.c,115 :: 		TRISB = 15;
	MOVLW       15
	MOVWF       TRISB+0 
;Termometro_LCD.c,116 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Termometro_LCD.c,117 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Termometro_LCD.c,118 :: 		TRISE = 0;
	CLRF        TRISE+0 
;Termometro_LCD.c,120 :: 		CMCON = 7; //comparadores desligados
	MOVLW       7
	MOVWF       CMCON+0 
;Termometro_LCD.c,121 :: 		ADCON1 = 14; //todas as entradas digitais
	MOVLW       14
	MOVWF       ADCON1+0 
;Termometro_LCD.c,122 :: 		INTCON2 = 0; //liga os resistores pull up no portb
	CLRF        INTCON2+0 
;Termometro_LCD.c,123 :: 		}
L_end_setupInicial:
	RETURN      0
; end of _setupInicial
