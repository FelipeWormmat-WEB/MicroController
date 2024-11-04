
_main:

;ProvaGA.c,35 :: 		void main() {
;ProvaGA.c,37 :: 		setupInicial();
	CALL        _setupInicial+0, 0
;ProvaGA.c,39 :: 		while(1){
L_main0:
;ProvaGA.c,40 :: 		escreveTela(0,0,"");
	CLRF        FARG_escreveTela_linha+0 
	CLRF        FARG_escreveTela_linha+1 
	CLRF        FARG_escreveTela_coluna+0 
	CLRF        FARG_escreveTela_coluna+1 
	MOVLW       ?lstr1_ProvaGA+0
	MOVWF       FARG_escreveTela_txtAux+0 
	MOVLW       hi_addr(?lstr1_ProvaGA+0)
	MOVWF       FARG_escreveTela_txtAux+1 
	CALL        _escreveTela+0, 0
;ProvaGA.c,42 :: 		if(RB0_bit == 0){ // Sequencia
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main2
;ProvaGA.c,43 :: 		while(RB0_bit == 0) delay_ms(100);
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
;ProvaGA.c,44 :: 		funcQuestao1();
	CALL        _funcQuestao1+0, 0
;ProvaGA.c,45 :: 		}
L_main2:
;ProvaGA.c,47 :: 		if(RB1_bit == 0){ // Nome e RA no LCD
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main6
;ProvaGA.c,48 :: 		while(RB1_bit == 0) delay_ms(100);
L_main7:
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
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
;ProvaGA.c,49 :: 		funcQuestao2();
	CALL        _funcQuestao2+0, 0
;ProvaGA.c,50 :: 		}
L_main6:
;ProvaGA.c,52 :: 		if(RB2_bit == 0){ // Contador ate RA
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main10
;ProvaGA.c,53 :: 		while(RB2_bit == 0) delay_ms(100);
L_main11:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
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
;ProvaGA.c,54 :: 		funcQuestao3();
	CALL        _funcQuestao3+0, 0
;ProvaGA.c,55 :: 		}
L_main10:
;ProvaGA.c,57 :: 		if(RB3_bit == 0){ // Reseta RA
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main14
;ProvaGA.c,58 :: 		while(RB3_bit == 0) delay_ms(100);
L_main15:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
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
;ProvaGA.c,59 :: 		funcQuestao4();
	CALL        _funcQuestao4+0, 0
;ProvaGA.c,60 :: 		}
L_main14:
;ProvaGA.c,62 :: 		if(RA4_bit == 1){ // Contador ao contrario
	BTFSS       RA4_bit+0, BitPos(RA4_bit+0) 
	GOTO        L_main18
;ProvaGA.c,63 :: 		while(RA4_bit == 1) delay_ms(100);
L_main19:
	BTFSS       RA4_bit+0, BitPos(RA4_bit+0) 
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
;ProvaGA.c,64 :: 		funcQuestao5();
	CALL        _funcQuestao5+0, 0
;ProvaGA.c,65 :: 		}
L_main18:
;ProvaGA.c,66 :: 		}
	GOTO        L_main0
;ProvaGA.c,67 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;ProvaGA.c,69 :: 		void interrupt(){
;ProvaGA.c,70 :: 		if(tmr0if_bit == 1){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt22
;ProvaGA.c,71 :: 		tmr0if_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;ProvaGA.c,72 :: 		count_interrupt++;
	INFSNZ      _count_interrupt+0, 1 
	INCF        _count_interrupt+1, 1 
;ProvaGA.c,73 :: 		if(count_interrupt == 38){
	MOVLW       0
	XORWF       _count_interrupt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt40
	MOVLW       38
	XORWF       _count_interrupt+0, 0 
L__interrupt40:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt23
;ProvaGA.c,74 :: 		if(CountInt <= 60){
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _CountInt+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt41
	MOVF        _CountInt+0, 0 
	SUBLW       60
L__interrupt41:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt24
;ProvaGA.c,75 :: 		CountInt++;
	INFSNZ      _CountInt+0, 1 
	INCF        _CountInt+1, 1 
;ProvaGA.c,76 :: 		} else {
	GOTO        L_interrupt25
L_interrupt24:
;ProvaGA.c,77 :: 		CountInt = 0;
	CLRF        _CountInt+0 
	CLRF        _CountInt+1 
;ProvaGA.c,78 :: 		}
L_interrupt25:
;ProvaGA.c,79 :: 		count_interrupt = 0;
	CLRF        _count_interrupt+0 
	CLRF        _count_interrupt+1 
;ProvaGA.c,80 :: 		}
L_interrupt23:
;ProvaGA.c,81 :: 		}
L_interrupt22:
;ProvaGA.c,82 :: 		}
L_end_interrupt:
L__interrupt39:
	RETFIE      1
; end of _interrupt

_setupInicial:

;ProvaGA.c,84 :: 		void setupInicial(){
;ProvaGA.c,85 :: 		porta = 0;
	CLRF        PORTA+0 
;ProvaGA.c,86 :: 		portb = 0;
	CLRF        PORTB+0 
;ProvaGA.c,87 :: 		portc = 0;
	CLRF        PORTC+0 
;ProvaGA.c,88 :: 		portd = 0;
	CLRF        PORTD+0 
;ProvaGA.c,89 :: 		porte = 0;
	CLRF        PORTE+0 
;ProvaGA.c,91 :: 		trisa = 51; //ra5,ra4,ra1,ra0 s?o entradas
	MOVLW       51
	MOVWF       TRISA+0 
;ProvaGA.c,92 :: 		trisb = 15;
	MOVLW       15
	MOVWF       TRISB+0 
;ProvaGA.c,93 :: 		trisc = 0;
	CLRF        TRISC+0 
;ProvaGA.c,94 :: 		trisd = 0;
	CLRF        TRISD+0 
;ProvaGA.c,95 :: 		trise = 0;
	CLRF        TRISE+0 
;ProvaGA.c,97 :: 		ra3_bit = 1; // liga o display
	BSF         RA3_bit+0, BitPos(RA3_bit+0) 
;ProvaGA.c,99 :: 		intcon2 = 0; // liga os canais de saida digital
	CLRF        INTCON2+0 
;ProvaGA.c,100 :: 		adcon1 = 15; // liga resistor pullup
	MOVLW       15
	MOVWF       ADCON1+0 
;ProvaGA.c,101 :: 		cmcon = 7;   // desliga os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;ProvaGA.c,103 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;ProvaGA.c,104 :: 		delay_ms(1000); // inicializa o LCD
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_setupInicial26:
	DECFSZ      R13, 1, 1
	BRA         L_setupInicial26
	DECFSZ      R12, 1, 1
	BRA         L_setupInicial26
	DECFSZ      R11, 1, 1
	BRA         L_setupInicial26
	NOP
;ProvaGA.c,105 :: 		lcd_cmd(_Lcd_cursor_off); // apaga o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGA.c,106 :: 		lcd_cmd(_Lcd_clear); // limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGA.c,108 :: 		intcon = 0;  // desabilita as interrupcoes
	CLRF        INTCON+0 
;ProvaGA.c,109 :: 		tmr0ie_bit = 1;  // liga o tmr0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;ProvaGA.c,110 :: 		t0con = 199; // configura tmr0 | 8 bits, prescaler em 256
	MOVLW       199
	MOVWF       T0CON+0 
;ProvaGA.c,111 :: 		gie_bit = 1; // liga a chave geral das interrupcoes
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;ProvaGA.c,112 :: 		}
L_end_setupInicial:
	RETURN      0
; end of _setupInicial

_escreveTela:

;ProvaGA.c,114 :: 		void escreveTela(int linha, int coluna, char *txtAux){
;ProvaGA.c,117 :: 		lcd_out(linha,coluna,"");
	MOVF        FARG_escreveTela_linha+0, 0 
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        FARG_escreveTela_coluna+0, 0 
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_ProvaGA+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_ProvaGA+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProvaGA.c,118 :: 		lcd_out_cp(ltrim(txtAux));
	MOVF        FARG_escreveTela_txtAux+0, 0 
	MOVWF       FARG_Ltrim_string+0 
	MOVF        FARG_escreveTela_txtAux+1, 0 
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;ProvaGA.c,119 :: 		lcd_out_cp(ltrim(txt));
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
;ProvaGA.c,121 :: 		inttostr(CountInt,txtInt);
	MOVF        _CountInt+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _CountInt+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       escreveTela_txtInt_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(escreveTela_txtInt_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProvaGA.c,122 :: 		lcd_out(2,15,ltrim(txtInt));
	MOVLW       escreveTela_txtInt_L0+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(escreveTela_txtInt_L0+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;ProvaGA.c,123 :: 		}
L_end_escreveTela:
	RETURN      0
; end of _escreveTela

_funcQuestao1:

;ProvaGA.c,125 :: 		void funcQuestao1(){ // Sequencia
;ProvaGA.c,126 :: 		portc = 0;
	CLRF        PORTC+0 
;ProvaGA.c,127 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_funcQuestao127:
	DECFSZ      R13, 1, 1
	BRA         L_funcQuestao127
	DECFSZ      R12, 1, 1
	BRA         L_funcQuestao127
	DECFSZ      R11, 1, 1
	BRA         L_funcQuestao127
	NOP
;ProvaGA.c,128 :: 		portc = 8;
	MOVLW       8
	MOVWF       PORTC+0 
;ProvaGA.c,129 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_funcQuestao128:
	DECFSZ      R13, 1, 1
	BRA         L_funcQuestao128
	DECFSZ      R12, 1, 1
	BRA         L_funcQuestao128
	DECFSZ      R11, 1, 1
	BRA         L_funcQuestao128
	NOP
;ProvaGA.c,130 :: 		portc = 12;
	MOVLW       12
	MOVWF       PORTC+0 
;ProvaGA.c,131 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_funcQuestao129:
	DECFSZ      R13, 1, 1
	BRA         L_funcQuestao129
	DECFSZ      R12, 1, 1
	BRA         L_funcQuestao129
	DECFSZ      R11, 1, 1
	BRA         L_funcQuestao129
	NOP
;ProvaGA.c,132 :: 		portc = 14;
	MOVLW       14
	MOVWF       PORTC+0 
;ProvaGA.c,133 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_funcQuestao130:
	DECFSZ      R13, 1, 1
	BRA         L_funcQuestao130
	DECFSZ      R12, 1, 1
	BRA         L_funcQuestao130
	DECFSZ      R11, 1, 1
	BRA         L_funcQuestao130
	NOP
;ProvaGA.c,134 :: 		portc = 15;
	MOVLW       15
	MOVWF       PORTC+0 
;ProvaGA.c,135 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_funcQuestao131:
	DECFSZ      R13, 1, 1
	BRA         L_funcQuestao131
	DECFSZ      R12, 1, 1
	BRA         L_funcQuestao131
	DECFSZ      R11, 1, 1
	BRA         L_funcQuestao131
	NOP
;ProvaGA.c,136 :: 		}
L_end_funcQuestao1:
	RETURN      0
; end of _funcQuestao1

_funcQuestao2:

;ProvaGA.c,138 :: 		void funcQuestao2(){ // Nome e RA no LCD
;ProvaGA.c,139 :: 		lcd_cmd(_Lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGA.c,141 :: 		strcpy(txt, "Elivelton G.");
	MOVLW       _txt+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr3_ProvaGA+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr3_ProvaGA+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ProvaGA.c,142 :: 		escreveTela(1,1,"");
	MOVLW       1
	MOVWF       FARG_escreveTela_linha+0 
	MOVLW       0
	MOVWF       FARG_escreveTela_linha+1 
	MOVLW       1
	MOVWF       FARG_escreveTela_coluna+0 
	MOVLW       0
	MOVWF       FARG_escreveTela_coluna+1 
	MOVLW       ?lstr4_ProvaGA+0
	MOVWF       FARG_escreveTela_txtAux+0 
	MOVLW       hi_addr(?lstr4_ProvaGA+0)
	MOVWF       FARG_escreveTela_txtAux+1 
	CALL        _escreveTela+0, 0
;ProvaGA.c,143 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_funcQuestao232:
	DECFSZ      R13, 1, 1
	BRA         L_funcQuestao232
	DECFSZ      R12, 1, 1
	BRA         L_funcQuestao232
	DECFSZ      R11, 1, 1
	BRA         L_funcQuestao232
	NOP
;ProvaGA.c,144 :: 		strcpy(txt, "023960");
	MOVLW       _txt+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr5_ProvaGA+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr5_ProvaGA+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ProvaGA.c,145 :: 		escreveTela(2,9,"");
	MOVLW       2
	MOVWF       FARG_escreveTela_linha+0 
	MOVLW       0
	MOVWF       FARG_escreveTela_linha+1 
	MOVLW       9
	MOVWF       FARG_escreveTela_coluna+0 
	MOVLW       0
	MOVWF       FARG_escreveTela_coluna+1 
	MOVLW       ?lstr6_ProvaGA+0
	MOVWF       FARG_escreveTela_txtAux+0 
	MOVLW       hi_addr(?lstr6_ProvaGA+0)
	MOVWF       FARG_escreveTela_txtAux+1 
	CALL        _escreveTela+0, 0
;ProvaGA.c,146 :: 		}
L_end_funcQuestao2:
	RETURN      0
; end of _funcQuestao2

_funcQuestao3:

;ProvaGA.c,148 :: 		void funcQuestao3(){ // Contador ate RA
;ProvaGA.c,149 :: 		CountRA = 0;
	CLRF        _CountRA+0 
	CLRF        _CountRA+1 
;ProvaGA.c,150 :: 		lcd_cmd(_Lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGA.c,152 :: 		while (CountRA <= 23960){
L_funcQuestao333:
	MOVLW       128
	XORLW       93
	MOVWF       R0 
	MOVLW       128
	XORWF       _CountRA+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__funcQuestao347
	MOVF        _CountRA+0, 0 
	SUBLW       152
L__funcQuestao347:
	BTFSS       STATUS+0, 0 
	GOTO        L_funcQuestao334
;ProvaGA.c,153 :: 		inttostr(CountRA,txt);
	MOVF        _CountRA+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _CountRA+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProvaGA.c,154 :: 		escreveTela(1,1,"RA : ");
	MOVLW       1
	MOVWF       FARG_escreveTela_linha+0 
	MOVLW       0
	MOVWF       FARG_escreveTela_linha+1 
	MOVLW       1
	MOVWF       FARG_escreveTela_coluna+0 
	MOVLW       0
	MOVWF       FARG_escreveTela_coluna+1 
	MOVLW       ?lstr7_ProvaGA+0
	MOVWF       FARG_escreveTela_txtAux+0 
	MOVLW       hi_addr(?lstr7_ProvaGA+0)
	MOVWF       FARG_escreveTela_txtAux+1 
	CALL        _escreveTela+0, 0
;ProvaGA.c,155 :: 		CountRA++;
	INFSNZ      _CountRA+0, 1 
	INCF        _CountRA+1, 1 
;ProvaGA.c,156 :: 		}
	GOTO        L_funcQuestao333
L_funcQuestao334:
;ProvaGA.c,157 :: 		}
L_end_funcQuestao3:
	RETURN      0
; end of _funcQuestao3

_funcQuestao4:

;ProvaGA.c,159 :: 		void funcQuestao4(){ // Reseta RA
;ProvaGA.c,160 :: 		CountRA = 0;
	CLRF        _CountRA+0 
	CLRF        _CountRA+1 
;ProvaGA.c,161 :: 		lcd_cmd(_Lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGA.c,162 :: 		inttostr(CountRA,txt);
	MOVF        _CountRA+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _CountRA+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProvaGA.c,163 :: 		escreveTela(1,1,"RA : ");
	MOVLW       1
	MOVWF       FARG_escreveTela_linha+0 
	MOVLW       0
	MOVWF       FARG_escreveTela_linha+1 
	MOVLW       1
	MOVWF       FARG_escreveTela_coluna+0 
	MOVLW       0
	MOVWF       FARG_escreveTela_coluna+1 
	MOVLW       ?lstr8_ProvaGA+0
	MOVWF       FARG_escreveTela_txtAux+0 
	MOVLW       hi_addr(?lstr8_ProvaGA+0)
	MOVWF       FARG_escreveTela_txtAux+1 
	CALL        _escreveTela+0, 0
;ProvaGA.c,164 :: 		}
L_end_funcQuestao4:
	RETURN      0
; end of _funcQuestao4

_funcQuestao5:

;ProvaGA.c,166 :: 		void funcQuestao5(){ // Contador ao contrario
;ProvaGA.c,167 :: 		CountRA = 23960;
	MOVLW       152
	MOVWF       _CountRA+0 
	MOVLW       93
	MOVWF       _CountRA+1 
;ProvaGA.c,168 :: 		lcd_cmd(_Lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProvaGA.c,170 :: 		while (CountRA >= 0){
L_funcQuestao535:
	MOVLW       128
	XORWF       _CountRA+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__funcQuestao550
	MOVLW       0
	SUBWF       _CountRA+0, 0 
L__funcQuestao550:
	BTFSS       STATUS+0, 0 
	GOTO        L_funcQuestao536
;ProvaGA.c,171 :: 		inttostr(CountRA,txt);
	MOVF        _CountRA+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _CountRA+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProvaGA.c,172 :: 		escreveTela(1,1,"RA : ");
	MOVLW       1
	MOVWF       FARG_escreveTela_linha+0 
	MOVLW       0
	MOVWF       FARG_escreveTela_linha+1 
	MOVLW       1
	MOVWF       FARG_escreveTela_coluna+0 
	MOVLW       0
	MOVWF       FARG_escreveTela_coluna+1 
	MOVLW       ?lstr9_ProvaGA+0
	MOVWF       FARG_escreveTela_txtAux+0 
	MOVLW       hi_addr(?lstr9_ProvaGA+0)
	MOVWF       FARG_escreveTela_txtAux+1 
	CALL        _escreveTela+0, 0
;ProvaGA.c,173 :: 		CountRA--;
	MOVLW       1
	SUBWF       _CountRA+0, 1 
	MOVLW       0
	SUBWFB      _CountRA+1, 1 
;ProvaGA.c,174 :: 		}
	GOTO        L_funcQuestao535
L_funcQuestao536:
;ProvaGA.c,175 :: 		}
L_end_funcQuestao5:
	RETURN      0
; end of _funcQuestao5
