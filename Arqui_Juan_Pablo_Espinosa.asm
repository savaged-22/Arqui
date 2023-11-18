Inicio:      
        MOV ACC, VAR_A       ;ACC almacena VAR_A, que es diferente al registro A
        MOV DPTR, ACC        ;DPTR almacena VAR_A
        MOV ACC, 0x00        ;Cargamos una constante en ACC
        MOV [DPTR], ACC      ;VAR_A inicializada en 0000 0000
Inicializar_Count:
        MOV ACC, Count       ;ACC almacena Count n-bits
        MOV DPTR, ACC        ;DPTR almacena Count
        MOV ACC, 0b00001000  ;ACC almacena 0000 1000 (8 en decimal)
        MOV [DPTR], ACC      ;Count almacena 0000 1000
Inicializar_Q-1:
        MOV ACC, Q-1         ;ACC almacena Q-1
        MOV DPTR, ACC        ;DPTR almacena Q-1
        MOV ACC, 0x00        ;Cargamos una constante en ACC
        MOV [DPTR], ACC      ;Q-1 almacena 0000 0000
Calcular_Q0:         
        MOV ACC, Q           ;ACC almacena Q
        MOV DPTR, ACC        ;DPTR almacena Q
        MOV ACC, [DPTR]      ;ACC almacena el valor que contiene el apuntador
        MOV A, ACC           ;A almacena el valor del acumulador
        MOV ACC, 0b00000001  ;ACC almacena el número 0000 0001 
        AND ACC, A           ;ACC almacena la operación AND de 0000 0001 con el valor de Q
        MOV A, ACC           ;A almacena el resultado de la operación AND
Guardar_Q0:
        MOV ACC, Q0          ;ACC almacena Q0
        MOV DPTR, ACC        ;DPTR almacena Q0
        MOV ACC, A           ;ACC almacena el valor del registro A
        MOV [DPTR], ACC      ;Q0 almacena el valor del acumulador
Preguntar_Q-1=0: 
        MOV ACC, Q0          ;ACC almacena Q0
        MOV DPTR, ACC        ;DPTR almacena el valor que contiene ACC
        MOV ACC, [DPTR]      ;ACC almacena el valor que contiene el apuntador
        MOV A, ACC           ;A almacena el valor del acumulador
        MOV ACC, Q-1         ;ACC almacena Q-1  
        MOV DPTR, ACC        ;DPTR almacena Q-1
        MOV ACC, [DPTR]      ;ACC almacena 0000 0000  
        MOV DPTR, ACC        ;Movemos la variable al registro A para la bandera
        JZ Preguntar_0-      ;Saltamos a la instrucción que pregunta por 0  
Preguntar_-1:
        MOV ACC, A           ;ACC almacena el valor del registro A 
        JZ Hacer_01          ;Saltamos a la instrucción que opera por el 01
Preguntar_0-:
        MOV ACC, A           ;ACC almacena el valor del registro A
        JZ DesplazarAritmetico  ;Saltamos a la instrucción que desplaza por aritmética
        MOV ACC, [DPTR]      ;ACC almacena la dirección de memoria del DPTR
        JZ Hacer_10          ;Saltamos a la instrucción que realiza el caso 10
Hacer_11:
        JMP DesplazarAritmetico  ;Saltamos a la instrucción que desplaza por aritmética
Hacer_10:
        MOV ACC, M           ;ACC almacena M
        MOV DPTR, ACC        ;DPTR almacena M
        MOV ACC, [DPTR]      ;ACC almacena el valor que contiene el apuntador
        INV ACC              ;Invertimos M
        MOV A, ACC           ;Movemos el acumulador al registro A
        MOV ACC, 0b00000001  ;Cargamos una constante 1
        ADD ACC, A           ;Hacemos el complemento A2 de M
        MOV A, ACC           ;A almacena - M en el registro A
        MOV ACC, VAR_A       ;ACC almacena VAR_A
        MOV DPTR, ACC        ;DPTR almacena VAR_A
        MOV ACC, [DPTR]      ;ACC almacena 0000 0000
        ADD ACC, A           ;Sumamos A y -M 
        MOV [DPTR], ACC      ;VAR_A almacena A-M
        JMP DesplazarAritmetico  ;Saltamos a la instrucción que desplaza por aritmética
