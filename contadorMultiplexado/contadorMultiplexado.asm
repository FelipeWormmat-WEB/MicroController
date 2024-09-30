
_main:

;contadorMultiplexado.c,17 :: 		void main()
;contadorMultiplexado.c,19 :: 		setupInicial();
	CALL        _setupInicial+0, 0
;contadorMultiplexado.c,21 :: 		while (1)
L_main0:
;contadorMultiplexado.c,23 :: 		crescente();
	CALL        _crescente+0, 0
;contadorMultiplexado.c,24 :: 		crescenteRapido();
	CALL        _crescenteRapido+0, 0
;contadorMultiplexado.c,25 :: 		escreveDisplay();
	CALL        _escreveDisplay+0, 0
;contadorMultiplexado.c,26 :: 		reset();
	CALL        _reset+0, 0
;contadorMultiplexado.c,27 :: 		}
	GOTO        L_main0
;contadorMultiplexado.c,28 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_setupInicial:

;contadorMultiplexado.c,30 :: 		void setupInicial()
;contadorMultiplexado.c,32 :: 		PORTA = 0; // desliga a porta A
	CLRF        PORTA+0 
;contadorMultiplexado.c,33 :: 		PORTB = 0; // desliga a porta B
	CLRF        PORTB+0 
;contadorMultiplexado.c,34 :: 		PORTC = 0; // desliga a porta C.
	CLRF        PORTC+0 
;contadorMultiplexado.c,35 :: 		PORTD = 0; // desliga a porta D.
	CLRF        PORTD+0 
;contadorMultiplexado.c,36 :: 		PORTE = 0; // desliga a porta E.
	CLRF        PORTE+0 
;contadorMultiplexado.c,38 :: 		TRISA = 0;  // configura o porta como sa?da
	CLRF        TRISA+0 
;contadorMultiplexado.c,39 :: 		TRISB = 7; // define rb0, rb1 e  rb2 como entradas.
	MOVLW       7
	MOVWF       TRISB+0 
;contadorMultiplexado.c,40 :: 		TRISC = 0;  // configura o porta como sa?da
	CLRF        TRISC+0 
;contadorMultiplexado.c,41 :: 		TRISD = 0;  // configura o porta como sa?da
	CLRF        TRISD+0 
;contadorMultiplexado.c,42 :: 		TRISE = 0;  // configura o portc como sa?da.
	CLRF        TRISE+0 
;contadorMultiplexado.c,44 :: 		CMCON = 7;   // comparadores desligados.
	MOVLW       7
	MOVWF       CMCON+0 
;contadorMultiplexado.c,45 :: 		ADCON1 = 15; // todas as saidas digitais.
	MOVLW       15
	MOVWF       ADCON1+0 
;contadorMultiplexado.c,47 :: 		INTCON2 = 0; // liga resistor pull-up do PORTB
	CLRF        INTCON2+0 
;contadorMultiplexado.c,49 :: 		unidade = 3;
	MOVLW       3
	MOVWF       _unidade+0 
;contadorMultiplexado.c,50 :: 		dezena = 2;
	MOVLW       2
	MOVWF       _dezena+0 
;contadorMultiplexado.c,51 :: 		centena = 9;
	MOVLW       9
	MOVWF       _centena+0 
;contadorMultiplexado.c,52 :: 		milhar = 1;
	MOVLW       1
	MOVWF       _milhar+0 
;contadorMultiplexado.c,53 :: 		}
L_end_setupInicial:
	RETURN      0
; end of _setupInicial

_escreveDisplay:

;contadorMultiplexado.c,55 :: 		void escreveDisplay()
;contadorMultiplexado.c,57 :: 		RA3_bit = 0;
	BCF         RA3_bit+0, BitPos(RA3_bit+0) 
;contadorMultiplexado.c,58 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;contadorMultiplexado.c,59 :: 		RC4_bit = 0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;contadorMultiplexado.c,60 :: 		RC5_bit = 0;
	BCF         RC5_bit+0, BitPos(RC5_bit+0) 
;contadorMultiplexado.c,62 :: 		PORTD = decodifica(unidade);
	MOVF        _unidade+0, 0 
	MOVWF       FARG_decodifica_uni+0 
	CALL        _decodifica+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;contadorMultiplexado.c,63 :: 		RA3_bit = 1; // liga a unidade
	BSF         RA3_bit+0, BitPos(RA3_bit+0) 
;contadorMultiplexado.c,64 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_escreveDisplay2:
	DECFSZ      R13, 1, 1
	BRA         L_escreveDisplay2
	DECFSZ      R12, 1, 1
	BRA         L_escreveDisplay2
;contadorMultiplexado.c,66 :: 		RA3_bit = 0; // desliga a unidade
	BCF         RA3_bit+0, BitPos(RA3_bit+0) 
;contadorMultiplexado.c,67 :: 		PORTD = decodifica(dezena);
	MOVF        _dezena+0, 0 
	MOVWF       FARG_decodifica_uni+0 
	CALL        _decodifica+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;contadorMultiplexado.c,68 :: 		RE2_bit = 1; // liga a dezena
	BSF         RE2_bit+0, BitPos(RE2_bit+0) 
