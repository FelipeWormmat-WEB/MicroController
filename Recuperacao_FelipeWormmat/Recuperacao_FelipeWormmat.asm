
_main:

;Recuperacao_FelipeWormmat.c,36 :: 		void main(){
;Recuperacao_FelipeWormmat.c,37 :: 		setup_inicial();
	CALL        _setup_inicial+0, 0
;Recuperacao_FelipeWormmat.c,38 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;Recuperacao_FelipeWormmat.c,39 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Recuperacao_FelipeWormmat.c,40 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Recuperacao_FelipeWormmat.c,41 :: 		while(1){
L_main0:
;Recuperacao_FelipeWormmat.c,42 :: 		relogio();//atualiza o rel?gio
	CALL        _relogio+0, 0
;Recuperacao_FelipeWormmat.c,43 :: 		escreve_lcd();//escreve no LCD os dados do rel?gio
	CALL        _escreve_lcd+0, 0
;Recuperacao_FelipeWormmat.c,44 :: 		if(rb0_bit==0){//menu de op??es
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main2
;Recuperacao_FelipeWormmat.c,45 :: 		while(rb0_bit == 0) delay_ms(100);
L_main3:
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main4
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
	GOTO        L_main3
L_main4:
;Recuperacao_FelipeWormmat.c,46 :: 		if(conta_menu < 7) conta_menu ++;
	MOVLW       128
	XORWF       _conta_menu+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main114
	MOVLW       7
	SUBWF       _conta_menu+0, 0 
L__main114:
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
	INFSNZ      _conta_menu+0, 1 
	INCF        _conta_menu+1, 1 
L_main6:
;Recuperacao_FelipeWormmat.c,47 :: 		if(conta_menu == 7) conta_menu = 0;
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main115
	MOVLW       7
	XORWF       _conta_menu+0, 0 
L__main115:
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
	CLRF        _conta_menu+0 
	CLRF        _conta_menu+1 
L_main7:
;Recuperacao_FelipeWormmat.c,48 :: 		}
L_main2:
;Recuperacao_FelipeWormmat.c,49 :: 		if(rb1_bit == 0){//ok
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main8
;Recuperacao_FelipeWormmat.c,50 :: 		while(rb1_bit == 0) delay_ms(100);
L_main9:
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main10
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
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
	GOTO        L_main9
L_main10:
;Recuperacao_FelipeWormmat.c,51 :: 		conta_menu = 0;//menu desligado
	CLRF        _conta_menu+0 
	CLRF        _conta_menu+1 
;Recuperacao_FelipeWormmat.c,52 :: 		}
L_main8:
;Recuperacao_FelipeWormmat.c,53 :: 		if(conta_menu == 1){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main116
	MOVLW       1
	XORWF       _conta_menu+0, 0 
L__main116:
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;Recuperacao_FelipeWormmat.c,55 :: 		if(rb2_bit == 0){//sobe
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main13
;Recuperacao_FelipeWormmat.c,56 :: 		while(rb2_bit == 0) delay_ms(100);
L_main14:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main15
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main16:
	DECFSZ      R13, 1, 1
	BRA         L_main16
	DECFSZ      R12, 1, 1
	BRA         L_main16
	DECFSZ      R11, 1, 1
	BRA         L_main16
	NOP
	NOP
	GOTO        L_main14
L_main15:
;Recuperacao_FelipeWormmat.c,57 :: 		if(minuto < 60) minuto ++;
	MOVLW       128
	XORWF       _minuto+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main117
	MOVLW       60
	SUBWF       _minuto+0, 0 
L__main117:
	BTFSC       STATUS+0, 0 
	GOTO        L_main17
	INFSNZ      _minuto+0, 1 
	INCF        _minuto+1, 1 
L_main17:
;Recuperacao_FelipeWormmat.c,58 :: 		}
L_main13:
;Recuperacao_FelipeWormmat.c,59 :: 		if(rb3_bit == 0){ // Ajuste decrescente
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main18
;Recuperacao_FelipeWormmat.c,60 :: 		while(rb3_bit == 0) delay_ms(100);
L_main19:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main20
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
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
	GOTO        L_main19
L_main20:
;Recuperacao_FelipeWormmat.c,61 :: 		if(minuto > 0) minuto --;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _minuto+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main118
	MOVF        _minuto+0, 0 
	SUBLW       0
L__main118:
	BTFSC       STATUS+0, 0 
	GOTO        L_main22
	MOVLW       1
	SUBWF       _minuto+0, 1 
	MOVLW       0
	SUBWFB      _minuto+1, 1 
L_main22:
;Recuperacao_FelipeWormmat.c,62 :: 		}
L_main18:
;Recuperacao_FelipeWormmat.c,63 :: 		}
L_main12:
;Recuperacao_FelipeWormmat.c,64 :: 		if(conta_menu == 2){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main119
	MOVLW       2
	XORWF       _conta_menu+0, 0 
L__main119:
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;Recuperacao_FelipeWormmat.c,65 :: 		if(rb2_bit == 0){
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main24
;Recuperacao_FelipeWormmat.c,66 :: 		while(rb2_bit == 0) delay_ms(100);
L_main25:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main26
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
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
	GOTO        L_main25
L_main26:
;Recuperacao_FelipeWormmat.c,67 :: 		if(hora < 23) hora++;
	MOVLW       128
	XORWF       _hora+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main120
	MOVLW       23
	SUBWF       _hora+0, 0 
L__main120:
	BTFSC       STATUS+0, 0 
	GOTO        L_main28
	INFSNZ      _hora+0, 1 
	INCF        _hora+1, 1 
L_main28:
;Recuperacao_FelipeWormmat.c,68 :: 		}
L_main24:
;Recuperacao_FelipeWormmat.c,69 :: 		if(rb3_bit == 0){ // Ajuste decrescente
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main29
;Recuperacao_FelipeWormmat.c,70 :: 		while(rb3_bit == 0) delay_ms(100);
L_main30:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main31
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main32:
	DECFSZ      R13, 1, 1
	BRA         L_main32
	DECFSZ      R12, 1, 1
	BRA         L_main32
	DECFSZ      R11, 1, 1
	BRA         L_main32
	NOP
	NOP
	GOTO        L_main30
L_main31:
;Recuperacao_FelipeWormmat.c,71 :: 		if(hora > 0) hora--;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _hora+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main121
	MOVF        _hora+0, 0 
	SUBLW       0
L__main121:
	BTFSC       STATUS+0, 0 
	GOTO        L_main33
	MOVLW       1
	SUBWF       _hora+0, 1 
	MOVLW       0
	SUBWFB      _hora+1, 1 
L_main33:
;Recuperacao_FelipeWormmat.c,72 :: 		}
L_main29:
;Recuperacao_FelipeWormmat.c,73 :: 		}
L_main23:
;Recuperacao_FelipeWormmat.c,74 :: 		if(conta_menu == 3){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main122
	MOVLW       3
	XORWF       _conta_menu+0, 0 
L__main122:
	BTFSS       STATUS+0, 2 
	GOTO        L_main34
;Recuperacao_FelipeWormmat.c,75 :: 		if(rb2_bit == 0){ // Ajuste crescente
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main35
;Recuperacao_FelipeWormmat.c,76 :: 		while(rb2_bit == 0) delay_ms(100);
L_main36:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main37
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main38:
	DECFSZ      R13, 1, 1
	BRA         L_main38
	DECFSZ      R12, 1, 1
	BRA         L_main38
	DECFSZ      R11, 1, 1
	BRA         L_main38
	NOP
	NOP
	GOTO        L_main36
L_main37:
;Recuperacao_FelipeWormmat.c,77 :: 		dia_semana = (dia_semana + 1) % 7; // Segunda a Domingo
	MOVLW       1
	ADDWF       _dia_semana+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _dia_semana+1, 0 
	MOVWF       R1 
	MOVLW       7
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _dia_semana+0 
	MOVF        R1, 0 
	MOVWF       _dia_semana+1 
;Recuperacao_FelipeWormmat.c,78 :: 		}
L_main35:
;Recuperacao_FelipeWormmat.c,79 :: 		if(rb3_bit == 0){ // Ajuste decrescente
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main39
;Recuperacao_FelipeWormmat.c,80 :: 		while(rb3_bit == 0) delay_ms(100);
L_main40:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main41
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main42:
	DECFSZ      R13, 1, 1
	BRA         L_main42
	DECFSZ      R12, 1, 1
	BRA         L_main42
	DECFSZ      R11, 1, 1
	BRA         L_main42
	NOP
	NOP
	GOTO        L_main40
L_main41:
;Recuperacao_FelipeWormmat.c,81 :: 		dia_semana = (dia_semana == 0) ? 6 : dia_semana - 1; // Domingo para Segunda
	MOVLW       0
	XORWF       _dia_semana+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main123
	MOVLW       0
	XORWF       _dia_semana+0, 0 
L__main123:
	BTFSS       STATUS+0, 2 
	GOTO        L_main43
	MOVLW       6
	MOVWF       ?FLOC___mainT33+0 
	MOVLW       0
	MOVWF       ?FLOC___mainT33+1 
	GOTO        L_main44
L_main43:
	MOVLW       1
	SUBWF       _dia_semana+0, 0 
	MOVWF       ?FLOC___mainT33+0 
	MOVLW       0
	SUBWFB      _dia_semana+1, 0 
	MOVWF       ?FLOC___mainT33+1 
L_main44:
	MOVF        ?FLOC___mainT33+0, 0 
	MOVWF       _dia_semana+0 
	MOVF        ?FLOC___mainT33+1, 0 
	MOVWF       _dia_semana+1 
;Recuperacao_FelipeWormmat.c,82 :: 		}
L_main39:
;Recuperacao_FelipeWormmat.c,83 :: 		}
L_main34:
;Recuperacao_FelipeWormmat.c,84 :: 		if(conta_menu == 4){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main124
	MOVLW       4
	XORWF       _conta_menu+0, 0 
L__main124:
	BTFSS       STATUS+0, 2 
	GOTO        L_main45
;Recuperacao_FelipeWormmat.c,85 :: 		if(rb2_bit == 0){ // Ajuste crescente
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main46
;Recuperacao_FelipeWormmat.c,86 :: 		while(rb2_bit == 0) delay_ms(100);
L_main47:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main48
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main49:
	DECFSZ      R13, 1, 1
	BRA         L_main49
	DECFSZ      R12, 1, 1
	BRA         L_main49
	DECFSZ      R11, 1, 1
	BRA         L_main49
	NOP
	NOP
	GOTO        L_main47
L_main48:
;Recuperacao_FelipeWormmat.c,87 :: 		if(dia < 31) dia++;
	MOVLW       128
	XORWF       _dia+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main125
	MOVLW       31
	SUBWF       _dia+0, 0 
L__main125:
	BTFSC       STATUS+0, 0 
	GOTO        L_main50
	INFSNZ      _dia+0, 1 
	INCF        _dia+1, 1 
L_main50:
;Recuperacao_FelipeWormmat.c,88 :: 		}
L_main46:
;Recuperacao_FelipeWormmat.c,89 :: 		if(rb3_bit == 0){ // Ajuste decrescente
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main51
;Recuperacao_FelipeWormmat.c,90 :: 		while(rb3_bit == 0) delay_ms(100);
L_main52:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main53
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main54:
	DECFSZ      R13, 1, 1
	BRA         L_main54
	DECFSZ      R12, 1, 1
	BRA         L_main54
	DECFSZ      R11, 1, 1
	BRA         L_main54
	NOP
	NOP
	GOTO        L_main52
L_main53:
;Recuperacao_FelipeWormmat.c,91 :: 		if(dia > 1) dia--;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _dia+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main126
	MOVF        _dia+0, 0 
	SUBLW       1
L__main126:
	BTFSC       STATUS+0, 0 
	GOTO        L_main55
	MOVLW       1
	SUBWF       _dia+0, 1 
	MOVLW       0
	SUBWFB      _dia+1, 1 
L_main55:
;Recuperacao_FelipeWormmat.c,92 :: 		}
L_main51:
;Recuperacao_FelipeWormmat.c,93 :: 		}
L_main45:
;Recuperacao_FelipeWormmat.c,94 :: 		if(conta_menu == 5){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main127
	MOVLW       5
	XORWF       _conta_menu+0, 0 
L__main127:
	BTFSS       STATUS+0, 2 
	GOTO        L_main56
;Recuperacao_FelipeWormmat.c,95 :: 		if(rb2_bit == 0){ // Ajuste crescente
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main57
;Recuperacao_FelipeWormmat.c,96 :: 		while(rb2_bit == 0) delay_ms(100);
L_main58:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main59
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main60:
	DECFSZ      R13, 1, 1
	BRA         L_main60
	DECFSZ      R12, 1, 1
	BRA         L_main60
	DECFSZ      R11, 1, 1
	BRA         L_main60
	NOP
	NOP
	GOTO        L_main58
L_main59:
;Recuperacao_FelipeWormmat.c,97 :: 		mes = (mes % 12) + 1;
	MOVLW       12
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _mes+0, 0 
	MOVWF       R0 
	MOVF        _mes+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       _mes+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       _mes+1 
;Recuperacao_FelipeWormmat.c,98 :: 		}
L_main57:
;Recuperacao_FelipeWormmat.c,99 :: 		if(rb3_bit == 0){ // Ajuste decrescente
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main61
;Recuperacao_FelipeWormmat.c,100 :: 		while(rb3_bit == 0) delay_ms(100);
L_main62:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main63
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main64:
	DECFSZ      R13, 1, 1
	BRA         L_main64
	DECFSZ      R12, 1, 1
	BRA         L_main64
	DECFSZ      R11, 1, 1
	BRA         L_main64
	NOP
	NOP
	GOTO        L_main62
L_main63:
;Recuperacao_FelipeWormmat.c,101 :: 		mes = (mes == 1) ? 12 : mes - 1;
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main128
	MOVLW       1
	XORWF       _mes+0, 0 
L__main128:
	BTFSS       STATUS+0, 2 
	GOTO        L_main65
	MOVLW       12
	MOVWF       ?FLOC___mainT52+0 
	MOVLW       0
	MOVWF       ?FLOC___mainT52+1 
	GOTO        L_main66
L_main65:
	MOVLW       1
	SUBWF       _mes+0, 0 
	MOVWF       ?FLOC___mainT52+0 
	MOVLW       0
	SUBWFB      _mes+1, 0 
	MOVWF       ?FLOC___mainT52+1 
L_main66:
	MOVF        ?FLOC___mainT52+0, 0 
	MOVWF       _mes+0 
	MOVF        ?FLOC___mainT52+1, 0 
	MOVWF       _mes+1 
;Recuperacao_FelipeWormmat.c,102 :: 		}
L_main61:
;Recuperacao_FelipeWormmat.c,103 :: 		}
L_main56:
;Recuperacao_FelipeWormmat.c,104 :: 		if(conta_menu == 6){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main129
	MOVLW       6
	XORWF       _conta_menu+0, 0 
L__main129:
	BTFSS       STATUS+0, 2 
	GOTO        L_main67
;Recuperacao_FelipeWormmat.c,105 :: 		if(rb2_bit == 0){ // Ajuste crescente
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main68
;Recuperacao_FelipeWormmat.c,106 :: 		while(rb2_bit == 0) delay_ms(100);
L_main69:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main70
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main71:
	DECFSZ      R13, 1, 1
	BRA         L_main71
	DECFSZ      R12, 1, 1
	BRA         L_main71
	DECFSZ      R11, 1, 1
	BRA         L_main71
	NOP
	NOP
	GOTO        L_main69
L_main70:
;Recuperacao_FelipeWormmat.c,107 :: 		if(ano < 9999) ano++;
	MOVLW       128
	XORWF       _ano+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       39
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main130
	MOVLW       15
	SUBWF       _ano+0, 0 
L__main130:
	BTFSC       STATUS+0, 0 
	GOTO        L_main72
	INFSNZ      _ano+0, 1 
	INCF        _ano+1, 1 
L_main72:
;Recuperacao_FelipeWormmat.c,108 :: 		}
L_main68:
;Recuperacao_FelipeWormmat.c,109 :: 		if(rb3_bit == 0){ // Ajuste decrescente
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main73
;Recuperacao_FelipeWormmat.c,110 :: 		while(rb3_bit == 0) delay_ms(100);
L_main74:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main75
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main76:
	DECFSZ      R13, 1, 1
	BRA         L_main76
	DECFSZ      R12, 1, 1
	BRA         L_main76
	DECFSZ      R11, 1, 1
	BRA         L_main76
	NOP
	NOP
	GOTO        L_main74
L_main75:
;Recuperacao_FelipeWormmat.c,111 :: 		if(ano > 2024) ano--;
	MOVLW       128
	XORLW       7
	MOVWF       R0 
	MOVLW       128
	XORWF       _ano+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main131
	MOVF        _ano+0, 0 
	SUBLW       232
L__main131:
	BTFSC       STATUS+0, 0 
	GOTO        L_main77
	MOVLW       1
	SUBWF       _ano+0, 1 
	MOVLW       0
	SUBWFB      _ano+1, 1 
L_main77:
;Recuperacao_FelipeWormmat.c,112 :: 		}
L_main73:
;Recuperacao_FelipeWormmat.c,113 :: 		}
L_main67:
;Recuperacao_FelipeWormmat.c,114 :: 		}
	GOTO        L_main0
;Recuperacao_FelipeWormmat.c,115 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_valida_dia:

;Recuperacao_FelipeWormmat.c,117 :: 		void valida_dia(){
;Recuperacao_FelipeWormmat.c,119 :: 		if(mes == 2){ // Fevereiro
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__valida_dia133
	MOVLW       2
	XORWF       _mes+0, 0 
L__valida_dia133:
	BTFSS       STATUS+0, 2 
	GOTO        L_valida_dia78
;Recuperacao_FelipeWormmat.c,120 :: 		dias_no_mes = (ano % 4 == 0 && (ano % 100 != 0 || ano % 400 == 0)) ? 29 : 28;
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _ano+0, 0 
	MOVWF       R0 
	MOVF        _ano+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__valida_dia134
	MOVLW       0
	XORWF       R0, 0 
L__valida_dia134:
	BTFSS       STATUS+0, 2 
	GOTO        L_valida_dia83
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _ano+0, 0 
	MOVWF       R0 
	MOVF        _ano+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__valida_dia135
	MOVLW       0
	XORWF       R0, 0 
L__valida_dia135:
	BTFSS       STATUS+0, 2 
	GOTO        L__valida_dia111
	MOVLW       144
	MOVWF       R4 
	MOVLW       1
	MOVWF       R5 
	MOVF        _ano+0, 0 
	MOVWF       R0 
	MOVF        _ano+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__valida_dia136
	MOVLW       0
	XORWF       R0, 0 
L__valida_dia136:
	BTFSC       STATUS+0, 2 
	GOTO        L__valida_dia111
	GOTO        L_valida_dia83
L__valida_dia111:
L__valida_dia110:
	MOVLW       29
	MOVWF       ?FLOC___valida_diaT72+0 
	GOTO        L_valida_dia84
L_valida_dia83:
	MOVLW       28
	MOVWF       ?FLOC___valida_diaT72+0 
L_valida_dia84:
	MOVF        ?FLOC___valida_diaT72+0, 0 
	MOVWF       valida_dia_dias_no_mes_L0+0 
	MOVLW       0
	BTFSC       ?FLOC___valida_diaT72+0, 7 
	MOVLW       255
	MOVWF       valida_dia_dias_no_mes_L0+1 
;Recuperacao_FelipeWormmat.c,121 :: 		} else if(mes == 4 || mes == 6 || mes == 9 || mes == 11){
	GOTO        L_valida_dia85
L_valida_dia78:
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__valida_dia137
	MOVLW       4
	XORWF       _mes+0, 0 
L__valida_dia137:
	BTFSC       STATUS+0, 2 
	GOTO        L__valida_dia109
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__valida_dia138
	MOVLW       6
	XORWF       _mes+0, 0 
L__valida_dia138:
	BTFSC       STATUS+0, 2 
	GOTO        L__valida_dia109
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__valida_dia139
	MOVLW       9
	XORWF       _mes+0, 0 
L__valida_dia139:
	BTFSC       STATUS+0, 2 
	GOTO        L__valida_dia109
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__valida_dia140
	MOVLW       11
	XORWF       _mes+0, 0 
L__valida_dia140:
	BTFSC       STATUS+0, 2 
	GOTO        L__valida_dia109
	GOTO        L_valida_dia88
L__valida_dia109:
;Recuperacao_FelipeWormmat.c,122 :: 		dias_no_mes = 30;
	MOVLW       30
	MOVWF       valida_dia_dias_no_mes_L0+0 
	MOVLW       0
	MOVWF       valida_dia_dias_no_mes_L0+1 
;Recuperacao_FelipeWormmat.c,123 :: 		} else {
	GOTO        L_valida_dia89
L_valida_dia88:
;Recuperacao_FelipeWormmat.c,124 :: 		dias_no_mes = 31;
	MOVLW       31
	MOVWF       valida_dia_dias_no_mes_L0+0 
	MOVLW       0
	MOVWF       valida_dia_dias_no_mes_L0+1 
;Recuperacao_FelipeWormmat.c,125 :: 		}
L_valida_dia89:
L_valida_dia85:
;Recuperacao_FelipeWormmat.c,126 :: 		if(dia > dias_no_mes) dia = dias_no_mes;
	MOVLW       128
	XORWF       valida_dia_dias_no_mes_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _dia+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__valida_dia141
	MOVF        _dia+0, 0 
	SUBWF       valida_dia_dias_no_mes_L0+0, 0 
L__valida_dia141:
	BTFSC       STATUS+0, 0 
	GOTO        L_valida_dia90
	MOVF        valida_dia_dias_no_mes_L0+0, 0 
	MOVWF       _dia+0 
	MOVF        valida_dia_dias_no_mes_L0+1, 0 
	MOVWF       _dia+1 
L_valida_dia90:
;Recuperacao_FelipeWormmat.c,127 :: 		}
L_end_valida_dia:
	RETURN      0
; end of _valida_dia

_setup_inicial:

;Recuperacao_FelipeWormmat.c,129 :: 		void setup_inicial(){
;Recuperacao_FelipeWormmat.c,131 :: 		portb = 0;
	CLRF        PORTB+0 
;Recuperacao_FelipeWormmat.c,136 :: 		trisb = 15; //RB0,RB1,RB2 e RB3 como entradas
	MOVLW       15
	MOVWF       TRISB+0 
;Recuperacao_FelipeWormmat.c,140 :: 		adcon1 = 15; //Configura como portas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;Recuperacao_FelipeWormmat.c,141 :: 		cmcon = 7;   //desliga os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;Recuperacao_FelipeWormmat.c,142 :: 		intcon2 = 0; //liga resistor pull up do portb
	CLRF        INTCON2+0 
;Recuperacao_FelipeWormmat.c,143 :: 		T0CON = 197;
	MOVLW       197
	MOVWF       T0CON+0 
;Recuperacao_FelipeWormmat.c,144 :: 		INTCON.TMR0IE = 1; //enable TMR0
	BSF         INTCON+0, 5 
;Recuperacao_FelipeWormmat.c,145 :: 		INTCON.GIE = 1; //liga global interrupt enable
	BSF         INTCON+0, 7 
;Recuperacao_FelipeWormmat.c,146 :: 		}
L_end_setup_inicial:
	RETURN      0
; end of _setup_inicial

_interrupt:

;Recuperacao_FelipeWormmat.c,148 :: 		void interrupt(){
;Recuperacao_FelipeWormmat.c,149 :: 		if(tmr0if_bit == 1){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt91
;Recuperacao_FelipeWormmat.c,150 :: 		tmr0if_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;Recuperacao_FelipeWormmat.c,151 :: 		contador ++;
	INFSNZ      _contador+0, 1 
	INCF        _contador+1, 1 
;Recuperacao_FelipeWormmat.c,152 :: 		if(contador == 122){
	MOVLW       0
	XORWF       _contador+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt145
	MOVLW       122
	XORWF       _contador+0, 0 
L__interrupt145:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt92
;Recuperacao_FelipeWormmat.c,154 :: 		contador = 0;
	CLRF        _contador+0 
	CLRF        _contador+1 
;Recuperacao_FelipeWormmat.c,155 :: 		segundo ++;
	INFSNZ      _segundo+0, 1 
	INCF        _segundo+1, 1 
;Recuperacao_FelipeWormmat.c,156 :: 		}
L_interrupt92:
;Recuperacao_FelipeWormmat.c,157 :: 		}
L_interrupt91:
;Recuperacao_FelipeWormmat.c,158 :: 		}
L_end_interrupt:
L__interrupt144:
	RETFIE      1
; end of _interrupt

_escreve_lcd:

;Recuperacao_FelipeWormmat.c,160 :: 		void escreve_lcd(){
;Recuperacao_FelipeWormmat.c,161 :: 		lcd_out(1,1,"");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Recuperacao_FelipeWormmat+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Recuperacao_FelipeWormmat+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Recuperacao_FelipeWormmat.c,162 :: 		escreve_dia();
	CALL        _escreve_dia+0, 0
;Recuperacao_FelipeWormmat.c,163 :: 		escreve_mes();
	CALL        _escreve_mes+0, 0
;Recuperacao_FelipeWormmat.c,164 :: 		escreve_ano();
	CALL        _escreve_ano+0, 0
;Recuperacao_FelipeWormmat.c,165 :: 		lcd_out(2,1,"");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Recuperacao_FelipeWormmat+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Recuperacao_FelipeWormmat+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Recuperacao_FelipeWormmat.c,166 :: 		escreve_dia_semana();
	CALL        _escreve_dia_semana+0, 0
;Recuperacao_FelipeWormmat.c,167 :: 		escreve_hora();
	CALL        _escreve_hora+0, 0
;Recuperacao_FelipeWormmat.c,168 :: 		}
L_end_escreve_lcd:
	RETURN      0
; end of _escreve_lcd

_escreve_dia:

;Recuperacao_FelipeWormmat.c,169 :: 		void escreve_dia(){
;Recuperacao_FelipeWormmat.c,170 :: 		inttostr(dia,txt);
	MOVF        _dia+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _dia+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Recuperacao_FelipeWormmat.c,171 :: 		if(dia < 10)lcd_out_cp("0");
	MOVLW       128
	XORWF       _dia+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_dia148
	MOVLW       10
	SUBWF       _dia+0, 0 
L__escreve_dia148:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_dia93
	MOVLW       ?lstr3_Recuperacao_FelipeWormmat+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr3_Recuperacao_FelipeWormmat+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_dia93:
;Recuperacao_FelipeWormmat.c,172 :: 		lcd_out_cp(ltrim(txt));
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
;Recuperacao_FelipeWormmat.c,173 :: 		lcd_out_cp(" ");
	MOVLW       ?lstr4_Recuperacao_FelipeWormmat+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr4_Recuperacao_FelipeWormmat+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Recuperacao_FelipeWormmat.c,174 :: 		}
L_end_escreve_dia:
	RETURN      0
; end of _escreve_dia

_escreve_mes:

;Recuperacao_FelipeWormmat.c,175 :: 		void escreve_mes(){
;Recuperacao_FelipeWormmat.c,176 :: 		if(mes == 10) lcd_out_cp("Outubro  ");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes150
	MOVLW       10
	XORWF       _mes+0, 0 
L__escreve_mes150:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes94
	MOVLW       ?lstr5_Recuperacao_FelipeWormmat+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr5_Recuperacao_FelipeWormmat+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes94:
;Recuperacao_FelipeWormmat.c,177 :: 		}
L_end_escreve_mes:
	RETURN      0
; end of _escreve_mes

_escreve_ano:

;Recuperacao_FelipeWormmat.c,178 :: 		void escreve_ano(){
;Recuperacao_FelipeWormmat.c,179 :: 		inttostr(ano,txt);
	MOVF        _ano+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _ano+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Recuperacao_FelipeWormmat.c,180 :: 		lcd_out_cp(ltrim(txt));
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
;Recuperacao_FelipeWormmat.c,181 :: 		}
L_end_escreve_ano:
	RETURN      0
; end of _escreve_ano

_escreve_dia_semana:

;Recuperacao_FelipeWormmat.c,183 :: 		void escreve_dia_semana(){
;Recuperacao_FelipeWormmat.c,184 :: 		if(dia_semana == 3)lcd_out_cp("Terca   ");
	MOVLW       0
	XORWF       _dia_semana+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_dia_semana153
	MOVLW       3
	XORWF       _dia_semana+0, 0 
L__escreve_dia_semana153:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_dia_semana95
	MOVLW       ?lstr6_Recuperacao_FelipeWormmat+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr6_Recuperacao_FelipeWormmat+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_dia_semana95:
;Recuperacao_FelipeWormmat.c,185 :: 		}
L_end_escreve_dia_semana:
	RETURN      0
; end of _escreve_dia_semana

_escreve_hora:

;Recuperacao_FelipeWormmat.c,186 :: 		void escreve_hora(){
;Recuperacao_FelipeWormmat.c,187 :: 		lcd_out_cp("08:");
	MOVLW       ?lstr7_Recuperacao_FelipeWormmat+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr7_Recuperacao_FelipeWormmat+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Recuperacao_FelipeWormmat.c,190 :: 		if(conta_menu == 1 && contador < 61) lcd_out_cp("  "); // Apaga o item
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora155
	MOVLW       1
	XORWF       _conta_menu+0, 0 
L__escreve_hora155:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_hora98
	MOVLW       128
	XORWF       _contador+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora156
	MOVLW       61
	SUBWF       _contador+0, 0 
L__escreve_hora156:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora98
L__escreve_hora112:
	MOVLW       ?lstr8_Recuperacao_FelipeWormmat+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr8_Recuperacao_FelipeWormmat+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_escreve_hora99
L_escreve_hora98:
;Recuperacao_FelipeWormmat.c,192 :: 		inttostr(minuto,txt);
	MOVF        _minuto+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _minuto+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Recuperacao_FelipeWormmat.c,193 :: 		if(minuto < 10)lcd_out_cp("0");
	MOVLW       128
	XORWF       _minuto+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora157
	MOVLW       10
	SUBWF       _minuto+0, 0 
L__escreve_hora157:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora100
	MOVLW       ?lstr9_Recuperacao_FelipeWormmat+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr9_Recuperacao_FelipeWormmat+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_hora100:
;Recuperacao_FelipeWormmat.c,194 :: 		lcd_out_cp(ltrim(txt));
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
;Recuperacao_FelipeWormmat.c,195 :: 		}
L_escreve_hora99:
;Recuperacao_FelipeWormmat.c,198 :: 		if(contador < 61)lcd_out_cp(":");
	MOVLW       128
	XORWF       _contador+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora158
	MOVLW       61
	SUBWF       _contador+0, 0 
L__escreve_hora158:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora101
	MOVLW       ?lstr10_Recuperacao_FelipeWormmat+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr10_Recuperacao_FelipeWormmat+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_escreve_hora102
L_escreve_hora101:
;Recuperacao_FelipeWormmat.c,199 :: 		else lcd_out_cp(" ");
	MOVLW       ?lstr11_Recuperacao_FelipeWormmat+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr11_Recuperacao_FelipeWormmat+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_hora102:
;Recuperacao_FelipeWormmat.c,202 :: 		inttostr(segundo,txt);
	MOVF        _segundo+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _segundo+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Recuperacao_FelipeWormmat.c,203 :: 		if(segundo < 10)lcd_out_cp("0");
	MOVLW       128
	XORWF       _segundo+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora159
	MOVLW       10
	SUBWF       _segundo+0, 0 
L__escreve_hora159:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora103
	MOVLW       ?lstr12_Recuperacao_FelipeWormmat+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr12_Recuperacao_FelipeWormmat+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_hora103:
;Recuperacao_FelipeWormmat.c,204 :: 		lcd_out_cp(ltrim(txt));
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
;Recuperacao_FelipeWormmat.c,205 :: 		}
L_end_escreve_hora:
	RETURN      0
