
_main:

;conversorAdded.c,22 :: 		void main() {
;conversorAdded.c,23 :: 		setup_inicial();// Configura o micro
	CALL        _setup_inicial+0, 0
;conversorAdded.c,24 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;conversorAdded.c,25 :: 		lcd_cmd(_LCD_CURSOR_OFF);//apaga
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;conversorAdded.c,26 :: 		lcd_Cmd(_LCD_CLEAR);//limpa
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;conversorAdded.c,27 :: 		while(1){
L_main0:
;conversorAdded.c,28 :: 		valor_medido = ADC_Read(0);// Medição RA0
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       _valor_medido+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       _valor_medido+1 
;conversorAdded.c,29 :: 		resposta = (valor * 0.4901) + 0.3937;
	MOVF        _valor+0, 0 
	MOVWF       R0 
	MOVF        _valor+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       99
	MOVWF       R4 
	MOVLW       238
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       12
	MOVWF       R4 
	MOVLW       147
	MOVWF       R5 
	MOVLW       73
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _resposta+0 
	MOVF        R1, 0 
	MOVWF       _resposta+1 
;conversorAdded.c,30 :: 		inttostr(valor_medido,txt);
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;conversorAdded.c,31 :: 		lcd_out(1,1, "teste = ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_conversorAdded+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_conversorAdded+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;conversorAdded.c,32 :: 		lcd_out_CP(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;conversorAdded.c,33 :: 		}
	GOTO        L_main0
;conversorAdded.c,34 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_setup_inicial:

;conversorAdded.c,36 :: 		void setup_inicial(){
;conversorAdded.c,37 :: 		porta = 0;
	CLRF        PORTA+0 
;conversorAdded.c,38 :: 		portb = 0;
	CLRF        PORTB+0 
;conversorAdded.c,39 :: 		portc = 0;
	CLRF        PORTC+0 
;conversorAdded.c,40 :: 		portd = 0;
	CLRF        PORTD+0 
;conversorAdded.c,41 :: 		porte = 0;
	CLRF        PORTE+0 
;conversorAdded.c,42 :: 		trisa = 1;
	MOVLW       1
	MOVWF       TRISA+0 
;conversorAdded.c,43 :: 		trisb = 15; //RB0,RB1,RB2 e RB3 como entradas
	MOVLW       15
	MOVWF       TRISB+0 
;conversorAdded.c,44 :: 		trisc = 0;
	CLRF        TRISC+0 
;conversorAdded.c,45 :: 		trisd = 0;
	CLRF        TRISD+0 
;conversorAdded.c,46 :: 		trise = 0;
	CLRF        TRISE+0 
;conversorAdded.c,47 :: 		adcon1 = 14; //Configura como portas digitais
	MOVLW       14
	MOVWF       ADCON1+0 
;conversorAdded.c,48 :: 		cmcon = 7;   //desliga os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;conversorAdded.c,49 :: 		intcon2 = 0; //liga resistor pull up do portb
	CLRF        INTCON2+0 
;conversorAdded.c,50 :: 		ADC_init();// inicia o conversor ad
	CALL        _ADC_Init+0, 0
;conversorAdded.c,51 :: 		}
L_end_setup_inicial:
	RETURN      0
; end of _setup_inicial
