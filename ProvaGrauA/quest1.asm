
_atualizaDisplays:

;quest1.c,20 :: 		void atualizaDisplays(int valor) {
;quest1.c,23 :: 		milhar = valor / 1000;            // Obtém o dígito do milhar
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_atualizaDisplays_valor+0, 0 
	MOVWF       R0 
	MOVF        FARG_atualizaDisplays_valor+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__atualizaDisplays+0 
	MOVF        R1, 0 
	MOVWF       FLOC__atualizaDisplays+1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_atualizaDisplays_valor+0, 0 
	MOVWF       R0 
	MOVF        FARG_atualizaDisplays_valor+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
;quest1.c,24 :: 		centena = (valor / 100) % 10;     // Obtém o dígito da centena
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       atualizaDisplays_centena_L0+0 
	MOVF        R1, 0 
	MOVWF       atualizaDisplays_centena_L0+1 
;quest1.c,25 :: 		dezena = (valor / 10) % 10;       // Obtém o dígito da dezena
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_atualizaDisplays_valor+0, 0 
	MOVWF       R0 
	MOVF        FARG_atualizaDisplays_valor+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       atualizaDisplays_dezena_L0+0 
	MOVF        R1, 0 
	MOVWF       atualizaDisplays_dezena_L0+1 
;quest1.c,26 :: 		unidade = valor % 10;             // Obtém o dígito da unidade
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_atualizaDisplays_valor+0, 0 
	MOVWF       R0 
	MOVF        FARG_atualizaDisplays_valor+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       atualizaDisplays_unidade_L0+0 
	MOVF        R1, 0 
	MOVWF       atualizaDisplays_unidade_L0+1 
;quest1.c,29 :: 		DISPLAY1 = 1;  // Habilita o primeiro display
	BSF         PORTD+0, 0 
;quest1.c,30 :: 		PORTC = segmentos[milhar]; // Envia o valor para o display
	MOVLW       _segmentos+0
	ADDWF       FLOC__atualizaDisplays+0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(_segmentos+0)
	ADDWFC      FLOC__atualizaDisplays+1, 0 
	MOVWF       TBLPTR+1 
	MOVLW       higher_addr(_segmentos+0)
	MOVWF       TBLPTR+2 
	MOVLW       0
	BTFSC       FLOC__atualizaDisplays+1, 7 
	MOVLW       255
	ADDWFC      TBLPTR+2, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTC+0
;quest1.c,31 :: 		delay_ms(5);   // Pequeno delay
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       118
	MOVWF       R13, 0
L_atualizaDisplays0:
	DECFSZ      R13, 1, 1
	BRA         L_atualizaDisplays0
	DECFSZ      R12, 1, 1
	BRA         L_atualizaDisplays0
	NOP
;quest1.c,32 :: 		DISPLAY1 = 0;  // Desabilita o primeiro display
	BCF         PORTD+0, 0 
;quest1.c,34 :: 		DISPLAY2 = 1;  // Habilita o segundo display
	BSF         PORTD+0, 1 
;quest1.c,35 :: 		PORTC = segmentos[centena];
	MOVLW       _segmentos+0
	ADDWF       atualizaDisplays_centena_L0+0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(_segmentos+0)
	ADDWFC      atualizaDisplays_centena_L0+1, 0 
	MOVWF       TBLPTR+1 
	MOVLW       higher_addr(_segmentos+0)
	MOVWF       TBLPTR+2 
	MOVLW       0
	BTFSC       atualizaDisplays_centena_L0+1, 7 
	MOVLW       255
	ADDWFC      TBLPTR+2, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTC+0
;quest1.c,36 :: 		delay_ms(5);
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       118
	MOVWF       R13, 0
L_atualizaDisplays1:
	DECFSZ      R13, 1, 1
	BRA         L_atualizaDisplays1
	DECFSZ      R12, 1, 1
	BRA         L_atualizaDisplays1
	NOP
;quest1.c,37 :: 		DISPLAY2 = 0;
	BCF         PORTD+0, 1 
;quest1.c,39 :: 		DISPLAY3 = 1;  // Habilita o terceiro display
	BSF         PORTD+0, 2 
;quest1.c,40 :: 		PORTC = segmentos[dezena];
	MOVLW       _segmentos+0
	ADDWF       atualizaDisplays_dezena_L0+0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(_segmentos+0)
	ADDWFC      atualizaDisplays_dezena_L0+1, 0 
	MOVWF       TBLPTR+1 
	MOVLW       higher_addr(_segmentos+0)
	MOVWF       TBLPTR+2 
	MOVLW       0
	BTFSC       atualizaDisplays_dezena_L0+1, 7 
	MOVLW       255
	ADDWFC      TBLPTR+2, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTC+0
;quest1.c,41 :: 		delay_ms(5);
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       118
	MOVWF       R13, 0
L_atualizaDisplays2:
	DECFSZ      R13, 1, 1
	BRA         L_atualizaDisplays2
	DECFSZ      R12, 1, 1
	BRA         L_atualizaDisplays2
	NOP
;quest1.c,42 :: 		DISPLAY3 = 0;
	BCF         PORTD+0, 2 
;quest1.c,44 :: 		DISPLAY4 = 1;  // Habilita o quarto display
	BSF         PORTD+0, 3 
;quest1.c,45 :: 		PORTC = segmentos[unidade];
	MOVLW       _segmentos+0
	ADDWF       atualizaDisplays_unidade_L0+0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(_segmentos+0)
	ADDWFC      atualizaDisplays_unidade_L0+1, 0 
	MOVWF       TBLPTR+1 
	MOVLW       higher_addr(_segmentos+0)
	MOVWF       TBLPTR+2 
	MOVLW       0
	BTFSC       atualizaDisplays_unidade_L0+1, 7 
	MOVLW       255
	ADDWFC      TBLPTR+2, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTC+0
;quest1.c,46 :: 		delay_ms(5);
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       118
	MOVWF       R13, 0
L_atualizaDisplays3:
	DECFSZ      R13, 1, 1
	BRA         L_atualizaDisplays3
	DECFSZ      R12, 1, 1
	BRA         L_atualizaDisplays3
	NOP
;quest1.c,47 :: 		DISPLAY4 = 0;
	BCF         PORTD+0, 3 
;quest1.c,48 :: 		}
L_end_atualizaDisplays:
	RETURN      0
