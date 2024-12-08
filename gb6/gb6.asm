
_CreateCustomChar:

;gb6.c,25 :: 		void CreateCustomChar() {
;gb6.c,27 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;gb6.c,28 :: 		for (i = 0; i < 8; i++) {
	CLRF        CreateCustomChar_i_L0+0 
L_CreateCustomChar0:
	MOVLW       8
	SUBWF       CreateCustomChar_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_CreateCustomChar1
;gb6.c,29 :: 		Lcd_Chr_Cp(customChar[i]);
	MOVLW       _customChar+0
	ADDWF       CreateCustomChar_i_L0+0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(_customChar+0)
	MOVWF       TBLPTR+1 
	MOVLW       0
	ADDWFC      TBLPTR+1, 1 
	MOVLW       higher_addr(_customChar+0)
	MOVWF       TBLPTR+2 
	MOVLW       0
	ADDWFC      TBLPTR+2, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
;gb6.c,28 :: 		for (i = 0; i < 8; i++) {
	INCF        CreateCustomChar_i_L0+0, 1 
;gb6.c,30 :: 		}
	GOTO        L_CreateCustomChar0
L_CreateCustomChar1:
;gb6.c,31 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;gb6.c,32 :: 		}
L_end_CreateCustomChar:
	RETURN      0
; end of _CreateCustomChar

_displayNumber:

;gb6.c,53 :: 		void displayNumber(unsigned char digit, unsigned char position) {
;gb6.c,54 :: 		PORTD = segment_codes[digit];
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
;gb6.c,55 :: 		switch (position) {
	GOTO        L_displayNumber3
;gb6.c,56 :: 		case 1: RB7_bit = 1; break;
L_displayNumber5:
	BSF         RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_displayNumber4
;gb6.c,57 :: 		case 2: RB6_bit = 1; break;
L_displayNumber6:
	BSF         RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_displayNumber4
;gb6.c,58 :: 		case 3: RB5_bit = 1; break;
L_displayNumber7:
	BSF         RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L_displayNumber4
;gb6.c,59 :: 		case 4: RB4_bit = 1; break;
L_displayNumber8:
	BSF         RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L_displayNumber4
;gb6.c,60 :: 		}
L_displayNumber3:
	MOVF        FARG_displayNumber_position+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_displayNumber5
	MOVF        FARG_displayNumber_position+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_displayNumber6
	MOVF        FARG_displayNumber_position+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_displayNumber7
	MOVF        FARG_displayNumber_position+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_displayNumber8
L_displayNumber4:
;gb6.c,61 :: 		Delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_displayNumber9:
	DECFSZ      R13, 1, 1
	BRA         L_displayNumber9
	DECFSZ      R12, 1, 1
	BRA         L_displayNumber9
	DECFSZ      R11, 1, 1
	BRA         L_displayNumber9
	NOP
	NOP
;gb6.c,62 :: 		RB7_bit = RB6_bit = RB5_bit = RB4_bit = 0;
	BCF         RB4_bit+0, BitPos(RB4_bit+0) 
	BTFSC       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L__displayNumber50
	BCF         RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__displayNumber51
L__displayNumber50:
	BSF         RB5_bit+0, BitPos(RB5_bit+0) 
L__displayNumber51:
	BTFSC       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__displayNumber52
	BCF         RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__displayNumber53
L__displayNumber52:
	BSF         RB6_bit+0, BitPos(RB6_bit+0) 
L__displayNumber53:
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__displayNumber54
	BCF         RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L__displayNumber55
L__displayNumber54:
	BSF         RB7_bit+0, BitPos(RB7_bit+0) 
L__displayNumber55:
;gb6.c,63 :: 		}
L_end_displayNumber:
	RETURN      0
; end of _displayNumber

_main:

;gb6.c,65 :: 		void main() {
;gb6.c,66 :: 		previousStateRB0 = 0;
	BCF         _previousStateRB0+0, BitPos(_previousStateRB0+0) 
;gb6.c,67 :: 		previousStateRB1 = 0;
	BCF         _previousStateRB1+0, BitPos(_previousStateRB1+0) 
;gb6.c,68 :: 		previousStateRB2 = 0;
	BCF         _previousStateRB2+0, BitPos(_previousStateRB2+0) 
;gb6.c,69 :: 		previousStateRB3 = 0;
	BCF         _previousStateRB3+0, BitPos(_previousStateRB3+0) 
;gb6.c,70 :: 		PORTA = 0;
	CLRF        PORTA+0 
;gb6.c,71 :: 		TRISA = 4;
	MOVLW       4
	MOVWF       TRISA+0 
;gb6.c,72 :: 		ADCON1 = 12;
	MOVLW       12
	MOVWF       ADCON1+0 
;gb6.c,73 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;gb6.c,74 :: 		INTCON2 = 0;
	CLRF        INTCON2+0 
;gb6.c,75 :: 		TRISB0_bit = 1;
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;gb6.c,76 :: 		TRISB1_bit = 1;
	BSF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;gb6.c,77 :: 		TRISB2_bit = 1;
	BSF         TRISB2_bit+0, BitPos(TRISB2_bit+0) 
;gb6.c,78 :: 		TRISD = 0;
	CLRF        TRISD+0 
;gb6.c,79 :: 		TRISB4_bit = 0;
	BCF         TRISB4_bit+0, BitPos(TRISB4_bit+0) 
;gb6.c,80 :: 		TRISB5_bit = 0;
	BCF         TRISB5_bit+0, BitPos(TRISB5_bit+0) 
;gb6.c,81 :: 		TRISB6_bit = 0;
	BCF         TRISB6_bit+0, BitPos(TRISB6_bit+0) 
;gb6.c,82 :: 		TRISB7_bit = 0;
	BCF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;gb6.c,84 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;gb6.c,85 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;gb6.c,86 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;gb6.c,87 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;gb6.c,88 :: 		CreateCustomChar();
	CALL        _CreateCustomChar+0, 0
;gb6.c,89 :: 		pwm1_init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;gb6.c,90 :: 		pwm1_set_duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;gb6.c,91 :: 		pwm1_start();
	CALL        _PWM1_Start+0, 0
;gb6.c,93 :: 		while (1) {
L_main10:
;gb6.c,96 :: 		Lcd_Chr(2, 16, 0);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;gb6.c,98 :: 		if (RB0_bit == 1 && previousStateRB0 == 0) {
	BTFSS       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main14
	BTFSC       _previousStateRB0+0, BitPos(_previousStateRB0+0) 
	GOTO        L_main14
L__main47:
;gb6.c,99 :: 		previousStateRB0 = 1;
	BSF         _previousStateRB0+0, BitPos(_previousStateRB0+0) 
;gb6.c,101 :: 		Lcd_Out(1, 1, "Felipe Wormmat");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_gb6+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_gb6+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;gb6.c,102 :: 		Lcd_Out(2, 1, "RA 38579");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_gb6+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_gb6+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;gb6.c,104 :: 		Delay_ms(2000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
	NOP
	NOP
;gb6.c,105 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;gb6.c,106 :: 		} else if (RB0_bit == 0) {
	GOTO        L_main16
L_main14:
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main17
;gb6.c,107 :: 		previousStateRB0 = 0;
	BCF         _previousStateRB0+0, BitPos(_previousStateRB0+0) 
;gb6.c,108 :: 		}
L_main17:
L_main16:
;gb6.c,110 :: 		if (RB1_bit == 1 && previousStateRB1 == 0) {
	BTFSS       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main20
	BTFSC       _previousStateRB1+0, BitPos(_previousStateRB1+0) 
	GOTO        L_main20
L__main46:
;gb6.c,111 :: 		previousStateRB1 = 1;
	BSF         _previousStateRB1+0, BitPos(_previousStateRB1+0) 
;gb6.c,113 :: 		displayNumber(3, 1);
	MOVLW       3
	MOVWF       FARG_displayNumber_digit+0 
	MOVLW       1
	MOVWF       FARG_displayNumber_position+0 
	CALL        _displayNumber+0, 0
;gb6.c,114 :: 		displayNumber(8, 2);
	MOVLW       8
	MOVWF       FARG_displayNumber_digit+0 
	MOVLW       2
	MOVWF       FARG_displayNumber_position+0 
	CALL        _displayNumber+0, 0
;gb6.c,115 :: 		displayNumber(5, 3);
	MOVLW       5
	MOVWF       FARG_displayNumber_digit+0 
	MOVLW       3
	MOVWF       FARG_displayNumber_position+0 
	CALL        _displayNumber+0, 0
;gb6.c,116 :: 		displayNumber(7, 4);
	MOVLW       7
	MOVWF       FARG_displayNumber_digit+0 
	MOVLW       4
	MOVWF       FARG_displayNumber_position+0 
	CALL        _displayNumber+0, 0
;gb6.c,118 :: 		Delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	DECFSZ      R11, 1, 1
	BRA         L_main21
	NOP
	NOP
;gb6.c,119 :: 		} else if (RB1_bit == 0) {
	GOTO        L_main22
L_main20:
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main23
;gb6.c,120 :: 		previousStateRB1 = 0;
	BCF         _previousStateRB1+0, BitPos(_previousStateRB1+0) 
;gb6.c,121 :: 		}
L_main23:
L_main22:
;gb6.c,123 :: 		if (RB2_bit == 1 && previousStateRB2 == 0) {
	BTFSS       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main26
	BTFSC       _previousStateRB2+0, BitPos(_previousStateRB2+0) 
	GOTO        L_main26
L__main45:
;gb6.c,124 :: 		Delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	DECFSZ      R11, 1, 1
	BRA         L_main27
	NOP
	NOP
;gb6.c,125 :: 		if (RB2_bit == 1) {
	BTFSS       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main28
;gb6.c,126 :: 		previousStateRB2 = 1;
	BSF         _previousStateRB2+0, BitPos(_previousStateRB2+0) 
;gb6.c,128 :: 		if (rb2Ativo == 1) counter++;
	MOVLW       0
	XORWF       _rb2Ativo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main57
	MOVLW       1
	XORWF       _rb2Ativo+0, 0 
L__main57:
	BTFSS       STATUS+0, 2 
	GOTO        L_main29
	INCF        _counter+0, 1 
L_main29:
;gb6.c,129 :: 		if (counter > 255) counter = 0;
	MOVF        _counter+0, 0 
	SUBLW       255
	BTFSC       STATUS+0, 0 
	GOTO        L_main30
	CLRF        _counter+0 
L_main30:
;gb6.c,131 :: 		if (rb2Ativo == 1) {
	MOVLW       0
	XORWF       _rb2Ativo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main58
	MOVLW       1
	XORWF       _rb2Ativo+0, 0 
L__main58:
	BTFSS       STATUS+0, 2 
	GOTO        L_main31
;gb6.c,132 :: 		pwm1_set_duty(counter);
	MOVF        _counter+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;gb6.c,134 :: 		ByteToStr(counter, txt);
	MOVF        _counter+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;gb6.c,135 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;gb6.c,136 :: 		Lcd_Out(1, 1, "Conta ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_gb6+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_gb6+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;gb6.c,137 :: 		Lcd_Out_Cp(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;gb6.c,138 :: 		adcValue = ADC_Read(2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;gb6.c,139 :: 		WordToStr(adcValue, adcTxt);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_adcTxt_L1+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_adcTxt_L1+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;gb6.c,140 :: 		Lcd_Out(2, 1, "ADC2:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_gb6+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_gb6+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;gb6.c,141 :: 		Lcd_Out_Cp(adcTxt);
	MOVLW       main_adcTxt_L1+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(main_adcTxt_L1+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;gb6.c,142 :: 		}
L_main31:
;gb6.c,143 :: 		}
L_main28:
;gb6.c,144 :: 		} else if (RB2_bit == 0) {
	GOTO        L_main32
L_main26:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main33
;gb6.c,145 :: 		rb2Ativo = 1;
	MOVLW       1
	MOVWF       _rb2Ativo+0 
	MOVLW       0
	MOVWF       _rb2Ativo+1 
;gb6.c,146 :: 		previousStateRB2 = 0;
	BCF         _previousStateRB2+0, BitPos(_previousStateRB2+0) 
;gb6.c,147 :: 		}
L_main33:
L_main32:
;gb6.c,149 :: 		if (RB3_bit == 1 && previousStateRB3 == 0) {
	BTFSS       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main36
	BTFSC       _previousStateRB3+0, BitPos(_previousStateRB3+0) 
	GOTO        L_main36
L__main44:
;gb6.c,150 :: 		Delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main37:
	DECFSZ      R13, 1, 1
	BRA         L_main37
	DECFSZ      R12, 1, 1
	BRA         L_main37
	DECFSZ      R11, 1, 1
	BRA         L_main37
	NOP
	NOP
;gb6.c,151 :: 		if (RB3_bit == 1) {
	BTFSS       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main38
;gb6.c,152 :: 		previousStateRB3 = 1;
	BSF         _previousStateRB3+0, BitPos(_previousStateRB3+0) 
;gb6.c,154 :: 		if (rb3Ativo == 1) counter--;
	MOVLW       0
	XORWF       _rb3Ativo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main59
	MOVLW       1
	XORWF       _rb3Ativo+0, 0 
L__main59:
	BTFSS       STATUS+0, 2 
	GOTO        L_main39
	DECF        _counter+0, 1 
L_main39:
;gb6.c,155 :: 		if (counter < 1) counter = 255;
	MOVLW       1
	SUBWF       _counter+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main40
	MOVLW       255
	MOVWF       _counter+0 
L_main40:
;gb6.c,157 :: 		if (rb3Ativo == 1) {
	MOVLW       0
	XORWF       _rb3Ativo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main60
	MOVLW       1
	XORWF       _rb3Ativo+0, 0 
L__main60:
	BTFSS       STATUS+0, 2 
	GOTO        L_main41
;gb6.c,158 :: 		pwm1_set_duty(counter);
	MOVF        _counter+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;gb6.c,160 :: 		ByteToStr(counter, txt);
	MOVF        _counter+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;gb6.c,161 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;gb6.c,162 :: 		Lcd_Out(1, 1, "Conta ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_gb6+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_gb6+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;gb6.c,163 :: 		Lcd_Out_Cp(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;gb6.c,164 :: 		adcValue = ADC_Read(2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;gb6.c,165 :: 		WordToStr(adcValue, adcTxt);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_adcTxt_L1+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_adcTxt_L1+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;gb6.c,166 :: 		Lcd_Out(2, 1, "ADC2:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_gb6+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_gb6+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;gb6.c,167 :: 		Lcd_Out_Cp(adcTxt);
	MOVLW       main_adcTxt_L1+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(main_adcTxt_L1+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;gb6.c,168 :: 		}
L_main41:
;gb6.c,169 :: 		}
L_main38:
;gb6.c,170 :: 		} else if (RB3_bit == 0) {
	GOTO        L_main42
L_main36:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main43
;gb6.c,171 :: 		rb3Ativo = 1;
	MOVLW       1
	MOVWF       _rb3Ativo+0 
	MOVLW       0
	MOVWF       _rb3Ativo+1 
;gb6.c,172 :: 		previousStateRB3 = 0;
	BCF         _previousStateRB3+0, BitPos(_previousStateRB3+0) 
;gb6.c,173 :: 		}
L_main43:
L_main42:
;gb6.c,174 :: 		}
	GOTO        L_main10
;gb6.c,175 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
