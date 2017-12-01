*-----------------------------------------------------------
* Program    : ejercicio1_1.x68
* Written by : Luis Rincón Córcoles (URJC)
* Date       : Curso 2017/2018
* Description: Rutina de tratamiento de interrupciones de E/S
*-----------------------------------------------------------

**********************************************
*
* VECTORES DE EXCEPCIÓN
*
**********************************************

        memory  protected   0,$3FF

**********************************************
* Vectores de interrupción
**********************************************
        org     $64
RTIV1   dc.l    RTI1        Vector de interrupción nivel 1
RTIV2   dc.l    RTI2        Vector de interrupción nivel 2
RTIV3   dc.l    RTI3        Vector de interrupción nivel 3
RTIV4   dc.l    RTI4        Vector de interrupción nivel 4
RTIV5   dc.l    RTI5        Vector de interrupción nivel 5
RTIV6   dc.l    RTI6        Vector de interrupción nivel 6
RTIV7   dc.l    RTI7        Vector de interrupción nivel 7

**********************************************
*
* PROGRAMA PRINCIPAL
* (REGIÓN DE MEMORIA NO PROTEGIDA)
*
**********************************************
* CÓDIGO DEL PROGRAMA PRINCIPAL
**********************************************
        org     $400
*****
* Bucle que se ejecuta durante un número de ciclos
* dado por el contenido de la variable "ciclos"
*****
start_prg


        
* Poner a 0 el contador de ciclos
        move.b  #30,d0
        trap    #15
loop
*Apagar leds
        move.b  #%00000000,$E00010 
*Apagar Displays        
        MOVE.B #%00000000,DISPLAY1
        MOVE.B #%00000000,DISPLAY2 
        MOVE.B #%00000000,DISPLAY3        
        MOVE.B #%00000000,DISPLAY4
        MOVE.B #%00000000,DISPLAY5 
        MOVE.B #%00000000,DISPLAY6 
        MOVE.B #%00000000,DISPLAY7 
        MOVE.B #%00000000,DISPLAY8 
* Mirar cuántos ciclos lleva ejecutándose el programa
        move.b  #31,d0
        trap    #15
* Comparar: si d1 < ciclos, seguir en el bucle
        cmp.l   ciclos,d1
* En tal caso, seguir en el bucle
        blt     loop
**********************************************
* Imprimir por pantalla las veces que se ha ejecutado cada interrupción
**********************************************

*Numero de veces RTI1
        lea     CADENA1,a1
        move.l  cont1,d1
        move.b  #17,d0
        trap    #15
* Escribir un salto de línea
        lea     str_crlf,a1
        move.b  #14,d0
        trap    #15
        
*Numero de veces RTI2
        lea     CADENA2,a1
        move.l  cont2,d1
        move.b  #17,d0
        trap    #15
        
* Escribir un salto de línea
        lea     str_crlf,a1
        move.b  #14,d0
        trap    #15
        
*Numero de veces RTI3
        lea     CADENA3,a1
        move.l  cont3,d1
        move.b  #17,d0
        trap    #15
        
* Escribir un salto de línea
        lea     str_crlf,a1
        move.b  #14,d0
        trap    #15
        
*Numero de veces RTI4
        lea     CADENA4,a1
        move.l  cont4,d1
        move.b  #17,d0
        trap    #15
        
* Escribir un salto de línea
        lea     str_crlf,a1
        move.b  #14,d0
        trap    #15
        
*Numero de veces RTI5
        lea     CADENA5,a1
        move.l  cont5,d1
        move.b  #17,d0
        trap    #15
        
* Escribir un salto de línea
        lea     str_crlf,a1
        move.b  #14,d0
        trap    #15
        
*Numero de veces RTI6
        lea     CADENA6,a1
        move.l  cont6,d1
        move.b  #17,d0
        trap    #15
* Escribir un salto de línea
        lea     str_crlf,a1
        move.b  #14,d0
        trap    #15
        
*Numero de veces RTI7
        lea     CADENA7,a1
        move.l  cont7,d1
        move.b  #17,d0
        trap    #15        
       
* Terminar la ejecución del programa
end_prg move    #9,d0
        trap    #15

**********************************************
* DATOS DEL PROGRAMA PRINCIPAL
**********************************************
* Variable que indica cuántos ciclos durará la simulación
ciclos  dc.l    5000


**********************************************
*
* RUTINAS DE TRATAMIENTO DE EXCEPCIONES
*
**********************************************

        memory  protected   $2000,$4FFF
        org     $2000

**********************************************
* Manejador de interrupción 1
**********************************************

RTI1
*Encender el led 1
        move.b  #%00000010,$E00010
