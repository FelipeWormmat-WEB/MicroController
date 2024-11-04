
_main:

;Transmissao.c,18 :: 		void main() {
;Transmissao.c,20 :: 		setupInicial();
	CALL        _setupInicial+0, 0
;Transmissao.c,21 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;Transmissao.c,22 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Transmissao.c,23 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Transmissao.c,25 :: 		UART1_Init(19200); // iniciliza a serial em  19200bps
	BSF         BAUDCON+0, 3, 0
	MOVLW       1
	MOVWF       SPBRGH+0 
	MOVLW       3
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Transmissao.c,27 :: 		while(1){
L_main0:
;Transmissao.c,30 :: 		UART1_Write('F');
	MOVLW       70
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Transmissao.c,31 :: 		Delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
;Transmissao.c,32 :: 		UART1_Write('T');
	MOVLW       84
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Transmissao.c,33 :: 		Delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
;Transmissao.c,34 :: 		UART1_Write('E');
	MOVLW       69
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Transmissao.c,35 :: 		Delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
;Transmissao.c,36 :: 		UART1_Write('C');
	MOVLW       67
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Transmissao.c,37 :: 		Delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
;Transmissao.c,38 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Transmissao.c,39 :: 		Delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
;Transmissao.c,40 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Transmissao.c,41 :: 		Delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;Transmissao.c,42 :: 		}
	GOTO        L_main0
;Transmissao.c,43 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_setupInicial:

;Transmissao.c,45 :: 		void setupInicial()
;Transmissao.c,47 :: 		porta = 0;
	CLRF        PORTA+0 
;Transmissao.c,48 :: 		portb = 0;
	CLRF        PORTB+0 
;Transmissao.c,49 :: 		portc = 0;
	CLRF        PORTC+0 
;Transmissao.c,50 :: 		portd = 0;
	CLRF        PORTD+0 
;Transmissao.c,51 :: 		porte = 0;
	CLRF        PORTE+0 
;Transmissao.c,53 :: 		trisa = 0; // PORTA COMO SAIDA
	CLRF        TRISA+0 
;Transmissao.c,54 :: 		trisb = 15;
	MOVLW       15
	MOVWF       TRISB+0 
;Transmissao.c,55 :: 		trisc = 128; // rc7(rx) como entrada
	MOVLW       128
	MOVWF       TRISC+0 
;Transmissao.c,56 :: 		trisd = 0; // tudo como sa?da
	CLRF        TRISD+0 
;Transmissao.c,57 :: 		trise = 0; // tudo como sa?da
	CLRF        TRISE+0 
;Transmissao.c,59 :: 		adcon1 = 15; // todas são entradas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;Transmissao.c,60 :: 		cmcon = 7;   // desliga os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;Transmissao.c,61 :: 		intcon2 = 0; // liga resistor pull up do portb
	CLRF        INTCON2+0 
;Transmissao.c,63 :: 		}
L_end_setupInicial:
	RETURN      0
; end of _setupInicial