; end of _escreve_hora

_relogio:

;Recuperacao_FelipeWormmat.c,206 :: 		void relogio(){
;Recuperacao_FelipeWormmat.c,207 :: 		if(segundo == 60){
	MOVLW       0
	XORWF       _segundo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__relogio161
	MOVLW       60
	XORWF       _segundo+0, 0 
L__relogio161:
	BTFSS       STATUS+0, 2 
	GOTO        L_relogio104
;Recuperacao_FelipeWormmat.c,208 :: 		segundo = 0;
	CLRF        _segundo+0 
	CLRF        _segundo+1 
;Recuperacao_FelipeWormmat.c,209 :: 		minuto++;
	INFSNZ      _minuto+0, 1 
	INCF        _minuto+1, 1 
;Recuperacao_FelipeWormmat.c,210 :: 		if(minuto == 60){
	MOVLW       0
	XORWF       _minuto+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__relogio162
	MOVLW       60
	XORWF       _minuto+0, 0 
L__relogio162:
	BTFSS       STATUS+0, 2 
	GOTO        L_relogio105
;Recuperacao_FelipeWormmat.c,211 :: 		minuto = 0;
	CLRF        _minuto+0 
	CLRF        _minuto+1 
;Recuperacao_FelipeWormmat.c,212 :: 		hora++;
	INFSNZ      _hora+0, 1 
	INCF        _hora+1, 1 
;Recuperacao_FelipeWormmat.c,213 :: 		if(hora == 24){
	MOVLW       0
	XORWF       _hora+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__relogio163
	MOVLW       24
	XORWF       _hora+0, 0 
L__relogio163:
	BTFSS       STATUS+0, 2 
	GOTO        L_relogio106
;Recuperacao_FelipeWormmat.c,214 :: 		hora = 0;
	CLRF        _hora+0 
	CLRF        _hora+1 
;Recuperacao_FelipeWormmat.c,215 :: 		dia++;
	INFSNZ      _dia+0, 1 
	INCF        _dia+1, 1 
;Recuperacao_FelipeWormmat.c,216 :: 		valida_dia();
	CALL        _valida_dia+0, 0
;Recuperacao_FelipeWormmat.c,217 :: 		if(dia == 1){
	MOVLW       0
	XORWF       _dia+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__relogio164
	MOVLW       1
	XORWF       _dia+0, 0 
L__relogio164:
	BTFSS       STATUS+0, 2 
	GOTO        L_relogio107
;Recuperacao_FelipeWormmat.c,218 :: 		mes++;
	INFSNZ      _mes+0, 1 
	INCF        _mes+1, 1 
;Recuperacao_FelipeWormmat.c,219 :: 		if(mes == 13){
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__relogio165
	MOVLW       13
	XORWF       _mes+0, 0 
L__relogio165:
	BTFSS       STATUS+0, 2 
	GOTO        L_relogio108
;Recuperacao_FelipeWormmat.c,220 :: 		mes = 1;
	MOVLW       1
	MOVWF       _mes+0 
	MOVLW       0
	MOVWF       _mes+1 
;Recuperacao_FelipeWormmat.c,221 :: 		ano++;
	INFSNZ      _ano+0, 1 
	INCF        _ano+1, 1 
;Recuperacao_FelipeWormmat.c,222 :: 		}
L_relogio108:
;Recuperacao_FelipeWormmat.c,223 :: 		}
L_relogio107:
;Recuperacao_FelipeWormmat.c,224 :: 		}
L_relogio106:
;Recuperacao_FelipeWormmat.c,225 :: 		}
L_relogio105:
;Recuperacao_FelipeWormmat.c,226 :: 		}
L_relogio104:
;Recuperacao_FelipeWormmat.c,227 :: 		}
L_end_relogio:
	RETURN      0
; end of _relogio