*DISPLAYS 
        MOVE.B #%00000000,DISPLAY1
        MOVE.B #%00000000,DISPLAY2 
        MOVE.B #%00000000,DISPLAY3        
        MOVE.B #%00000000,DISPLAY4
        MOVE.B #%00000000,DISPLAY5 
        MOVE.B #%00000000,DISPLAY6 
        MOVE.B #%00000110,DISPLAY7
        MOVE.B #%00000000,DISPLAY8   
* Salvar registros en pila
        movem.l d0/a1,-(a7)
* Escribir tira
        lea     str_int1,a1
        move.b  #14,d0
        trap    #15
* Escribir un salto de línea
        lea     str_crlf,a1
        move.b  #14,d0
        trap    #15
* Numero de veces que se contara esta interrupcion
        move.l  cont1,d0
        addi.l  #1,d0
        move.l  d0, cont1
*Encender el led 1
        move.b  #%00000010,$E00010        
* Restaurar registros y retornar
        movem.l (a7)+,d0/a1
        rte


**********************************************
* Manejador de interrupción 2
**********************************************

RTI2
*Encender el led 2
        move.b  #%00000100,$E00010 
*DISPLAYS 
        MOVE.B #%00000000,DISPLAY1
        MOVE.B #%00000000,DISPLAY2 
        MOVE.B #%00000000,DISPLAY3        
        MOVE.B #%00000000,DISPLAY4
        MOVE.B #%00000000,DISPLAY5 
        MOVE.B #%01011011,DISPLAY6 
        MOVE.B #%00000000,DISPLAY7
        MOVE.B #%00000000,DISPLAY8         
* Salvar registros en pila
        movem.l d0/a1,-(a7)
* Escribir tira
        lea     str_int2,a1
        move.b  #14,d0
        trap    #15
* Escribir un salto de línea
        lea     str_crlf,a1
        move.b  #14,d0
        trap    #15
* Numero de veces que se contara esta interrupcion
        move.l  cont2,d0
        addi.l  #1,d0
        move.l  d0, cont2
*Encender el led 2
        move.b  #%00000100,$E00010                
* Restaurar registros y retornar
        movem.l (a7)+,d0/a1
        rte


**********************************************
* Manejador de interrupción 3
**********************************************

RTI3
*Encender el led 1
        move.b  #%00001000,$E00010
*DISPLAYS 
        MOVE.B #%00000000,DISPLAY1
        MOVE.B #%00000000,DISPLAY2 
        MOVE.B #%00000000,DISPLAY3        
        MOVE.B #%00000000,DISPLAY4
        MOVE.B #%11001111,DISPLAY5 
        MOVE.B #%00000000,DISPLAY6 
        MOVE.B #%00000000,DISPLAY7
        MOVE.B #%00000000,DISPLAY8  
 

* Salvar registros en pila
        movem.l d0/a1,-(a7)
* Escribir tira
        lea     str_int3,a1
        move.b  #14,d0
        trap    #15
* Escribir un salto de línea
        lea     str_crlf,a1
        move.b  #14,d0
        trap    #15
        
* Numero de veces que se contara esta interrupcion
        move.l  cont3,d0
        addi.l  #1,d0
        move.l  d0, cont3
*Encender el led 1
        move.b  #%00001000,$E00010 
* Restaurar registros y retornar
        movem.l (a7)+,d0/a1
        rte


**********************************************
* Manejador de interrupción 4
**********************************************

RTI4
*Encender el led 4
        move.b  #%00010000,$E00010
*DISPLAYS 
        MOVE.B #%00000000,DISPLAY1
        MOVE.B #%00000000,DISPLAY2 
        MOVE.B #%00000000,DISPLAY3        
        MOVE.B #%01100110,DISPLAY4
        MOVE.B #%00000000,DISPLAY5 
        MOVE.B #%00000000,DISPLAY6 
        MOVE.B #%00000000,DISPLAY7
        MOVE.B #%00000000,DISPLAY8  
* Salvar registros en pila
        movem.l d0/a1,-(a7)
* Escribir tira
        lea     str_int4,a1
        move.b  #14,d0
        trap    #15
* Escribir un salto de línea
        lea     str_crlf,a1
        move.b  #14,d0
        trap    #15
        
* Numero de veces que se contara esta interrupcion
        move.l  cont4,d0
        addi.l  #1,d0
        move.l  d0, cont4

* Restaurar registros y retornar
        movem.l (a7)+,d0/a1
        rte


**********************************************
* Manejador de interrupción 5
**********************************************

RTI5
*Encender el led 5
        move.b  #%00100000,$E00010
        
*DISPLAYS
        MOVE.B #%00000000,DISPLAY1
        MOVE.B #%00000000,DISPLAY2 
        MOVE.B #%01101101,DISPLAY3        
        MOVE.B #%00000000,DISPLAY4
        MOVE.B #%00000000,DISPLAY5 
        MOVE.B #%00000000,DISPLAY6 
        MOVE.B #%00000000,DISPLAY7        
        MOVE.B #%00000000,DISPLAY8


