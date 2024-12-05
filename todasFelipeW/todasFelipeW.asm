
_main:

;todasFelipeW.c,38 :: 		void main(){
;todasFelipeW.c,40 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;todasFelipeW.c,41 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;todasFelipeW.c,42 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;todasFelipeW.c,44 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;todasFelipeW.c,46 :: 		PWM1_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;todasFelipeW.c,47 :: 		PWM1_Set_Duty(conta);
	MOVF        _conta+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;todasFelipeW.c,48 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;todasFelipeW.c,50 :: 		setupInicial();
	CALL        _setupInicial+0, 0
;todasFelipeW.c,51 :: 		contadorDisplay(conta);
	MOVF        _conta+0, 0 
	MOVWF       FARG_contadorDisplay_numero+0 
	MOVLW       0
	MOVWF       FARG_contadorDisplay_numero+1 
	CALL        _contadorDisplay+0, 0
;todasFelipeW.c,53 :: 		while(1){
L_main0:
;todasFelipeW.c,55 :: 		leituraEntradaADC();
	CALL        _leituraEntradaADC+0, 0
;todasFelipeW.c,57 :: 		if(rb0_bit == 0){
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main2
;todasFelipeW.c,58 :: 		while(rb0_bit == 0) delay_ms(100);
L_main3:
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main4
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	GOTO        L_main3
L_main4:
;todasFelipeW.c,59 :: 		clearDisplay();
	CALL        _clearDisplay+0, 0
;todasFelipeW.c,60 :: 		escreveNome();
	CALL        _escreveNome+0, 0
;todasFelipeW.c,61 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
;todasFelipeW.c,62 :: 		clearDisplay();
	CALL        _clearDisplay+0, 0
;todasFelipeW.c,63 :: 		contadorDisplay(conta);
	MOVF        _conta+0, 0 
	MOVWF       FARG_contadorDisplay_numero+0 
	MOVLW       0
	MOVWF       FARG_contadorDisplay_numero+1 
	CALL        _contadorDisplay+0, 0
;todasFelipeW.c,64 :: 		}
L_main2:
;todasFelipeW.c,66 :: 		if(rb1_bit == 0){
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main7
;todasFelipeW.c,67 :: 		while(rb1_bit == 0) delay_ms(100);
L_main8:
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main9
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
	GOTO        L_main8
L_main9:
;todasFelipeW.c,68 :: 		escreveDisplay();
	CALL        _escreveDisplay+0, 0
;todasFelipeW.c,69 :: 		contadorDisplay(conta);
	MOVF        _conta+0, 0 
	MOVWF       FARG_contadorDisplay_numero+0 
	MOVLW       0
	MOVWF       FARG_contadorDisplay_numero+1 
	CALL        _contadorDisplay+0, 0
;todasFelipeW.c,70 :: 		}
L_main7:
;todasFelipeW.c,72 :: 		if(rb2_bit == 0){
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main11
;todasFelipeW.c,73 :: 		delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	NOP
;todasFelipeW.c,74 :: 		while(rb2_bit == 0) {
L_main13:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main14
;todasFelipeW.c,75 :: 		if(conta < 255){
	MOVLW       255
	SUBWF       _conta+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main15
;todasFelipeW.c,76 :: 		conta++;
	INCF        _conta+0, 1 
;todasFelipeW.c,77 :: 		contadorDisplay(conta);
	MOVF        _conta+0, 0 
	MOVWF       FARG_contadorDisplay_numero+0 
	MOVLW       0
	MOVWF       FARG_contadorDisplay_numero+1 
	CALL        _contadorDisplay+0, 0
;todasFelipeW.c,78 :: 		PWM1_Set_Duty(conta);
	MOVF        _conta+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;todasFelipeW.c,79 :: 		}
L_main15:
;todasFelipeW.c,80 :: 		}
	GOTO        L_main13
L_main14:
;todasFelipeW.c,81 :: 		}
L_main11:
;todasFelipeW.c,83 :: 		if(rb3_bit == 0){
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main16
;todasFelipeW.c,84 :: 		delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	NOP
;todasFelipeW.c,85 :: 		while(rb3_bit == 0) {
L_main18:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main19
;todasFelipeW.c,86 :: 		if(conta > 0){
	MOVF        _conta+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main20
;todasFelipeW.c,87 :: 		conta--;
	DECF        _conta+0, 1 
;todasFelipeW.c,88 :: 		contadorDisplay(conta);
	MOVF        _conta+0, 0 
	MOVWF       FARG_contadorDisplay_numero+0 
	MOVLW       0
	MOVWF       FARG_contadorDisplay_numero+1 
	CALL        _contadorDisplay+0, 0
;todasFelipeW.c,89 :: 		PWM1_Set_Duty(conta);
	MOVF        _conta+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;todasFelipeW.c,90 :: 		}
L_main20:
;todasFelipeW.c,91 :: 		}
	GOTO        L_main18
L_main19:
;todasFelipeW.c,92 :: 		}
L_main16:
;todasFelipeW.c,94 :: 		}
	GOTO        L_main0
;todasFelipeW.c,95 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_setupInicial:

;todasFelipeW.c,97 :: 		void setupInicial()
;todasFelipeW.c,99 :: 		PORTA = 0;
	CLRF        PORTA+0 
;todasFelipeW.c,100 :: 		PORTC = 0;
	CLRF        PORTC+0 
;todasFelipeW.c,101 :: 		PORTD = 0;
	CLRF        PORTD+0 
;todasFelipeW.c,102 :: 		PORTE = 0;
	CLRF        PORTE+0 
;todasFelipeW.c,103 :: 		PORTB = 0; // desliga a porta B
	CLRF        PORTB+0 
;todasFelipeW.c,105 :: 		TRISA = 4;  // configura o porta como sa?da
	MOVLW       4
	MOVWF       TRISA+0 
;todasFelipeW.c,106 :: 		TRISB = 15; // rb0 como entrada
	MOVLW       15
	MOVWF       TRISB+0 
;todasFelipeW.c,107 :: 		TRISC = 0;  // configura o porta como sa?da
	CLRF        TRISC+0 
;todasFelipeW.c,108 :: 		TRISD = 0;  // configura o porta como sa?da
	CLRF        TRISD+0 
;todasFelipeW.c,109 :: 		TRISE = 0;  // configura o portc como sa?da.
	CLRF        TRISE+0 
;todasFelipeW.c,111 :: 		CMCON = 7;   // comparadores desligados.
	MOVLW       7
	MOVWF       CMCON+0 
;todasFelipeW.c,112 :: 		ADCON1 = 12; // todas as saidas digitais.
	MOVLW       12
	MOVWF       ADCON1+0 
;todasFelipeW.c,113 :: 		INTCON2 = 0; // liga resistor pull-up do PORTB
	CLRF        INTCON2+0 
;todasFelipeW.c,115 :: 		unidade = 3;
	MOVLW       3
	MOVWF       _unidade+0 
;todasFelipeW.c,116 :: 		dezena = 8;
	MOVLW       8
	MOVWF       _dezena+0 
;todasFelipeW.c,117 :: 		centena = 5;
	MOVLW       5
	MOVWF       _centena+0 
;todasFelipeW.c,118 :: 		milhar = 7;
	MOVLW       7
	MOVWF       _milhar+0 
;todasFelipeW.c,119 :: 		}
L_end_setupInicial:
	RETURN      0