;contadorMultiplexado.c,69 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_escreveDisplay3:
	DECFSZ      R13, 1, 1
	BRA         L_escreveDisplay3
	DECFSZ      R12, 1, 1
	BRA         L_escreveDisplay3
;contadorMultiplexado.c,71 :: 		RE2_bit = 0; // desliga a dezena
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;contadorMultiplexado.c,72 :: 		PORTD = decodifica(centena);
	MOVF        _centena+0, 0 
	MOVWF       FARG_decodifica_uni+0 
	CALL        _decodifica+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;contadorMultiplexado.c,73 :: 		RC4_bit = 1; // liga a centena
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
;contadorMultiplexado.c,74 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_escreveDisplay4:
	DECFSZ      R13, 1, 1
	BRA         L_escreveDisplay4
	DECFSZ      R12, 1, 1
	BRA         L_escreveDisplay4
;contadorMultiplexado.c,76 :: 		RC4_bit = 0; // desliga a centena
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;contadorMultiplexado.c,77 :: 		PORTD = decodifica(milhar);
	MOVF        _milhar+0, 0 
	MOVWF       FARG_decodifica_uni+0 
	CALL        _decodifica+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;contadorMultiplexado.c,78 :: 		RC5_bit = 1; // liga a milhar
	BSF         RC5_bit+0, BitPos(RC5_bit+0) 
;contadorMultiplexado.c,79 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_escreveDisplay5:
	DECFSZ      R13, 1, 1
	BRA         L_escreveDisplay5
	DECFSZ      R12, 1, 1
	BRA         L_escreveDisplay5
;contadorMultiplexado.c,80 :: 		}
L_end_escreveDisplay:
	RETURN      0
; end of _escreveDisplay

_decodifica:

;contadorMultiplexado.c,82 :: 		char decodifica(char uni)
;contadorMultiplexado.c,84 :: 		switch (uni)
	GOTO        L_decodifica6
;contadorMultiplexado.c,86 :: 		case 0:
L_decodifica8:
;contadorMultiplexado.c,87 :: 		return 63;
	MOVLW       63
	MOVWF       R0 
	GOTO        L_end_decodifica
;contadorMultiplexado.c,90 :: 		case 1:
L_decodifica9:
;contadorMultiplexado.c,91 :: 		return 6;
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_decodifica
;contadorMultiplexado.c,94 :: 		case 2:
L_decodifica10:
;contadorMultiplexado.c,95 :: 		return 91;
	MOVLW       91
	MOVWF       R0 
	GOTO        L_end_decodifica
;contadorMultiplexado.c,98 :: 		case 3:
L_decodifica11:
;contadorMultiplexado.c,99 :: 		return 79;
	MOVLW       79
	MOVWF       R0 
	GOTO        L_end_decodifica
;contadorMultiplexado.c,102 :: 		case 4:
L_decodifica12:
;contadorMultiplexado.c,103 :: 		return 102;
	MOVLW       102
	MOVWF       R0 
	GOTO        L_end_decodifica
;contadorMultiplexado.c,106 :: 		case 5:
L_decodifica13:
;contadorMultiplexado.c,107 :: 		return 109;
	MOVLW       109
	MOVWF       R0 
	GOTO        L_end_decodifica
;contadorMultiplexado.c,110 :: 		case 6:
L_decodifica14:
;contadorMultiplexado.c,111 :: 		return 125;
	MOVLW       125
	MOVWF       R0 
	GOTO        L_end_decodifica
;contadorMultiplexado.c,114 :: 		case 7:
L_decodifica15:
;contadorMultiplexado.c,115 :: 		return 7;
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_decodifica
;contadorMultiplexado.c,118 :: 		case 8:
L_decodifica16:
;contadorMultiplexado.c,119 :: 		return 127;
	MOVLW       127
	MOVWF       R0 
	GOTO        L_end_decodifica
;contadorMultiplexado.c,122 :: 		case 9:
L_decodifica17:
;contadorMultiplexado.c,123 :: 		return 111;
	MOVLW       111
	MOVWF       R0 
	GOTO        L_end_decodifica
;contadorMultiplexado.c,125 :: 		}
L_decodifica6:
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica8
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica9
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica10
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica11
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica12
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica13
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica14
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica15
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica16
	MOVF        FARG_decodifica_uni+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_decodifica17
;contadorMultiplexado.c,126 :: 		}
L_end_decodifica:
	RETURN      0
; end of _decodifica

_crescente:

;contadorMultiplexado.c,128 :: 		void crescente()
;contadorMultiplexado.c,130 :: 		if (RB0_bit == 0)
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_crescente18
;contadorMultiplexado.c,132 :: 		while (RB0_bit == 0)
L_crescente19:
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_crescente20
;contadorMultiplexado.c,133 :: 		escreveDisplay();
	CALL        _escreveDisplay+0, 0
	GOTO        L_crescente19
L_crescente20:
;contadorMultiplexado.c,134 :: 		unidade++;
	INCF        _unidade+0, 1 