; end of _atualizaDisplays

_main:

;quest1.c,50 :: 		void main() {
;quest1.c,51 :: 		trisd = 0x00; // Configura PORTD como saída para os displays
	CLRF        TRISD+0 
;quest1.c,52 :: 		trisc = 0x00; // Configura PORTC como saída para os segmentos
	CLRF        TRISC+0 
;quest1.c,53 :: 		trisb = 0xFF; // Configura PORTB como entrada para o botão RB0
	MOVLW       255
	MOVWF       TRISB+0 
;quest1.c,55 :: 		while (1) {
L_main4:
;quest1.c,57 :: 		if (BUTTON == 0) {
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main6
;quest1.c,58 :: 		delay_ms(50); // Anti-bouncing
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
	NOP
;quest1.c,59 :: 		if (BUTTON == 0) {
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main8
;quest1.c,60 :: 		contador++; // Incrementa o contador
	INFSNZ      _contador+0, 1 
	INCF        _contador+1, 1 
;quest1.c,62 :: 		if (contador > (dia * 100 + mes)) { // Verifica se atingiu o limite do dia e mês
	MOVF        _dia+0, 0 
	MOVWF       R0 
	MOVF        _dia+1, 0 
	MOVWF       R1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        _mes+0, 0 
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVF        _mes+1, 0 
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVLW       128
	XORWF       R3, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _contador+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main14
	MOVF        _contador+0, 0 
	SUBWF       R2, 0 
L__main14:
	BTFSC       STATUS+0, 0 
	GOTO        L_main9
;quest1.c,63 :: 		contador = 0; // Reinicia o contador
	CLRF        _contador+0 
	CLRF        _contador+1 
;quest1.c,64 :: 		}
L_main9:
;quest1.c,66 :: 		atualizaDisplays(contador); // Atualiza os displays
	MOVF        _contador+0, 0 
	MOVWF       FARG_atualizaDisplays_valor+0 
	MOVF        _contador+1, 0 
	MOVWF       FARG_atualizaDisplays_valor+1 
	CALL        _atualizaDisplays+0, 0
;quest1.c,68 :: 		while (BUTTON == 0); // Aguarda até que o botão seja solto
L_main10:
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main11
	GOTO        L_main10
L_main11:
;quest1.c,69 :: 		}
L_main8:
;quest1.c,70 :: 		}
L_main6:
;quest1.c,71 :: 		}
	GOTO        L_main4
;quest1.c,72 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