; end of _setupInicial

_escreveNome:

;todasFelipeW.c,121 :: 		void escreveNome(numero){
;todasFelipeW.c,122 :: 		lcd_out(1, 1, txt1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;todasFelipeW.c,123 :: 		lcd_out(2, 1, txt2);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;todasFelipeW.c,124 :: 		}
L_end_escreveNome:
	RETURN      0
; end of _escreveNome

_clearDisplay:

;todasFelipeW.c,126 :: 		void clearDisplay(){
;todasFelipeW.c,127 :: 		lcd_out(1,1,"                ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_todasFelipeW+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_todasFelipeW+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;todasFelipeW.c,128 :: 		lcd_out(2,1,"                ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_todasFelipeW+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_todasFelipeW+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;todasFelipeW.c,129 :: 		}
L_end_clearDisplay:
	RETURN      0
; end of _clearDisplay

_contadorDisplay:

;todasFelipeW.c,131 :: 		void contadorDisplay(int numero){
;todasFelipeW.c,132 :: 		lcd_out(1, 1, "CONTA ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_todasFelipeW+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_todasFelipeW+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;todasFelipeW.c,133 :: 		IntToStr(numero, txt);
	MOVF        FARG_contadorDisplay_numero+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        FARG_contadorDisplay_numero+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;todasFelipeW.c,134 :: 		if(numero < 10){
	MOVLW       128
	XORWF       FARG_contadorDisplay_numero+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__contadorDisplay48
	MOVLW       10
	SUBWF       FARG_contadorDisplay_numero+0, 0 
L__contadorDisplay48:
	BTFSC       STATUS+0, 0 
	GOTO        L_contadorDisplay21
;todasFelipeW.c,135 :: 		lcd_out_cp("00");
	MOVLW       ?lstr4_todasFelipeW+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr4_todasFelipeW+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;todasFelipeW.c,136 :: 		}else if(numero < 100){
	GOTO        L_contadorDisplay22
L_contadorDisplay21:
	MOVLW       128
	XORWF       FARG_contadorDisplay_numero+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__contadorDisplay49
	MOVLW       100
	SUBWF       FARG_contadorDisplay_numero+0, 0 
L__contadorDisplay49:
	BTFSC       STATUS+0, 0 
	GOTO        L_contadorDisplay23
;todasFelipeW.c,137 :: 		lcd_out_cp("0");
	MOVLW       ?lstr5_todasFelipeW+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr5_todasFelipeW+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;todasFelipeW.c,138 :: 		}
L_contadorDisplay23:
L_contadorDisplay22:
;todasFelipeW.c,140 :: 		lcd_out_cp(ltrim(txt));
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
;todasFelipeW.c,141 :: 		lcd_out(1,11,"ASC  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_todasFelipeW+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_todasFelipeW+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;todasFelipeW.c,142 :: 		Lcd_Chr_CP(numero);
	MOVF        FARG_contadorDisplay_numero+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;todasFelipeW.c,143 :: 		}
L_end_contadorDisplay:
	RETURN      0
; end of _contadorDisplay

_leituraEntradaADC:

;todasFelipeW.c,145 :: 		void leituraEntradaADC(){
;todasFelipeW.c,146 :: 		valorMedido = adc_read(2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _valorMedido+0 
	MOVF        R1, 0 
	MOVWF       _valorMedido+1 
;todasFelipeW.c,147 :: 		IntToStr(valorMedido,txt);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;todasFelipeW.c,148 :: 		Lcd_Out(2,1,"ADC2 ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_todasFelipeW+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_todasFelipeW+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;todasFelipeW.c,149 :: 		Lcd_Out_CP(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;todasFelipeW.c,151 :: 		CustomChar(2,16);
	MOVLW       2
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       16
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
;todasFelipeW.c,152 :: 		}
L_end_leituraEntradaADC:
	RETURN      0
; end of _leituraEntradaADC

_CustomChar:

;todasFelipeW.c,154 :: 		void CustomChar(char pos_row, char pos_char) {
;todasFelipeW.c,156 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;todasFelipeW.c,157 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar24:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar25
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
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar24
L_CustomChar25:
;todasFelipeW.c,158 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;todasFelipeW.c,159 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF        FARG_CustomChar_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;todasFelipeW.c,160 :: 		}
L_end_CustomChar:
	RETURN      0
; end of _CustomChar

_escreveDisplay:

;todasFelipeW.c,163 :: 		void escreveDisplay()
;todasFelipeW.c,165 :: 		PORTB = 0; // DESLIGA TODOS OS DISPLAYS
	CLRF        PORTB+0 
;todasFelipeW.c,167 :: 		PORTD = decodifica(unidade);
	MOVF        _unidade+0, 0 
	MOVWF       FARG_decodifica_uni+0 
	CALL        _decodifica+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;todasFelipeW.c,168 :: 		RB7_bit = 1;
	BSF         RB7_bit+0, BitPos(RB7_bit+0) 
;todasFelipeW.c,169 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_escreveDisplay27:
	DECFSZ      R13, 1, 1
	BRA         L_escreveDisplay27
	DECFSZ      R12, 1, 1
	BRA         L_escreveDisplay27
	DECFSZ      R11, 1, 1
	BRA         L_escreveDisplay27
	NOP
	NOP
;todasFelipeW.c,171 :: 		RB7_bit = 0;
	BCF         RB7_bit+0, BitPos(RB7_bit+0) 
;todasFelipeW.c,172 :: 		PORTD = decodifica(dezena);
	MOVF        _dezena+0, 0 
	MOVWF       FARG_decodifica_uni+0 
	CALL        _decodifica+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;todasFelipeW.c,173 :: 		RB6_bit = 1;
	BSF         RB6_bit+0, BitPos(RB6_bit+0) 
;todasFelipeW.c,174 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_escreveDisplay28:
	DECFSZ      R13, 1, 1
	BRA         L_escreveDisplay28
	DECFSZ      R12, 1, 1
	BRA         L_escreveDisplay28
	DECFSZ      R11, 1, 1
	BRA         L_escreveDisplay28
	NOP
	NOP
;todasFelipeW.c,176 :: 		RB6_bit = 0;
	BCF         RB6_bit+0, BitPos(RB6_bit+0) 
;todasFelipeW.c,177 :: 		PORTD = decodifica(centena);
	MOVF        _centena+0, 0 
	MOVWF       FARG_decodifica_uni+0 
	CALL        _decodifica+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;todasFelipeW.c,178 :: 		RB5_bit = 1;
	BSF         RB5_bit+0, BitPos(RB5_bit+0) 
;todasFelipeW.c,179 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_escreveDisplay29:
	DECFSZ      R13, 1, 1
	BRA         L_escreveDisplay29
	DECFSZ      R12, 1, 1
	BRA         L_escreveDisplay29
	DECFSZ      R11, 1, 1
	BRA         L_escreveDisplay29
	NOP
	NOP
;todasFelipeW.c,181 :: 		RB5_bit = 0;
	BCF         RB5_bit+0, BitPos(RB5_bit+0) 
;todasFelipeW.c,182 :: 		PORTD = decodifica(milhar);
	MOVF        _milhar+0, 0 
	MOVWF       FARG_decodifica_uni+0 
	CALL        _decodifica+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;todasFelipeW.c,183 :: 		RB4_bit = 1;
	BSF         RB4_bit+0, BitPos(RB4_bit+0) 
;todasFelipeW.c,184 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_escreveDisplay30:
	DECFSZ      R13, 1, 1
	BRA         L_escreveDisplay30
	DECFSZ      R12, 1, 1
	BRA         L_escreveDisplay30
	DECFSZ      R11, 1, 1
	BRA         L_escreveDisplay30
	NOP
	NOP
;todasFelipeW.c,186 :: 		RB4_bit = 0;
	BCF         RB4_bit+0, BitPos(RB4_bit+0) 
;todasFelipeW.c,187 :: 		}
L_end_escreveDisplay:
	RETURN      0
; end of _escreveDisplay

_decodifica:

;todasFelipeW.c,188 :: 		char decodifica(char uni)
;todasFelipeW.c,190 :: 		switch (uni)
	GOTO        L_decodifica31
;todasFelipeW.c,192 :: 		case 0:
L_decodifica33:
;todasFelipeW.c,193 :: 		return 63;
	MOVLW       63
	MOVWF       R0 
	GOTO        L_end_decodifica
;todasFelipeW.c,196 :: 		case 1:
L_decodifica34:
;todasFelipeW.c,197 :: 		return 6;
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_decodifica
;todasFelipeW.c,200 :: 		case 2:
L_decodifica35:
;todasFelipeW.c,201 :: 		return 91;
	MOVLW       91
	MOVWF       R0 
	GOTO        L_end_decodifica
;todasFelipeW.c,204 :: 		case 3:
L_decodifica36:
;todasFelipeW.c,205 :: 		return 79;
	MOVLW       79
	MOVWF       R0 
	GOTO        L_end_decodifica
;todasFelipeW.c,208 :: 		case 4:
L_decodifica37:
;todasFelipeW.c,209 :: 		return 102;
	MOVLW       102
	MOVWF       R0 
	GOTO        L_end_decodifica
;todasFelipeW.c,212 :: 		case 5:
L_decodifica38:
;todasFelipeW.c,213 :: 		return 109;
	MOVLW       109
	MOVWF       R0 
	GOTO        L_end_decodifica
;todasFelipeW.c,216 :: 		case 6:
L_decodifica39:
;todasFelipeW.c,217 :: 		return 125;
	MOVLW       125
	MOVWF       R0 
	GOTO        L_end_decodifica
;todasFelipeW.c,220 :: 		case 7:
L_decodifica40:
;todasFelipeW.c,221 :: 		return 7;
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_decodifica
;todasFelipeW.c,224 :: 		case 8:
L_decodifica41:
;todasFelipeW.c,225 :: 		return 127;
	MOVLW       127
	MOVWF       R0 
	GOTO        L_end_decodifica
;todasFelipeW.c,228 :: 		case 9:
L_decodifica42:
;todasFelipeW.c,229 :: 		return 111;
	MOVLW       111
	MOVWF       R0 
	GOTO        L_end_decodifica
;todasFelipeW.c,231 :: 		}
L_decodifica31:
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica33
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica34
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica35
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica36
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica37
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica38
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica39
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica40
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica41
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica42
;todasFelipeW.c,232 :: 		}
L_end_decodifica:
	RETURN      0
; end of _decodifica