* Salvar registros en pila
        movem.l d0/a1,-(a7)
* Escribir tira
        lea     str_int5,a1
        move.b  #14,d0
        trap    #15
* Escribir un salto de línea
        lea     str_crlf,a1
        move.b  #14,d0
        trap    #15
* Numero de veces que se contara esta interrupcion
        move.l  cont5,d0
        addi.l  #1,d0
        move.l  d0, cont5
              
* Restaurar registros y retornar
        movem.l (a7)+,d0/a1
        rte


**********************************************
* Manejador de interrupción 6
**********************************************

RTI6
*Encender el led 6
        move.b  #%01000000,$E00010 
*DISPLAYS
        MOVE.B #%00000000,DISPLAY1
        MOVE.B #%11111101,DISPLAY2 
        MOVE.B #%00000000,DISPLAY3        
        MOVE.B #%00000000,DISPLAY4
        MOVE.B #%00000000,DISPLAY5 
        MOVE.B #%00000000,DISPLAY6 
        MOVE.B #%00000000,DISPLAY7        
        MOVE.B #%00000000,DISPLAY8
* Salvar registros en pila
        movem.l d0/a1,-(a7)
* Escribir tira
        lea     str_int6,a1
        move.b  #14,d0
        trap    #15
* Escribir un salto de línea
        lea     str_crlf,a1
        move.b  #14,d0
        trap    #15
* Numero de veces que se contara esta interrupcion
        move.l  cont6,d0
        addi.l  #1,d0
        move.l  d0, cont6
 


         
* Restaurar registros y retornar
        movem.l (a7)+,d0/a1
        rte


**********************************************
* Manejador de interrupción 7
**********************************************

RTI7
*Funcion interruptor led 7
        MOVE.B SWITCHES,D1 
        move.b  D1,$E00010 
*DISPLAYS 
        MOVE.B #%00000111,DISPLAY1
        MOVE.B #%00000000,DISPLAY2 
        MOVE.B #%00000000,DISPLAY3        
        MOVE.B #%00000000,DISPLAY4
        MOVE.B #%00000000,DISPLAY5 
        MOVE.B #%00000000,DISPLAY6 
        MOVE.B #%00000000,DISPLAY7
        MOVE.B #%00000000,DISPLAY8 
* Salvar registros en pila
        movem.l d0/a1,-(a7)
* Escribir tira
        lea     str_int7,a1
        move.b  #14,d0
        trap    #15
* Escribir un salto de línea
        lea     str_crlf,a1
        move.b  #14,d0
        trap    #15
* Numero de veces que se contara esta interrupcion
        move.l  cont7,d0
        addi.l  #1,d0
        move.l  d0, cont7


* Restaurar registros y retornar
        movem.l (a7)+,d0/a1
        rte



**********************************************
* Constantes, variables y tiras de caracteres
**********************************************

LF      equ     10
CR      equ     13
NULL    equ     0
LEDES   equ     $E00010
SWITCHES EQU $E00012
DISPLAY1 EQU $E00000
DISPLAY2 EQU $E00002
DISPLAY3 EQU $E00004
DISPLAY4 EQU $E00006
DISPLAY5 EQU $E00008 
DISPLAY6 EQU $E0000A
DISPLAY7 EQU $E0000C
DISPLAY8 EQU $E0000E 

str_int1
        dc.b    'INT 1',NULL
str_int2
        dc.b    'INT 2',NULL
str_int3
        dc.b    'INT 3',NULL
str_int4
        dc.b    'INT 4',NULL
str_int5
        dc.b    'INT 5',NULL
str_int6
        dc.b    'INT 6',NULL
str_int7
        dc.b    'INT 7',NULL
str_crlf
        dc.b    CR,LF,NULL
        
cont1
        dc.l    0
cont2
        dc.l    0
cont3
        dc.l    0  
cont4
        dc.l    0  
cont5
        dc.l    0  
cont6
        dc.l    0  
cont7
        dc.l    0 
        
CADENA1
        dc.b    'Numero de veces que se ha llamado a la interrupcion 1 es ', NULL
CADENA2
        dc.b    'Numero de veces que se ha llamado a la interrupcion 2 es ', NULL
CADENA3
        dc.b    'Numero de veces que se ha llamado a la interrupcion 3 es ', NULL
CADENA4
        dc.b    'Numero de veces que se ha llamado a la interrupcion 4 es ', NULL
CADENA5
        dc.b    'Numero de veces que se ha llamado a la interrupcion 5 es ', NULL
CADENA6
        dc.b    'Numero de veces que se ha llamado a la interrupcion 6 es ', NULL
CADENA7
        dc.b    'Numero de veces que se ha llamado a la interrupcion 7 es ', NULL

        end     start_prg
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
