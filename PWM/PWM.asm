
_main:

;PWM.c,18 :: 		void main(){
;PWM.c,19 :: 		setupInicial();
	CALL        _setupInicial+0, 0
;PWM.c,20 :: 		pwm1_init(20000);//frequencia de 20KHZ
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;PWM.c,21 :: 		pwm1_set_duty(duty_cycle);//inicia o pwm com zero
	MOVF        _duty_cycle+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;PWM.c,22 :: 		pwm1_start();//pwm ligado
	CALL        _PWM1_Start+0, 0
;PWM.c,23 :: 		while(1) {
L_main0:
;PWM.c,24 :: 		if(rb0_bit == 0){
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main2
;PWM.c,25 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;PWM.c,26 :: 		if(rb0_bit == 0);
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main4
L_main4:
;PWM.c,27 :: 		if(duty_cycle < 255) duty_cycle ++;
	MOVLW       255
	SUBWF       _duty_cycle+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main5
	INCF        _duty_cycle+0, 1 
L_main5:
;PWM.c,28 :: 		}
L_main2:
;PWM.c,29 :: 		if(rb1_bit == 0){
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main6
;PWM.c,30 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
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
;PWM.c,31 :: 		if(rb1_bit == 0);
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main8
L_main8:
;PWM.c,32 :: 		if(duty_cycle < 255) duty_cycle --;
	MOVLW       255
	SUBWF       _duty_cycle+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main9
	DECF        _duty_cycle+0, 1 
L_main9:
;PWM.c,33 :: 		}
L_main6:
;PWM.c,34 :: 		pwm1_set_duty(duty_cycle);//atribui ao pw o valor ao duty;
	MOVF        _duty_cycle+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;PWM.c,35 :: 		}
	GOTO        L_main0
;PWM.c,36 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_setupInicial:

;PWM.c,38 :: 		void setupInicial() {
;PWM.c,39 :: 		porta = 0;
	CLRF        PORTA+0 
;PWM.c,40 :: 		portb = 0;
	CLRF        PORTB+0 
;PWM.c,41 :: 		portc = 0;
	CLRF        PORTC+0 
;PWM.c,42 :: 		portd = 0;
	CLRF        PORTD+0 
;PWM.c,43 :: 		porte = 0;
	CLRF        PORTE+0 
;PWM.c,45 :: 		trisa = 0;        // PORTA como saída
	CLRF        TRISA+0 
;PWM.c,46 :: 		trisb = 15;
	MOVLW       15
	MOVWF       TRISB+0 
;PWM.c,47 :: 		trisc = 0;      // RC7 (RX) como entrada
	CLRF        TRISC+0 
;PWM.c,48 :: 		trisd = 0;        // PORTD como saída
	CLRF        TRISD+0 
;PWM.c,49 :: 		trise = 0;        // PORTE como saída
	CLRF        TRISE+0 
;PWM.c,51 :: 		adcon1 = 15;      // Todas são entradas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;PWM.c,52 :: 		cmcon = 7;        // Desliga os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;PWM.c,53 :: 		intcon2 = 0;      // Liga resistor pull-up do PORTB
	CLRF        INTCON2+0 
;PWM.c,54 :: 		}
L_end_setupInicial:
	RETURN      0
; end of _setupInicial
