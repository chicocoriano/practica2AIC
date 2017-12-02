
**********************************************
*
* VECTORES DE EXCEPCIÓN
* Se encuentran en las direcciones 0-$3FF
*
**********************************************

        memory  protected   0,$3FF
* El vector de la RTE de división por 0
* se encuentra en la dirección $14
		org		$14
vrtediv0
        dc.l	rtediv0


**********************************************
*
* PROGRAMA PRINCIPAL
* (REGIÓN DE MEMORIA NO PROTEGIDA)
*
**********************************************
		org		$400
main
*****
* Introducir dividendo
*****
pedir_dividendo
        lea     tira_dividendo,a1
        move.b  #18,d0
        trap    #15
        move.l  d1,dividendo
*****
* Introducir divisor en d3
*****
pedir_divisor
        lea     tira_divisor,a1
        move.b  #18,d0
        trap    #15
        move.l  d1,divisor
*****
* Dividir
*****
dividir
        move.l  dividendo,d2
        move.l  divisor,d3
        divs    d3,d2
*****
* Guardar cociente
*****
guardar_cociente
        clr.l   d4
        move.w  d2,d4
        move.l  d4,cociente
*****
* Guardar resto
*****
guardar_resto
        clr.l   d4
        swap    d2
        move.w  d2,d4
        move.l  d4,resto
*****
* Escribir cociente
*****
escribir_cociente
        lea     tira_cociente,a1
        move.b  #17,d0
        move.l  cociente,d1
        trap    #15
*****
* Escribir resto
*****
escribir_resto
        lea     tira_resto,a1
        move.b  #17,d0
        move.l  resto,d1
        trap    #15
*****
* Saltar de línea
*****
        lea     tira_crlf,a1
        move.b  #14,d0
        trap    #15
*****
* Terminar la ejecución del programa
*****
end_prg move    #9,d0
        trap    #15


**********************************************
*
* Zona de datos del programa principal
*
**********************************************
        org     $1000
**********************************************
* Constantes
**********************************************

LF      equ     10
CR      equ     13
NULL    equ     0

**********************************************
* Variables
**********************************************
dividendo   ds.l    1
divisor     ds.l    1
cociente    ds.l    1
resto       ds.l    1

**********************************************
* Tiras de caracteres
**********************************************

tira_dividendo
        dc.b    'Dividendo: ',NULL
tira_divisor
        dc.b    'Divisor:   ',NULL
tira_cociente
        dc.b    'Cociente: ',NULL
tira_resto
        dc.b    ' // Resto: ',NULL
tira_crlf
        dc.b    CR,LF,NULL
tira_repetir
        dc.b    'Valor 0 no valido, vuelva a introducir un divisor : ',NULL        


**********************************************
*
* RUTINAS DE TRATAMIENTO DE EXCEPCIONES
*
**********************************************

        memory  protected   $2000,$2FFF
        org     $2000


rtediv0

* Escribir tira
        lea     tira_repetir,a1
        move.b  #14,d0
        trap    #15
        
* Escribir un salto de línea
        lea     tira_crlf,a1
        move.b  #14,d0
        trap    #15
        
        MOVE.L  #68288512,4(sp)


        rte



**********************************************
*
* FIN DEL CÓDIGO
*
**********************************************

		end		main

	







*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
