
_main:

;trabalhodoToni.c,36 :: 		void main(){
;trabalhodoToni.c,37 :: 		setup_inicial();
	CALL        _setup_inicial+0, 0
;trabalhodoToni.c,38 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;trabalhodoToni.c,39 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;trabalhodoToni.c,40 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;trabalhodoToni.c,41 :: 		while(1){
L_main0:
;trabalhodoToni.c,42 :: 		relogio();//atualiza o rel?gio
	CALL        _relogio+0, 0
;trabalhodoToni.c,43 :: 		escreve_lcd();//escreve no LCD os dados do rel?gio
	CALL        _escreve_lcd+0, 0
;trabalhodoToni.c,44 :: 		if(rb0_bit==0){//menu de op??es
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main2
;trabalhodoToni.c,45 :: 		while(rb0_bit == 0) delay_ms(100);
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
;trabalhodoToni.c,46 :: 		if(conta_menu < 7) conta_menu ++;
	MOVLW       128
	XORWF       _conta_menu+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main39
	MOVLW       7
	SUBWF       _conta_menu+0, 0 
L__main39:
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
	INFSNZ      _conta_menu+0, 1 
	INCF        _conta_menu+1, 1 
L_main6:
;trabalhodoToni.c,47 :: 		if(conta_menu == 7) conta_menu = 0;
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main40
	MOVLW       7
	XORWF       _conta_menu+0, 0 
L__main40:
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
	CLRF        _conta_menu+0 
	CLRF        _conta_menu+1 
L_main7:
;trabalhodoToni.c,48 :: 		}
L_main2:
;trabalhodoToni.c,49 :: 		if(rb1_bit == 0){//ok
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main8
;trabalhodoToni.c,50 :: 		while(rb1_bit == 0) delay_ms(100);
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
;trabalhodoToni.c,51 :: 		conta_menu = 0;//menu desligado
	CLRF        _conta_menu+0 
	CLRF        _conta_menu+1 
;trabalhodoToni.c,52 :: 		}
L_main8:
;trabalhodoToni.c,53 :: 		if(conta_menu == 1){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main41
	MOVLW       1
	XORWF       _conta_menu+0, 0 
L__main41:
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;trabalhodoToni.c,55 :: 		if(rb2_bit==0){//sobe
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main13
;trabalhodoToni.c,56 :: 		while(rb2_bit == 0) delay_ms(100);
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
;trabalhodoToni.c,57 :: 		if(minuto < 60) minuto ++;
	MOVLW       128
	XORWF       _minuto+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main42
	MOVLW       60
	SUBWF       _minuto+0, 0 
L__main42:
	BTFSC       STATUS+0, 0 
	GOTO        L_main17
	INFSNZ      _minuto+0, 1 
	INCF        _minuto+1, 1 
L_main17:
;trabalhodoToni.c,58 :: 		}
L_main13:
;trabalhodoToni.c,60 :: 		}
L_main12:
;trabalhodoToni.c,61 :: 		if(conta_menu == 2){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main43
	MOVLW       2
	XORWF       _conta_menu+0, 0 
L__main43:
	BTFSS       STATUS+0, 2 
	GOTO        L_main18
;trabalhodoToni.c,63 :: 		}
L_main18:
;trabalhodoToni.c,64 :: 		if(conta_menu == 3){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main44
	MOVLW       3
	XORWF       _conta_menu+0, 0 
L__main44:
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
;trabalhodoToni.c,66 :: 		}
L_main19:
;trabalhodoToni.c,67 :: 		if(conta_menu == 4){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main45
	MOVLW       4
	XORWF       _conta_menu+0, 0 
L__main45:
	BTFSS       STATUS+0, 2 
	GOTO        L_main20
;trabalhodoToni.c,69 :: 		}
L_main20:
;trabalhodoToni.c,70 :: 		if(conta_menu == 5){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main46
	MOVLW       5
	XORWF       _conta_menu+0, 0 
L__main46:
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
;trabalhodoToni.c,72 :: 		}
L_main21:
;trabalhodoToni.c,73 :: 		if(conta_menu == 6){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main47
	MOVLW       6
	XORWF       _conta_menu+0, 0 
L__main47:
	BTFSS       STATUS+0, 2 
	GOTO        L_main22
;trabalhodoToni.c,75 :: 		}
L_main22:
;trabalhodoToni.c,76 :: 		}
	GOTO        L_main0
;trabalhodoToni.c,77 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_setup_inicial:

;trabalhodoToni.c,79 :: 		void setup_inicial(){
;trabalhodoToni.c,81 :: 		portb = 0;
	CLRF        PORTB+0 
;trabalhodoToni.c,86 :: 		trisb = 15; //RB0,RB1,RB2 e RB3 como entradas
	MOVLW       15
	MOVWF       TRISB+0 
;trabalhodoToni.c,90 :: 		adcon1 = 15; //Configura como portas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;trabalhodoToni.c,91 :: 		cmcon = 7;   //desliga os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;trabalhodoToni.c,92 :: 		intcon2 = 0; //liga resistor pull up do portb
	CLRF        INTCON2+0 
;trabalhodoToni.c,93 :: 		T0CON = 197;
	MOVLW       197
	MOVWF       T0CON+0 
;trabalhodoToni.c,94 :: 		INTCON.TMR0IE = 1; //enable TMR0
	BSF         INTCON+0, 5 
;trabalhodoToni.c,95 :: 		INTCON.GIE = 1; //liga global interrupt enable
	BSF         INTCON+0, 7 
;trabalhodoToni.c,96 :: 		}
L_end_setup_inicial:
	RETURN      0
; end of _setup_inicial

_interrupt:

;trabalhodoToni.c,98 :: 		void interrupt(){
;trabalhodoToni.c,99 :: 		if(tmr0if_bit == 1){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt23
;trabalhodoToni.c,100 :: 		tmr0if_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;trabalhodoToni.c,101 :: 		contador ++;
	INFSNZ      _contador+0, 1 
	INCF        _contador+1, 1 
;trabalhodoToni.c,102 :: 		if(contador == 122){
	MOVLW       0
	XORWF       _contador+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt51
	MOVLW       122
	XORWF       _contador+0, 0 
L__interrupt51:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt24
;trabalhodoToni.c,104 :: 		contador = 0;
	CLRF        _contador+0 
	CLRF        _contador+1 
;trabalhodoToni.c,105 :: 		segundo ++;
	INFSNZ      _segundo+0, 1 
	INCF        _segundo+1, 1 
;trabalhodoToni.c,106 :: 		}
L_interrupt24:
;trabalhodoToni.c,107 :: 		}
L_interrupt23:
;trabalhodoToni.c,108 :: 		}
L_end_interrupt:
L__interrupt50:
	RETFIE      1
; end of _interrupt

_escreve_lcd:

;trabalhodoToni.c,110 :: 		void escreve_lcd(){
;trabalhodoToni.c,111 :: 		lcd_out(1,1,"");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_trabalhodoToni+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_trabalhodoToni+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;trabalhodoToni.c,112 :: 		escreve_dia();
	CALL        _escreve_dia+0, 0
;trabalhodoToni.c,113 :: 		escreve_mes();
	CALL        _escreve_mes+0, 0
;trabalhodoToni.c,114 :: 		escreve_ano();
	CALL        _escreve_ano+0, 0
;trabalhodoToni.c,115 :: 		lcd_out(2,1,"");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_trabalhodoToni+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_trabalhodoToni+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;trabalhodoToni.c,116 :: 		escreve_dia_semana();
	CALL        _escreve_dia_semana+0, 0
;trabalhodoToni.c,117 :: 		escreve_hora();
	CALL        _escreve_hora+0, 0
;trabalhodoToni.c,118 :: 		}
L_end_escreve_lcd:
	RETURN      0
; end of _escreve_lcd

_escreve_dia:

;trabalhodoToni.c,119 :: 		void escreve_dia(){
;trabalhodoToni.c,120 :: 		inttostr(dia,txt);
	MOVF        _dia+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _dia+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;trabalhodoToni.c,121 :: 		if(dia < 10)lcd_out_cp("0");
	MOVLW       128
	XORWF       _dia+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_dia54
	MOVLW       10
	SUBWF       _dia+0, 0 
L__escreve_dia54:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_dia25
	MOVLW       ?lstr3_trabalhodoToni+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr3_trabalhodoToni+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_dia25:
;trabalhodoToni.c,122 :: 		lcd_out_cp(ltrim(txt));
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
;trabalhodoToni.c,123 :: 		lcd_out_cp(" ");
	MOVLW       ?lstr4_trabalhodoToni+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr4_trabalhodoToni+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;trabalhodoToni.c,124 :: 		}
L_end_escreve_dia:
	RETURN      0
; end of _escreve_dia

_escreve_mes:

;trabalhodoToni.c,125 :: 		void escreve_mes(){
;trabalhodoToni.c,126 :: 		if(mes == 10) lcd_out_cp("Outubro  ");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes56
	MOVLW       10
	XORWF       _mes+0, 0 
L__escreve_mes56:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes26
	MOVLW       ?lstr5_trabalhodoToni+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr5_trabalhodoToni+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes26:
;trabalhodoToni.c,127 :: 		}
L_end_escreve_mes:
	RETURN      0
; end of _escreve_mes

_escreve_ano:

;trabalhodoToni.c,128 :: 		void escreve_ano(){
;trabalhodoToni.c,129 :: 		inttostr(ano,txt);
	MOVF        _ano+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _ano+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;trabalhodoToni.c,130 :: 		lcd_out_cp(ltrim(txt));
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
;trabalhodoToni.c,131 :: 		}
L_end_escreve_ano:
	RETURN      0
; end of _escreve_ano

_escreve_dia_semana:

;trabalhodoToni.c,133 :: 		void escreve_dia_semana(){
;trabalhodoToni.c,134 :: 		if(dia_semana == 3)lcd_out_cp("Terca   ");
	MOVLW       0
	XORWF       _dia_semana+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_dia_semana59
	MOVLW       3
	XORWF       _dia_semana+0, 0 
L__escreve_dia_semana59:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_dia_semana27
	MOVLW       ?lstr6_trabalhodoToni+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr6_trabalhodoToni+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_dia_semana27:
;trabalhodoToni.c,135 :: 		}
L_end_escreve_dia_semana:
	RETURN      0
; end of _escreve_dia_semana

_escreve_hora:

;trabalhodoToni.c,136 :: 		void escreve_hora(){
;trabalhodoToni.c,137 :: 		lcd_out_cp("08:");
	MOVLW       ?lstr7_trabalhodoToni+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr7_trabalhodoToni+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;trabalhodoToni.c,140 :: 		if((conta_menu == 1)&&(contador < 61))lcd_out_cp("  ");
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora61
	MOVLW       1
	XORWF       _conta_menu+0, 0 
L__escreve_hora61:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_hora30
	MOVLW       128
	XORWF       _contador+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora62
	MOVLW       61
	SUBWF       _contador+0, 0 
L__escreve_hora62:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora30
L__escreve_hora37:
	MOVLW       ?lstr8_trabalhodoToni+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr8_trabalhodoToni+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_escreve_hora31
L_escreve_hora30:
;trabalhodoToni.c,142 :: 		inttostr(minuto,txt);
	MOVF        _minuto+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _minuto+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;trabalhodoToni.c,143 :: 		if(minuto < 10)lcd_out_cp("0");
	MOVLW       128
	XORWF       _minuto+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora63
	MOVLW       10
	SUBWF       _minuto+0, 0 
L__escreve_hora63:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora32
	MOVLW       ?lstr9_trabalhodoToni+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr9_trabalhodoToni+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_hora32:
;trabalhodoToni.c,144 :: 		lcd_out_cp(ltrim(txt));
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
;trabalhodoToni.c,145 :: 		}
L_escreve_hora31:
;trabalhodoToni.c,148 :: 		if(contador < 61)lcd_out_cp(":");
	MOVLW       128
	XORWF       _contador+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora64
	MOVLW       61
	SUBWF       _contador+0, 0 
L__escreve_hora64:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora33
	MOVLW       ?lstr10_trabalhodoToni+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr10_trabalhodoToni+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_escreve_hora34
L_escreve_hora33:
;trabalhodoToni.c,149 :: 		else lcd_out_cp(" ");
	MOVLW       ?lstr11_trabalhodoToni+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr11_trabalhodoToni+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_hora34:
;trabalhodoToni.c,152 :: 		inttostr(segundo,txt);
	MOVF        _segundo+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _segundo+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;trabalhodoToni.c,153 :: 		if(segundo < 10)lcd_out_cp("0");
	MOVLW       128
	XORWF       _segundo+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora65
	MOVLW       10
	SUBWF       _segundo+0, 0 
L__escreve_hora65:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora35
	MOVLW       ?lstr12_trabalhodoToni+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr12_trabalhodoToni+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_hora35:
;trabalhodoToni.c,154 :: 		lcd_out_cp(ltrim(txt));
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
;trabalhodoToni.c,155 :: 		}
L_end_escreve_hora:
	RETURN      0
; end of _escreve_hora

_relogio:

;trabalhodoToni.c,156 :: 		void relogio(){
;trabalhodoToni.c,157 :: 		if(segundo == 60){
	MOVLW       0
	XORWF       _segundo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__relogio67
	MOVLW       60
	XORWF       _segundo+0, 0 
L__relogio67:
	BTFSS       STATUS+0, 2 
	GOTO        L_relogio36
;trabalhodoToni.c,158 :: 		segundo = 0;
	CLRF        _segundo+0 
	CLRF        _segundo+1 
;trabalhodoToni.c,159 :: 		}
L_relogio36:
;trabalhodoToni.c,160 :: 		}
L_end_relogio:
	RETURN      0
; end of _relogio
