
_main:

;ContadorFlash.c,23 :: 		void main() {
;ContadorFlash.c,24 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;ContadorFlash.c,25 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ContadorFlash.c,26 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ContadorFlash.c,27 :: 		setup_inicial();
	CALL        _setup_inicial+0, 0
;ContadorFlash.c,28 :: 		conta = flash_read(0x7f00);
	MOVLW       0
	MOVWF       FARG_FLASH_Read_address+0 
	MOVLW       127
	MOVWF       FARG_FLASH_Read_address+1 
	MOVLW       0
	MOVWF       FARG_FLASH_Read_address+2 
	MOVWF       FARG_FLASH_Read_address+3 
	CALL        _FLASH_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _conta+0 
	MOVLW       0
	MOVWF       _conta+1 
;ContadorFlash.c,29 :: 		while(1){
L_main0:
;ContadorFlash.c,30 :: 		if(rb0_bit == 0){
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main2
;ContadorFlash.c,31 :: 		while(rb0_bit == 0)delay_ms(100);
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
;ContadorFlash.c,32 :: 		conta ++;
	INFSNZ      _conta+0, 1 
	INCF        _conta+1, 1 
;ContadorFlash.c,33 :: 		vetor[0] = conta;
	MOVF        _conta+0, 0 
	MOVWF       _vetor+0 
	MOVF        _conta+1, 0 
	MOVWF       _vetor+1 
;ContadorFlash.c,34 :: 		flash_erase_write_64(0x7f00,vetor);
	MOVLW       0
	MOVWF       FARG_FLASH_Erase_Write_64_address+0 
	MOVLW       127
	MOVWF       FARG_FLASH_Erase_Write_64_address+1 
	MOVLW       0
	MOVWF       FARG_FLASH_Erase_Write_64_address+2 
	MOVWF       FARG_FLASH_Erase_Write_64_address+3 
	MOVLW       _vetor+0
	MOVWF       FARG_FLASH_Erase_Write_64_data_+0 
	MOVLW       hi_addr(_vetor+0)
	MOVWF       FARG_FLASH_Erase_Write_64_data_+1 
	CALL        _FLASH_Erase_Write_64+0, 0
;ContadorFlash.c,35 :: 		}
L_main2:
;ContadorFlash.c,36 :: 		if(rb1_bit == 0){
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main6
;ContadorFlash.c,37 :: 		while(rb1_bit == 0)delay_ms(100);
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
;ContadorFlash.c,38 :: 		conta --;
	MOVLW       1
	SUBWF       _conta+0, 1 
	MOVLW       0
	SUBWFB      _conta+1, 1 
;ContadorFlash.c,39 :: 		vetor[0] = conta;
	MOVF        _conta+0, 0 
	MOVWF       _vetor+0 
	MOVF        _conta+1, 0 
	MOVWF       _vetor+1 
;ContadorFlash.c,40 :: 		flash_erase_write_64(0x7f00,vetor);
	MOVLW       0
	MOVWF       FARG_FLASH_Erase_Write_64_address+0 
	MOVLW       127
	MOVWF       FARG_FLASH_Erase_Write_64_address+1 
	MOVLW       0
	MOVWF       FARG_FLASH_Erase_Write_64_address+2 
	MOVWF       FARG_FLASH_Erase_Write_64_address+3 
	MOVLW       _vetor+0
	MOVWF       FARG_FLASH_Erase_Write_64_data_+0 
	MOVLW       hi_addr(_vetor+0)
	MOVWF       FARG_FLASH_Erase_Write_64_data_+1 
	CALL        _FLASH_Erase_Write_64+0, 0
;ContadorFlash.c,41 :: 		}
L_main6:
;ContadorFlash.c,42 :: 		if(rb2_bit == 0){
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main10
;ContadorFlash.c,43 :: 		while(rb2_bit == 0)delay_ms(100);
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
;ContadorFlash.c,45 :: 		conta = 0;
	CLRF        _conta+0 
	CLRF        _conta+1 
;ContadorFlash.c,46 :: 		vetor[0] = conta;
	CLRF        _vetor+0 
	CLRF        _vetor+1 
;ContadorFlash.c,47 :: 		flash_erase_write_64(0x7f00,vetor);
	MOVLW       0
	MOVWF       FARG_FLASH_Erase_Write_64_address+0 
	MOVLW       127
	MOVWF       FARG_FLASH_Erase_Write_64_address+1 
	MOVLW       0
	MOVWF       FARG_FLASH_Erase_Write_64_address+2 
	MOVWF       FARG_FLASH_Erase_Write_64_address+3 
	MOVLW       _vetor+0
	MOVWF       FARG_FLASH_Erase_Write_64_data_+0 
	MOVLW       hi_addr(_vetor+0)
	MOVWF       FARG_FLASH_Erase_Write_64_data_+1 
	CALL        _FLASH_Erase_Write_64+0, 0
;ContadorFlash.c,48 :: 		}
L_main10:
;ContadorFlash.c,49 :: 		lcd_out(1,1,"Conta=");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ContadorFlash+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ContadorFlash+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ContadorFlash.c,50 :: 		inttostr(conta,txt);
	MOVF        _conta+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _conta+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ContadorFlash.c,51 :: 		lcd_out_cp(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;ContadorFlash.c,52 :: 		}
	GOTO        L_main0
;ContadorFlash.c,53 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_setup_inicial:

;ContadorFlash.c,54 :: 		void setup_inicial(){
;ContadorFlash.c,55 :: 		porta = 0;
	CLRF        PORTA+0 
;ContadorFlash.c,56 :: 		portb = 0;
	CLRF        PORTB+0 
;ContadorFlash.c,57 :: 		portc = 0;
	CLRF        PORTC+0 
;ContadorFlash.c,58 :: 		portd = 0;
	CLRF        PORTD+0 
;ContadorFlash.c,59 :: 		porte = 0;
	CLRF        PORTE+0 
;ContadorFlash.c,60 :: 		trisa = 0;
	CLRF        TRISA+0 
;ContadorFlash.c,61 :: 		trisb = 15; //RB0,RB1,RB2, RB3 como entradas
	MOVLW       15
	MOVWF       TRISB+0 
;ContadorFlash.c,62 :: 		trisc = 0;
	CLRF        TRISC+0 
;ContadorFlash.c,63 :: 		trisd = 0;
	CLRF        TRISD+0 
;ContadorFlash.c,64 :: 		trise = 0;
	CLRF        TRISE+0 
;ContadorFlash.c,65 :: 		adcon1 = 15; //Configura como portas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;ContadorFlash.c,66 :: 		cmcon = 7;   //desliga os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;ContadorFlash.c,67 :: 		intcon2 = 0; //liga resistor pull up do portb
	CLRF        INTCON2+0 
;ContadorFlash.c,68 :: 		ADC_init();// inicia o conversor ad
	CALL        _ADC_Init+0, 0
;ContadorFlash.c,69 :: 		}
L_end_setup_inicial:
	RETURN      0
; end of _setup_inicial
