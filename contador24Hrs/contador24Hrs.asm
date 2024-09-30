
_main:

;contador24Hrs.c,12 :: 		void main() {
;contador24Hrs.c,13 :: 		setup_inicial();
	CALL        _setup_inicial+0, 0
;contador24Hrs.c,14 :: 		t0con = 199;//liga o tmr0
	MOVLW       199
	MOVWF       T0CON+0 
;contador24Hrs.c,15 :: 		intcon = 0;//desliga todas as interrrup??es
	CLRF        INTCON+0 
;contador24Hrs.c,16 :: 		tmr0ie_bit = 1;//liga a interrup??o do tmr0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;contador24Hrs.c,17 :: 		int0ie_bit = 1;//liga interrupcao do pino RB0
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;contador24Hrs.c,18 :: 		gie_bit = 1;//liga o sistema de interrup??es
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;contador24Hrs.c,19 :: 		while(1){
L_main0:
;contador24Hrs.c,20 :: 		escreve_display();
	CALL        _escreve_display+0, 0
;contador24Hrs.c,21 :: 		crescente();
	CALL        _crescente+0, 0
;contador24Hrs.c,22 :: 		ajuste();
	CALL        _ajuste+0, 0
;contador24Hrs.c,23 :: 		}
	GOTO        L_main0
;contador24Hrs.c,24 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_ajuste:

;contador24Hrs.c,25 :: 		void ajuste(){
;contador24Hrs.c,26 :: 		if(rb2_bit == 0) {
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_ajuste2
;contador24Hrs.c,27 :: 		while(rb2_bit == 0)escreve_display();
L_ajuste3:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_ajuste4
	CALL        _escreve_display+0, 0
	GOTO        L_ajuste3
L_ajuste4:
;contador24Hrs.c,28 :: 		unidade ++;
	INCF        _unidade+0, 1 
;contador24Hrs.c,29 :: 		if(unidade == 10){
	MOVF        _unidade+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_ajuste5
;contador24Hrs.c,30 :: 		unidade = 0;
	CLRF        _unidade+0 
;contador24Hrs.c,31 :: 		dezena ++;
	INCF        _dezena+0, 1 
;contador24Hrs.c,32 :: 		}
L_ajuste5:
;contador24Hrs.c,33 :: 		if(dezena == 6){
	MOVF        _dezena+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_ajuste6
;contador24Hrs.c,34 :: 		dezena = 0;
	CLRF        _dezena+0 
;contador24Hrs.c,35 :: 		}
L_ajuste6:
;contador24Hrs.c,36 :: 		}
L_ajuste2:
;contador24Hrs.c,37 :: 		if(rb1_bit == 0){
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_ajuste7
;contador24Hrs.c,38 :: 		while(rb1_bit == 0)escreve_display();
L_ajuste8:
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_ajuste9
	CALL        _escreve_display+0, 0
	GOTO        L_ajuste8
L_ajuste9:
;contador24Hrs.c,39 :: 		centena ++;
	INCF        _centena+0, 1 
;contador24Hrs.c,40 :: 		if(centena == 10){
	MOVF        _centena+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_ajuste10
;contador24Hrs.c,41 :: 		centena = 0;
	CLRF        _centena+0 
;contador24Hrs.c,42 :: 		milhar ++;
	INCF        _milhar+0, 1 
;contador24Hrs.c,43 :: 		}
L_ajuste10:
;contador24Hrs.c,44 :: 		}
L_ajuste7:
;contador24Hrs.c,45 :: 		if((milhar == 2)&&(centena == 4)){
	MOVF        _milhar+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_ajuste13
	MOVF        _centena+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_ajuste13
L__ajuste47:
;contador24Hrs.c,46 :: 		centena = 0;
	CLRF        _centena+0 
;contador24Hrs.c,47 :: 		milhar = 0;
	CLRF        _milhar+0 
;contador24Hrs.c,48 :: 		}
L_ajuste13:
;contador24Hrs.c,49 :: 		}
L_end_ajuste:
	RETURN      0
; end of _ajuste

_crescente:

;contador24Hrs.c,50 :: 		void crescente(){
;contador24Hrs.c,51 :: 		if (unidade == 10) {
	MOVF        _unidade+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_crescente14
;contador24Hrs.c,52 :: 		unidade = 0;
	CLRF        _unidade+0 
;contador24Hrs.c,53 :: 		dezena ++;
	INCF        _dezena+0, 1 
;contador24Hrs.c,54 :: 		}
L_crescente14:
;contador24Hrs.c,55 :: 		if (dezena == 6) {
	MOVF        _dezena+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_crescente15
;contador24Hrs.c,56 :: 		dezena = 0;
	CLRF        _dezena+0 
;contador24Hrs.c,57 :: 		centena ++;
	INCF        _centena+0, 1 
;contador24Hrs.c,58 :: 		}
L_crescente15:
;contador24Hrs.c,59 :: 		if (centena == 10) {
	MOVF        _centena+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_crescente16
;contador24Hrs.c,60 :: 		centena = 0;
	CLRF        _centena+0 
;contador24Hrs.c,61 :: 		milhar ++;
	INCF        _milhar+0, 1 
;contador24Hrs.c,62 :: 		}
L_crescente16:
;contador24Hrs.c,63 :: 		if((milhar == 2)&&(centena == 4)){
	MOVF        _milhar+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_crescente19
	MOVF        _centena+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_crescente19
L__crescente48:
;contador24Hrs.c,64 :: 		centena = 0;
	CLRF        _centena+0 
;contador24Hrs.c,65 :: 		milhar = 0;
	CLRF        _milhar+0 
;contador24Hrs.c,66 :: 		}
L_crescente19:
;contador24Hrs.c,67 :: 		}
L_end_crescente:
	RETURN      0
; end of _crescente

_setup_inicial:

;contador24Hrs.c,68 :: 		void setup_inicial(){
;contador24Hrs.c,69 :: 		porta = 0;
	CLRF        PORTA+0 
;contador24Hrs.c,70 :: 		trisa = 0;
	CLRF        TRISA+0 
;contador24Hrs.c,71 :: 		portb = 0;
	CLRF        PORTB+0 
;contador24Hrs.c,72 :: 		trisb = 7;//rb1 e rb2 como entrada
	MOVLW       7
	MOVWF       TRISB+0 
;contador24Hrs.c,73 :: 		portc = 0;
	CLRF        PORTC+0 
;contador24Hrs.c,74 :: 		trisc = 0;
	CLRF        TRISC+0 
;contador24Hrs.c,75 :: 		portd = 0;
	CLRF        PORTD+0 
;contador24Hrs.c,76 :: 		trisd = 0;
	CLRF        TRISD+0 
;contador24Hrs.c,77 :: 		porte = 0;
	CLRF        PORTE+0 
;contador24Hrs.c,78 :: 		trise = 0;
	CLRF        TRISE+0 
;contador24Hrs.c,79 :: 		adcon1 = 15;//configura como portas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;contador24Hrs.c,80 :: 		cmcon = 7;//desliga os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;contador24Hrs.c,81 :: 		intcon2 = 0;//liga resistor pull up do portb
	CLRF        INTCON2+0 
;contador24Hrs.c,82 :: 		unidade = 3;
	MOVLW       3
	MOVWF       _unidade+0 
;contador24Hrs.c,83 :: 		dezena = 2;
	MOVLW       2
	MOVWF       _dezena+0 
;contador24Hrs.c,84 :: 		centena = 9;
	MOVLW       9
	MOVWF       _centena+0 
;contador24Hrs.c,85 :: 		milhar = 1;
	MOVLW       1
	MOVWF       _milhar+0 
;contador24Hrs.c,86 :: 		}
L_end_setup_inicial:
	RETURN      0
; end of _setup_inicial

_escreve_display:

;contador24Hrs.c,87 :: 		void escreve_display(){
;contador24Hrs.c,88 :: 		portb = 0;
	CLRF        PORTB+0 
;contador24Hrs.c,89 :: 		portd = decodifica(unidade);
	MOVF        _unidade+0, 0 
	MOVWF       FARG_decodifica_entrada+0 
	CALL        _decodifica+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;contador24Hrs.c,90 :: 		rb4_bit = 1;
	BSF         RB4_bit+0, BitPos(RB4_bit+0) 
;contador24Hrs.c,91 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_escreve_display20:
	DECFSZ      R13, 1, 1
	BRA         L_escreve_display20
	DECFSZ      R12, 1, 1
	BRA         L_escreve_display20
;contador24Hrs.c,93 :: 		rb4_bit = 0;//desliga a unidade
	BCF         RB4_bit+0, BitPos(RB4_bit+0) 
;contador24Hrs.c,94 :: 		portd = decodifica(dezena);
	MOVF        _dezena+0, 0 
	MOVWF       FARG_decodifica_entrada+0 
	CALL        _decodifica+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;contador24Hrs.c,95 :: 		rb5_bit = 1;//liga a dezena
	BSF         RB5_bit+0, BitPos(RB5_bit+0) 
;contador24Hrs.c,96 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_escreve_display21:
	DECFSZ      R13, 1, 1
	BRA         L_escreve_display21
	DECFSZ      R12, 1, 1
	BRA         L_escreve_display21
;contador24Hrs.c,98 :: 		rb5_bit = 0;//desliga a dezena
	BCF         RB5_bit+0, BitPos(RB5_bit+0) 
;contador24Hrs.c,99 :: 		portd = decodifica(centena);
	MOVF        _centena+0, 0 
	MOVWF       FARG_decodifica_entrada+0 
	CALL        _decodifica+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;contador24Hrs.c,100 :: 		if(conta_interrupcao > 15) portd = portd + 128;
	MOVF        _conta_interrupcao+0, 0 
	SUBLW       15
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_display22
	MOVLW       128
	ADDWF       PORTD+0, 1 
L_escreve_display22:
;contador24Hrs.c,101 :: 		rb6_bit = 1;//liga a centena
	BSF         RB6_bit+0, BitPos(RB6_bit+0) 
;contador24Hrs.c,102 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_escreve_display23:
	DECFSZ      R13, 1, 1
	BRA         L_escreve_display23
	DECFSZ      R12, 1, 1
	BRA         L_escreve_display23
;contador24Hrs.c,104 :: 		rb6_bit = 0;//desliga a centena
	BCF         RB6_bit+0, BitPos(RB6_bit+0) 
;contador24Hrs.c,105 :: 		portd = decodifica(milhar);
	MOVF        _milhar+0, 0 
	MOVWF       FARG_decodifica_entrada+0 
	CALL        _decodifica+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;contador24Hrs.c,106 :: 		rb7_bit = 1;
	BSF         RB7_bit+0, BitPos(RB7_bit+0) 
;contador24Hrs.c,107 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_escreve_display24:
	DECFSZ      R13, 1, 1
	BRA         L_escreve_display24
	DECFSZ      R12, 1, 1
	BRA         L_escreve_display24
;contador24Hrs.c,108 :: 		}
L_end_escreve_display:
	RETURN      0
; end of _escreve_display

_decodifica:

;contador24Hrs.c,109 :: 		char decodifica(char entrada){
;contador24Hrs.c,111 :: 		if(entrada == 0)saida = 63;else
	MOVF        FARG_decodifica_entrada+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_decodifica25
	MOVLW       63
	MOVWF       R1 
	GOTO        L_decodifica26
L_decodifica25:
;contador24Hrs.c,112 :: 		if(entrada == 1)saida = 6;else
	MOVF        FARG_decodifica_entrada+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_decodifica27
	MOVLW       6
	MOVWF       R1 
	GOTO        L_decodifica28
L_decodifica27:
;contador24Hrs.c,113 :: 		if(entrada == 2)saida = 91;else
	MOVF        FARG_decodifica_entrada+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_decodifica29
	MOVLW       91
	MOVWF       R1 
	GOTO        L_decodifica30
L_decodifica29:
;contador24Hrs.c,114 :: 		if(entrada == 3)saida = 79;else
	MOVF        FARG_decodifica_entrada+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_decodifica31
	MOVLW       79
	MOVWF       R1 
	GOTO        L_decodifica32
L_decodifica31:
;contador24Hrs.c,115 :: 		if(entrada == 4)saida = 102;else
	MOVF        FARG_decodifica_entrada+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_decodifica33
	MOVLW       102
	MOVWF       R1 
	GOTO        L_decodifica34
L_decodifica33:
;contador24Hrs.c,116 :: 		if(entrada == 5)saida = 109;else
	MOVF        FARG_decodifica_entrada+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_decodifica35
	MOVLW       109
	MOVWF       R1 
	GOTO        L_decodifica36
L_decodifica35:
;contador24Hrs.c,117 :: 		if(entrada == 6)saida = 125;else
	MOVF        FARG_decodifica_entrada+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_decodifica37
	MOVLW       125
	MOVWF       R1 
	GOTO        L_decodifica38
L_decodifica37:
;contador24Hrs.c,118 :: 		if(entrada == 7)saida = 7;else
	MOVF        FARG_decodifica_entrada+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_decodifica39
	MOVLW       7
	MOVWF       R1 
	GOTO        L_decodifica40
L_decodifica39:
;contador24Hrs.c,119 :: 		if(entrada == 8)saida = 127;
	MOVF        FARG_decodifica_entrada+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_decodifica41
	MOVLW       127
	MOVWF       R1 
	GOTO        L_decodifica42
L_decodifica41:
;contador24Hrs.c,120 :: 		else saida = 111;
	MOVLW       111
	MOVWF       R1 
L_decodifica42:
L_decodifica40:
L_decodifica38:
L_decodifica36:
L_decodifica34:
L_decodifica32:
L_decodifica30:
L_decodifica28:
L_decodifica26:
;contador24Hrs.c,121 :: 		return(saida);
	MOVF        R1, 0 
	MOVWF       R0 
;contador24Hrs.c,122 :: 		}
L_end_decodifica:
	RETURN      0
; end of _decodifica

_interrupt:

;contador24Hrs.c,124 :: 		void interrupt(){
;contador24Hrs.c,125 :: 		if(tmr0if_bit == 1){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt43
;contador24Hrs.c,126 :: 		tmr0if_bit = 0;//desliga o sinalizador do tmr0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;contador24Hrs.c,127 :: 		conta_interrupcao ++;
	INCF        _conta_interrupcao+0, 1 
;contador24Hrs.c,128 :: 		if(conta_interrupcao == 30){
	MOVF        _conta_interrupcao+0, 0 
	XORLW       30
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt44
;contador24Hrs.c,130 :: 		conta_interrupcao = 0;
	CLRF        _conta_interrupcao+0 
;contador24Hrs.c,131 :: 		segundo ++;
	INCF        _segundo+0, 1 
;contador24Hrs.c,132 :: 		if(segundo == 60){
	MOVF        _segundo+0, 0 
	XORLW       60
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt45
;contador24Hrs.c,133 :: 		segundo = 0;
	CLRF        _segundo+0 
;contador24Hrs.c,134 :: 		unidade ++;
	INCF        _unidade+0, 1 
;contador24Hrs.c,135 :: 		}
L_interrupt45:
;contador24Hrs.c,136 :: 		}
L_interrupt44:
;contador24Hrs.c,137 :: 		}
L_interrupt43:
;contador24Hrs.c,138 :: 		if(int0if_bit == 1){//ocorreu emergencia
	BTFSS       INT0IF_bit+0, BitPos(INT0IF_bit+0) 
	GOTO        L_interrupt46
;contador24Hrs.c,139 :: 		int0if_bit = 0;//desliga o sinalizador de emergencia
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;contador24Hrs.c,140 :: 		unidade = 0;
	CLRF        _unidade+0 
;contador24Hrs.c,141 :: 		dezena = 0;
	CLRF        _dezena+0 
;contador24Hrs.c,142 :: 		centena = 0;
	CLRF        _centena+0 
;contador24Hrs.c,143 :: 		milhar = 0;
	CLRF        _milhar+0 
;contador24Hrs.c,144 :: 		}
L_interrupt46:
;contador24Hrs.c,145 :: 		}
L_end_interrupt:
L__interrupt56:
	RETFIE      1
; end of _interrupt