;contadorMultiplexado.c,135 :: 		if (unidade == 10)
	MOVF        _unidade+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_crescente21
;contadorMultiplexado.c,137 :: 		unidade = 0;
	CLRF        _unidade+0 
;contadorMultiplexado.c,138 :: 		dezena++;
	INCF        _dezena+0, 1 
;contadorMultiplexado.c,139 :: 		}
L_crescente21:
;contadorMultiplexado.c,140 :: 		if (dezena == 10)
	MOVF        _dezena+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_crescente22
;contadorMultiplexado.c,142 :: 		dezena = 0;
	CLRF        _dezena+0 
;contadorMultiplexado.c,143 :: 		centena++;
	INCF        _centena+0, 1 
;contadorMultiplexado.c,144 :: 		}
L_crescente22:
;contadorMultiplexado.c,145 :: 		if (centena == 10)
	MOVF        _centena+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_crescente23
;contadorMultiplexado.c,147 :: 		centena = 0;
	CLRF        _centena+0 
;contadorMultiplexado.c,148 :: 		milhar++;
	INCF        _milhar+0, 1 
;contadorMultiplexado.c,149 :: 		}
L_crescente23:
;contadorMultiplexado.c,150 :: 		if (milhar == 10)
	MOVF        _milhar+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_crescente24
;contadorMultiplexado.c,152 :: 		milhar = 0;
	CLRF        _milhar+0 
;contadorMultiplexado.c,153 :: 		}
L_crescente24:
;contadorMultiplexado.c,154 :: 		}
L_crescente18:
;contadorMultiplexado.c,155 :: 		}
L_end_crescente:
	RETURN      0
; end of _crescente

_crescenteRapido:

;contadorMultiplexado.c,156 :: 		void crescenteRapido()
;contadorMultiplexado.c,158 :: 		if (RB1_bit == 0)
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_crescenteRapido25
;contadorMultiplexado.c,160 :: 		escreveDisplay();
	CALL        _escreveDisplay+0, 0
;contadorMultiplexado.c,161 :: 		if (RB1_bit == 0)
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_crescenteRapido26
;contadorMultiplexado.c,163 :: 		unidade++;
	INCF        _unidade+0, 1 
;contadorMultiplexado.c,164 :: 		if (unidade == 10)
	MOVF        _unidade+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_crescenteRapido27
;contadorMultiplexado.c,166 :: 		unidade = 0;
	CLRF        _unidade+0 
;contadorMultiplexado.c,167 :: 		dezena++;
	INCF        _dezena+0, 1 
;contadorMultiplexado.c,168 :: 		}
L_crescenteRapido27:
;contadorMultiplexado.c,169 :: 		if (dezena == 10)
	MOVF        _dezena+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_crescenteRapido28
;contadorMultiplexado.c,171 :: 		dezena = 0;
	CLRF        _dezena+0 
;contadorMultiplexado.c,172 :: 		centena++;
	INCF        _centena+0, 1 
;contadorMultiplexado.c,173 :: 		}
L_crescenteRapido28:
;contadorMultiplexado.c,174 :: 		if (centena == 10)
	MOVF        _centena+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_crescenteRapido29
;contadorMultiplexado.c,176 :: 		centena = 0;
	CLRF        _centena+0 
;contadorMultiplexado.c,177 :: 		milhar++;
	INCF        _milhar+0, 1 
;contadorMultiplexado.c,178 :: 		}
L_crescenteRapido29:
;contadorMultiplexado.c,179 :: 		if (milhar == 10)
	MOVF        _milhar+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_crescenteRapido30
;contadorMultiplexado.c,181 :: 		milhar = 0;
	CLRF        _milhar+0 
;contadorMultiplexado.c,182 :: 		}
L_crescenteRapido30:
;contadorMultiplexado.c,183 :: 		}
L_crescenteRapido26:
;contadorMultiplexado.c,184 :: 		}
L_crescenteRapido25:
;contadorMultiplexado.c,185 :: 		}
L_end_crescenteRapido:
	RETURN      0
; end of _crescenteRapido

_reset:

;contadorMultiplexado.c,187 :: 		void reset()
;contadorMultiplexado.c,189 :: 		if (RB2_bit == 0)
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_reset31
;contadorMultiplexado.c,191 :: 		while (RB2_bit == 0)
L_reset32:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_reset33
;contadorMultiplexado.c,192 :: 		escreveDisplay();
	CALL        _escreveDisplay+0, 0
	GOTO        L_reset32
L_reset33:
;contadorMultiplexado.c,193 :: 		unidade = 0;
	CLRF        _unidade+0 
;contadorMultiplexado.c,194 :: 		dezena = 0;
	CLRF        _dezena+0 
;contadorMultiplexado.c,195 :: 		centena = 0;
	CLRF        _centena+0 
;contadorMultiplexado.c,196 :: 		milhar = 0;
	CLRF        _milhar+0 
;contadorMultiplexado.c,197 :: 		}
L_reset31:
;contadorMultiplexado.c,198 :: 		}
L_end_reset:
	RETURN      0
; end of _reset