Hacer_01:
        MOV ACC, M           ;ACC almacena M
        MOV DPTR, ACC        ;DPTR almacena M
        MOV ACC, [DPTR]      ;ACC almacena 0000 0011
        MOV A, ACC           ;R almacena 0000 0011
        MOV ACC, VAR_A       ;ACC almacena VAR_A
        MOV DPTR, ACC        ;DPTR almacena VAR_A
        MOV ACC, [DPTR]      ;ACC almacena 0000 00000
        ADD ACC, A           ;Sumamos 0000 0000 con 0000 0011
        MOV [DPTR], ACC      ;VAR_A almacena 0000 0011
DesplazarAritmetico:
        MOV ACC, Q0          ;ACC almacena Q0
        MOV DPTR, ACC        ;DPTR almacena Q0
        MOV ACC, [DPTR]      ;ACC almacena el valor que contiene el apuntador
        MOV A, ACC           ;A almacena el valor del acumulador
        MOV ACC, Q-1         ;ACC almacena Q-1
        MOV DPTR, ACC        ;DPTR almacena Q-1
        MOV ACC, A           ;ACC almacena el valor del registro A
        MOV [DPTR], ACC      ;Q-1 almacena el valor del acumulador
Obtener_VAR_A0:
        MOV ACC, VAR_A       ;ACC almacena VAR_A
        MOV DPTR, ACC        ;DPTR almacena VAR_A
        MOV ACC, [DPTR]      ;ACC almacena el valor que contiene el apuntador
        MOV A, ACC           ;A almacena el valor del acumulador
        MOV ACC, 0b00000001  ;ACC almacena una constante 
        AND ACC, A           ;Calculamos AND entre los valores del registro A y el acumulador
        MOV A, ACC           ;A almacena el valor del acumulador
        JZ DesplazarDerecha_Q  ;Saltamos a la instrucción que desplaza Q
        MOV ACC, 0b10000000  ;ACC almacena una constante
DesplazarDerecha_Q:
        MOV ACC, Q           ;ACC almacena Q
        MOV DPTR, ACC        ;DPTR almacena Q
        MOV ACC, [DPTR]      ;ACC almacena el valor que contiene el apuntador
        RSH ACC, 0x1         ;Desplazamos un bit a la derecha 
        ADD ACC, A           ;Sumamos los valores del registro A y el acumulador
        MOV [DPTR], ACC      ;Q almacena el valor del acumulador
Empezar_A:
        MOV ACC, VAR_A       ;ACC almacena VAR_A
        MOV DPTR, ACC        ;DPTR almacena VAR_A
        MOV ACC, [DPTR]      ;ACC almacena el valor que contiene el apuntador
        MOV A, ACC           ;A almacena el valor del acumulador
        MOV ACC, 0b10000000  ;ACC almacena una constante
        AND ACC, A           ;Calculamos AND entre el valor del acumulador y el registro A
        MOV A, ACC           ;A almacena el valor del acumulador
        MOV ACC, [DPTR]      ;ACC almacena el valor que contiene el DPTR 
Desplazar_A:
        RSH ACC, 0x1         ;Desplazamos un bit a la derecha 
        ADD ACC, A           ;Sumamos el valor del acumulador y el registro A
        MOV [DPTR], ACC      ;VAR_A almacena el valor del acumulador
Cargamos_Count: 
        MOV ACC, Count       ;ACC almacena la variable Count
        MOV DPTR, ACC        ;DPTR almacena la dirección de memoria del acumulador
        MOV ACC, [DPTR]      ;ACC almacena el valor que contiene el apuntador
        MOV A, ACC           ;A almacena el valor del acumulador
        MOV ACC, 0b11111111  ;ACC almacena una constante
        ADD ACC, A           ;Sumamos Count y -1 
Guardar_Count:
        MOV [DPTR], ACC      ;Count almacena el valor del acumulador
        JZ Terminar_Algoritmo  ;Verificación de 0 y saltamos a la instrucción que guarda los resultados
        JMP Calcular_Q0      ;Saltamos a la instrucción que calcula Q0 para el ciclo
Terminar_Algoritmo:
        HLT                  ;Terminación del programa

Inicialización de las variables: 
VAR_A	: 0b0 
Q: 0b10010100; Multiplicador
Q-1: 0b0
M: 0b00101000; Multiplicando
Count: 0x8
Q0: 0b0

;Rúbrica de instrucciones adicionales del PDUA:

;OPCODE: 	NEMÓNICO:	Bytes: 
; 01000xxx	AND ACC, A 	1
; 1xxxxxxx	SHR ACC		1




